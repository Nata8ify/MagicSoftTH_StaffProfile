package com.n8ify.mgs.stffp.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.jdbc.MysqlDataTruncation;
import com.n8ify.mgs.stffp.dealer.StaffBinder;
import com.n8ify.mgs.stffp.dealer.StaffManager;
import com.n8ify.mgs.stffp.excp.UnauthorizedAccessException;
import com.n8ify.mgs.stffp.model.Staff;
import com.n8ify.mgs.stffp.utils.Generator;
import com.n8ify.mgs.stffp.utils.ModelBody;

@Controller
public class StaffManagentController {

	private static final Logger logger = LoggerFactory.getLogger(StaffManagentController.class);

	@Autowired
	private StaffManager staffManager;

	@Autowired
	private StaffBinder staffBinder;

	@Autowired
	private CommonsMultipartResolver multipartResolver;

	private final String PORTRAIT_DIR = "/resources/portraits/";
	private final String RESULT_PATH = "result/result";
	private final String MANAGE_PATH = "manage/manage";

	public void authenCheck(HttpServletRequest request) throws UnauthorizedAccessException {
		Staff accessStaff = (Staff) request.getSession(false).getAttribute("thisStaff");
		if (accessStaff == null)
			throw new UnauthorizedAccessException();
		logger.info(">>>>" + accessStaff.getStaffType());
		if (!accessStaff.getStaffType().equals(Staff.TYPE_ADMINISTRATOR))
			throw new UnauthorizedAccessException();
	}

	@RequestMapping(value = "/adm/manage", method = RequestMethod.GET)
	public String toManage(HttpServletRequest request) throws UnauthorizedAccessException {
		authenCheck(request);
		return "manage/manage";
	}

	@RequestMapping(value = "/adm/managechoice", method = RequestMethod.GET)
	public String toManageByCase(Model model, HttpServletRequest request,
			@RequestParam(value = "to", required = true) String to) throws UnauthorizedAccessException {
		authenCheck(request);
		switch (to) {
		case "addstaff":
			model.addAttribute("manage", "add");
			break;
		case "mngeditor":
			model.addAttribute("manage", "mngeditor");
			break;
		default:
			model.addAttribute("manage", "explore");
			break;
		}
		return "manage/manage";
	}

	@RequestMapping(value = "/adm/insertPerson", method = RequestMethod.POST)
	public String insertPerson(Model model, HttpServletRequest request,
			@RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "honorific", required = false) String honorific,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "nameLocale", required = false) String nameLocale,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "tel", required = true) String tel,
			@RequestParam(value = "mobileTel", required = false) String mobileTel,
			@RequestParam(value = "division", required = true) String division,
			@RequestParam(value = "position", required = true) String position,
			@RequestParam(value = "protraitPath", required = false) String protraitPath,
			@RequestParam(value = "hostManagerId", required = false) String hostManagerId,
			@RequestParam(value = "password", required = false, defaultValue = "") String password,
			@RequestParam(value = "insertType", required = true) String insertType) throws UnauthorizedAccessException { // insertType
																															// is
																															// staffType.
		// Checking Is this an Administrator Account Roll.
		authenCheck(request);
		switch (insertType) {
		case Staff.TYPE_STAFF:
			if (staffManager.insertStaff(
					new Staff(staffId, name, nameLocale, email, tel, mobileTel, division, position, protraitPath,
							hostManagerId.isEmpty() ? null : hostManagerId, honorific, insertType),
					password.equals("") ? Generator.getInstance().genPassword() : password)) {
				model.addAttribute("msg", "done");
			} else {
				model.addAttribute("msg", "undone");
			}
			break;
		case Staff.TYPE_MANAGER:
			break;
		case Staff.TYPE_ADMINISTRATOR:
			break;
		default: // TODO
		}
		return "redirect:managechoice?to=addstaff";
	}

	@RequestMapping(value = "/adm/editPerson", method = RequestMethod.POST)
	public String editPerson(Model model, HttpServletRequest request,
			@RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "honorific", required = false) String honorific,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "nameLocale", required = false) String nameLocale,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "tel", required = true) String tel,
			@RequestParam(value = "mobileTel", required = false) String mobileTel,
			@RequestParam(value = "division", required = true) String division,
			@RequestParam(value = "position", required = true) String position,
			@RequestParam(value = "protraitPath", required = false) String protraitPath,
			@RequestParam(value = "hostManagerId", required = false) String hostManagerId,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "editType", required = true) String staffType, // editType
																					// is
																					// staffType.
			@RequestParam(value = "prevEditType", required = true) String prevStaffType)
			throws UnauthorizedAccessException {
		authenCheck(request);
		if (staffManager.editStaff(new Staff(staffId, name, nameLocale, email, tel, mobileTel, division, position, null,
				hostManagerId, honorific, staffType), password)) {
			if (prevStaffType.equals(Staff.TYPE_MANAGER) && staffType.equals(Staff.TYPE_STAFF)) { // If
																									// Manager
																									// became
																									// a
																									// staff
																									// then..
																									// unbind
																									// staff;
				staffBinder.unbindStaffFromManager(staffId); // <-- This Id is
																// surely
																// Manager.
			}
			model.addAttribute("msg", "done");
		} else {
			model.addAttribute("msg", "undone");
		}
		return "redirect:managechoice?to=explore";
	}

	@RequestMapping(value = "/adm/deletePerson", method = RequestMethod.POST)
	public String insertPerson(Model model, HttpServletRequest request,
			@RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "staffType", required = true) String staffType,
			@RequestParam(value = "ajax", required = true, defaultValue = "false") boolean ajax)
			throws UnauthorizedAccessException {
		// Checking Is this an Administrator Account Roll.
		authenCheck(request);
		boolean isSuccessDelete = staffManager.deleteStaffById(staffId, staffType);
		if (staffManager.deleteStaffById(staffId, staffType)) {
			if (ajax) {
				model.addAttribute("results", isSuccessDelete);
				return RESULT_PATH;
			}
			model.addAttribute("msg", "สำเร็จ!");
		} else {
			model.addAttribute("msg", "ไม่สำเร็จ!");
		}
		return "redirect:managechoice?to=explore";
	}

	@RequestMapping(value = "/editSelf", method = RequestMethod.POST)
	public String editSelf(Model model, HttpServletRequest request,
			@RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "nameLocale", required = false) String nameLocale,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "tel", required = true) String tel,
			@RequestParam(value = "mobileTel", required = false) String mobileTel,
			@RequestParam(value = "protraitPath", required = false) String protraitPath,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "editType", required = false) String editType) { // editType
																					// is
																					// staffType.

		if (staffManager.editSelfStaff(new Staff(staffId, name, nameLocale, email, tel, mobileTel,
				protraitPath.equals("") ? null : protraitPath), password)) {
			logger.info("UPDATED");
			return "redirect:login?staffId=" + staffId + "&password=" + password;
		}
		logger.info("NO UPDATE");
		return "home";
	}

	@RequestMapping(value = "/adm/editPerson.f", method = RequestMethod.POST)
	public String editPersonWithPortrait(Model model, HttpServletRequest request,
			@RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "honorific", required = true) String honorific,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "nameLocale", required = false) String nameLocale,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "tel", required = true) String tel,
			@RequestParam(value = "mobileTel", required = false) String mobileTel,
			@RequestParam(value = "division", required = true) String division,
			@RequestParam(value = "position", required = true) String position,
			@RequestParam(value = "protraitPathOld", required = false) String protraitPathOld,
			@RequestParam(value = "protraitPath", required = false) MultipartFile img,
			@RequestParam(value = "hostManagerId", required = false) String hostManagerId,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "prevEditType", required = true) String prevStaffType,
			@RequestParam(value = "editType", required = true) String staffType) // editType
																					// is
																					// staffType.
			throws IllegalStateException, IOException, UnauthorizedAccessException {
		authenCheck(request);
		MultipartHttpServletRequest mrequest = multipartResolver.resolveMultipart(request);
		Staff staff = new Staff(staffId, name, nameLocale, email, tel, mobileTel, division, position, null,
				hostManagerId, honorific, staffType);
		logger.info(staff.toString() + " PWD : " + password);

		if (img != null) { // If Have a deal on O=Portrait.. Do this cond.
			String imgName = img.isEmpty() ? Staff.getStaffInstance().getProtraitPath()
					: Generator.getInstance().genImageName(img.getOriginalFilename());
			if (!img.isEmpty()) {
				img.transferTo(new File(mrequest.getRealPath(PORTRAIT_DIR) + imgName));
				logger.info("protraitInputName : " + protraitPathOld);
				File oldImg = new File(mrequest.getRealPath(PORTRAIT_DIR + protraitPathOld));
				oldImg.delete();
				if (staffManager.editStaff(new Staff(staffId, name, nameLocale, email, tel, mobileTel, division,
						position, imgName, hostManagerId, honorific, staffType), password)) {
					logger.info("prev " + prevStaffType + " ::: new " + staffType);
					if (prevStaffType.equals(Staff.TYPE_MANAGER) && staffType.equals(Staff.TYPE_STAFF)) { // If
																											// Manager
																											// became
																											// a
																											// staff
																											// then..
																											// unbind
																											// staff;
						logger.info("TRUE UNB");
						staffBinder.unbindStaffsFromManager(staffId); // <--
																		// This
																		// Id is
																		// surely
																		// Manager.
					}
					model.addAttribute("msg", "สำเร็จ!");
				} else {
					model.addAttribute("msg", "ไม่สำเร็จ!");
				}
			} else { // <-- Need Test
				if (staffManager.editStaffForNoImage( // Which mean KEEP NO
														// CHANGE/Unset
						new Staff(staffId, name, nameLocale, email, tel, mobileTel, division, position, null,
								hostManagerId, honorific, staffType),
						password)) {
					if (prevStaffType.equals(Staff.TYPE_MANAGER) && staffType.equals(Staff.TYPE_STAFF)) { // If
																											// Manager
																											// became
																											// a
																											// staff
																											// then..
																											// unbind
																											// staff;
						staffBinder.unbindStaffsFromManager(staffId); // <--
																		// This
																		// Id is
																		// surely
																		// Manager.
					}
					model.addAttribute("msg", "สำเร็จ!");
				} else {
					model.addAttribute("msg", "ไม่สำเร็จ!");
				}
			}
		} else {// Portrait not even empty but it's NULL and then go reset.
			File oldImg = new File(mrequest.getRealPath(PORTRAIT_DIR + Staff.getStaffInstance().getProtraitPath()));
			oldImg.delete();
			if (staffManager.editStaff(new Staff(staffId, name, nameLocale, email, tel, mobileTel, division, position,
					null, hostManagerId, honorific, staffType), password)) {
				logger.info("prev " + prevStaffType + " ::: new " + staffType);
				if (prevStaffType.equals(Staff.TYPE_MANAGER) && staffType.equals(Staff.TYPE_STAFF)) { // If
																										// Manager
																										// became
																										// a
																										// staff
																										// then
																										// unbind
																										// staff;
					logger.info("TRUE UNB");
					staffBinder.unbindStaffsFromManager(staffId); // <-- This Id
																	// is surely
																	// Manager.
				}
				model.addAttribute("msg", "สำเร็จ!");
			} else {
				model.addAttribute("msg", "ไม่สำเร็จ!");
			}
		}
		return "redirect:managechoice?to=explore";
	}

	@RequestMapping(value = "/editSelf.f", method = RequestMethod.POST, headers = "content-type=multipart/*")
	public String editSelfWithPortrait(Model model, HttpServletRequest request,
			@RequestParam(value = "protraitPath", required = false) MultipartFile img)
			throws IllegalStateException, IOException {
		logger.info("IS MULT : " + multipartResolver.isMultipart(request));
		MultipartHttpServletRequest mrequest = multipartResolver.resolveMultipart(request);
		if (img != null) {
			String imgName = img.isEmpty() ? Staff.getStaffInstance().getProtraitPath()
					: Generator.getInstance().genImageName(img.getOriginalFilename());
			if (!img.isEmpty()) {
				img.transferTo(new File(mrequest.getRealPath(PORTRAIT_DIR) + imgName));
				File oldImg = new File(mrequest.getRealPath(PORTRAIT_DIR + Staff.getStaffInstance().getProtraitPath()));
				oldImg.delete();
			}

			if (staffManager.editSelfStaff(
					new Staff(mrequest.getParameter("staffId"), mrequest.getParameter("name"),
							mrequest.getParameter("nameLocale"), mrequest.getParameter("email"),
							mrequest.getParameter("tel"), mrequest.getParameter("mobileTel"), imgName),
					mrequest.getParameter("password"))) {

				return "redirect:login?staffId=" + mrequest.getParameter("staffId") + "&password="
						+ mrequest.getParameter("password");

			}
		} else {
			File oldImg = new File(mrequest.getRealPath(PORTRAIT_DIR + Staff.getStaffInstance().getProtraitPath()));
			oldImg.delete();
			if (staffManager.editSelfStaff(
					new Staff(mrequest.getParameter("staffId"), mrequest.getParameter("name"),
							mrequest.getParameter("nameLocale"), mrequest.getParameter("email"),
							mrequest.getParameter("tel"), mrequest.getParameter("mobileTel"), null),
					mrequest.getParameter("password"))) {

				return "redirect:login?staffId=" + mrequest.getParameter("staffId") + "&password="
						+ mrequest.getParameter("password");
			}
		}
		return "home";
	}

	@RequestMapping(value = "/adm/insertPerson.f", method = RequestMethod.POST, headers = "content-type=multipart/*")
	public String insertPersonWithPortrait(Model model, HttpServletRequest request,
			@RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "honorific", required = true) String honorific,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "nameLocale", required = false) String nameLocale,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "tel", required = true) String tel,
			@RequestParam(value = "mobileTel", required = false) String mobileTel,
			@RequestParam(value = "division", required = true) String division,
			@RequestParam(value = "position", required = true) String position,
			@RequestParam(value = "hostManagerId", required = false) String hostManagerId,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "insertType", required = true) String insertType, // insertType
																					// is
																					// staffType.
			MultipartHttpServletRequest mrequest, @RequestParam(value = "protraitPath") MultipartFile img)
			throws IllegalStateException, IOException, UnauthorizedAccessException {
		// Checking Is this an Administrator Account Roll.
		authenCheck(request);
		logger.info(hostManagerId);
		String imgName = img.isEmpty() ? null : Generator.getInstance().genImageName(img.getOriginalFilename());
		if (staffManager.insertStaff(
				new Staff(staffId, name, nameLocale, email, tel, mobileTel, division, position, imgName,
						hostManagerId.isEmpty() ? null : hostManagerId, honorific, insertType),
				password.equals("") ? Generator.getInstance().genPassword() : password)) {
			img.transferTo(new File(mrequest.getRealPath(PORTRAIT_DIR) + imgName));
			model.addAttribute("msg", "สำเร็จ!");
		} else {
			model.addAttribute("msg", "ไม่สำเร็จ!");
		}
		return "redirect:managechoice?to=add";
	}

	@ExceptionHandler({ UnauthorizedAccessException.class })
	public ModelAndView nullAccountException(UnauthorizedAccessException npex) {
		ModelAndView mav = new ModelAndView("result/errpage");
		return ModelBody.setErrorBody(HttpStatus.INTERNAL_SERVER_ERROR, ModelBody.ERR_ICO_UNAUTH, "Oops!",
				"This Section is Authorized for Administrator.", mav);
	}

	@ExceptionHandler({ MysqlDataTruncation.class })
	public ModelAndView staffInfotruncationException(MysqlDataTruncation mdtex) {
		ModelAndView mav = new ModelAndView("result/errpage");
		return ModelBody.setErrorBody(HttpStatus.INTERNAL_SERVER_ERROR, ModelBody.ERR_ICO_ERROR, "Oops!",
				"Some of your Information is Invalid form, Please Check.", mav);
	}
}
