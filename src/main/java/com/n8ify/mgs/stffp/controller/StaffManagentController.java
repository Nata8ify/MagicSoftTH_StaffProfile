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
	private CommonsMultipartResolver multipartResolver;

	private final String PORTRAIT_DIR = "/resources/portraits/";
	private final String RESULT_PATH = "result/result";
	private final String MANAGE_PATH = "manage/manage";

	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String toManage(HttpServletRequest request) throws UnauthorizedAccessException {
		// HttpServletRequest request
		// if(request.getSession(false).getAttribute("thisStaff"))));
		permitCheck(request);
		return "manage/manage";
	}

	@RequestMapping(value = "/managechoice", method = RequestMethod.GET)
	public String toManageByCase(Model model, HttpServletRequest request,
			@RequestParam(value = "to", required = true) String to) throws UnauthorizedAccessException {
		permitCheck(request);
		switch (to) {
		case "addstaff":
			model.addAttribute("manage", "add");
			break;
		case "mngeditor":
			model.addAttribute("staffs", staffManager.getTotalStaffs());
			model.addAttribute("unassignedStaffs", staffManager.getTotalUnassignedStaffs());
			model.addAttribute("managers", staffManager.getTotalManagers());
			model.addAttribute("manage", "mngeditor");
			break;
		default:
			model.addAttribute("manage", "explore");
			break;
		}
		return "manage/manage";
	}

	@RequestMapping(value = "/insertPerson", method = RequestMethod.POST)
	public String insertPerson(Model model, HttpServletRequest request, @RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "gender", required = false) String gender,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "tel", required = true) String tel,
			@RequestParam(value = "division", required = true) String division,
			@RequestParam(value = "position", required = true) String position,
			@RequestParam(value = "protraitPath", required = false) String protraitPath,
			@RequestParam(value = "hostManagerId", required = false) String hostManagerId,
			@RequestParam(value = "password", required = false, defaultValue = "") String password,
			@RequestParam(value = "insertType", required = true) String insertType) throws UnauthorizedAccessException {
		// Checking Is this an Administrator Account Roll.
		permitCheck(request);
		switch (insertType) {
		case Staff.TYPE_STAFF:
			if (staffManager.insertStaff(
					new Staff(staffId, name, email, tel, division, position, protraitPath,
							hostManagerId.equals("") ? null : hostManagerId, gender, insertType),
					password.equals("") ? Generator.getInstance().genPassword() : password)) {
				model.addAttribute("msg", "สำเร็จ!");
			} else {
				model.addAttribute("msg", "ไม่สำเร็จ!");
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

	@RequestMapping(value = "/editPerson", method = RequestMethod.POST)
	public String editPerson(Model model, HttpServletRequest request, @RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "gender", required = false) String gender,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "tel", required = true) String tel,
			@RequestParam(value = "division", required = true) String division,
			@RequestParam(value = "position", required = true) String position,
			@RequestParam(value = "protraitPath", required = false) String protraitPath,
			@RequestParam(value = "hostManagerId", required = false) String hostManagerId,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "editType", required = true) String editType) throws UnauthorizedAccessException {
		permitCheck(request);
		if (staffManager.editStaff(
				new Staff(staffId, name, email, tel, division, position, null, hostManagerId, gender, editType),
				password)) {
			model.addAttribute("msg", "สำเร็จ!");
		} else {
			model.addAttribute("msg", "ไม่สำเร็จ!");
		}
		return "redirect:managechoice?to=explore";
	}

	@RequestMapping(value = "/deletePerson", method = RequestMethod.POST)
	public String insertPerson(Model model, HttpServletRequest request, @RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "ajax", required = true, defaultValue = "false") boolean ajax) throws UnauthorizedAccessException {
		// Checking Is this an Administrator Account Roll.
		permitCheck(request);
		boolean isSuccessDelete = staffManager.deleteStaffById(staffId);
		if (staffManager.deleteStaffById(staffId)) {
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
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "tel", required = true) String tel,
			@RequestParam(value = "protraitPath", required = false) String protraitPath,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "editType", required = false) String editType) {

		if (staffManager.editSelfStaff(
				new Staff(staffId, name, email, tel, protraitPath.equals("") ? null : protraitPath), password)) {
			logger.info("UPDATED");
			return "redirect:login?staffId=" + staffId + "&password=" + password;
		}
		logger.info("NO UPDATE");
		return "home";
	}

	@RequestMapping(value = "/editPerson.f", method = RequestMethod.POST)
	public String editPersonWithPortrait(Model model, HttpServletRequest request,
			@RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "gender", required = true) String gender,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "tel", required = true) String tel,
			@RequestParam(value = "division", required = true) String division,
			@RequestParam(value = "position", required = true) String position,
			@RequestParam(value = "protraitPathOld", required = false) String protraitPathOld,
			@RequestParam(value = "protraitPath", required = false) MultipartFile img,
			@RequestParam(value = "hostManagerId", required = false) String hostManagerId,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "editType", required = true) String editType)
			throws IllegalStateException, IOException, UnauthorizedAccessException {
		permitCheck(request);
		MultipartHttpServletRequest mrequest = multipartResolver.resolveMultipart(request);
		Staff staff = new Staff(staffId, name, email, tel, division, position, null, hostManagerId, gender, editType);
		logger.info(staff.toString() + " PWD : " + password);
		String imgName = img.isEmpty() ? Staff.getStaffInstance().getProtraitPath()
				: Generator.getInstance().genImageName(img.getOriginalFilename());
		if (!img.isEmpty()) {
			img.transferTo(new File(mrequest.getRealPath(PORTRAIT_DIR) + imgName));
			logger.info("protraitInputName : " + protraitPathOld);
			File oldImg = new File(mrequest.getRealPath(PORTRAIT_DIR + protraitPathOld));
			oldImg.delete();
			if (staffManager.editStaff(
					new Staff(staffId, name, email, tel, division, position, imgName, hostManagerId, gender, editType),
					password)) {
				model.addAttribute("msg", "สำเร็จ!");
			} else {
				model.addAttribute("msg", "ไม่สำเร็จ!");
			}
		} else { // <-- Need Test
			if (staffManager.editStaffForNoImage(
					new Staff(staffId, name, email, tel, division, position, null, hostManagerId, gender, editType),
					password)) {
				model.addAttribute("msg", "สำเร็จ!");
			} else {
				model.addAttribute("msg", "ไม่สำเร็จ!");
			}
		}

		return "redirect:managechoice?to=explore";
	}

	@RequestMapping(value = "/editSelf.f", method = RequestMethod.POST, headers = "content-type=multipart/*")
	public String editSelfWithPortrait(Model model, HttpServletRequest request,
			@RequestParam(value = "protraitPath") MultipartFile img) throws IllegalStateException, IOException {
		logger.info("IS MULT : " + multipartResolver.isMultipart(request));
		MultipartHttpServletRequest mrequest = multipartResolver.resolveMultipart(request);
		String imgName = img.isEmpty() ? Staff.getStaffInstance().getProtraitPath()
				: Generator.getInstance().genImageName(img.getOriginalFilename());
		if (!img.isEmpty()) {
			img.transferTo(new File(mrequest.getRealPath(PORTRAIT_DIR) + imgName));
			File oldImg = new File(mrequest.getRealPath(PORTRAIT_DIR + Staff.getStaffInstance().getProtraitPath()));
			oldImg.delete();
		}

		if (staffManager.editSelfStaff(
				new Staff(mrequest.getParameter("staffId"), mrequest.getParameter("name"),
						mrequest.getParameter("email"), mrequest.getParameter("tel"), imgName),
				mrequest.getParameter("password"))) {
			return "redirect:login?staffId=" + mrequest.getParameter("staffId") + "&password="
					+ mrequest.getParameter("password");

		}
		return "home";
	}

	@RequestMapping(value = "/insertPerson.f", method = RequestMethod.POST, headers = "content-type=multipart/*")
	public String insertPersonWithPortrait(Model model, HttpServletRequest request,
			@RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "gender", required = true) String gender,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "tel", required = true) String tel,
			@RequestParam(value = "division", required = true) String division,
			@RequestParam(value = "position", required = true) String position,
			@RequestParam(value = "hostManagerId", required = false) String hostManagerId,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "insertType", required = true) String insertType,
			MultipartHttpServletRequest mrequest, @RequestParam(value = "protraitPath") MultipartFile img)
			throws IllegalStateException, IOException, UnauthorizedAccessException {
		// Checking Is this an Administrator Account Roll.
		permitCheck(request);
		String imgName = img.isEmpty() ? null : Generator.getInstance().genImageName(img.getOriginalFilename());
		if (staffManager.insertStaff(
				new Staff(staffId, name, email, tel, division, position, imgName,
						hostManagerId.equals("") ? null : hostManagerId, gender, insertType),
				password.equals("") ? Generator.getInstance().genPassword() : password)) {
			img.transferTo(new File(mrequest.getRealPath(PORTRAIT_DIR) + imgName));
			model.addAttribute("msg", "สำเร็จ!");
		} else {
			model.addAttribute("msg", "ไม่สำเร็จ!");
		}
		return "redirect:managechoice?to=add";
	}

	@ExceptionHandler({ UnauthorizedAccessException.class })
	public ModelAndView unauthAccountException(UnauthorizedAccessException npex) {
		ModelAndView mav = new ModelAndView("result/errpage");
		return ModelBody.setErrorBody(HttpStatus.INTERNAL_SERVER_ERROR, ModelBody.ERR_ICO_UNAUTH, "Halt!",
				"This Section is Authorized for Administrator.", mav);
	}

	private void permitCheck(HttpServletRequest request) throws UnauthorizedAccessException {
		Staff staff = (Staff) request.getSession(false).getAttribute("thisStaff");

		if (staff == null) {
			throw new UnauthorizedAccessException();
		}
		if (!staff.getStaffType().equals(Staff.TYPE_ADMINISTRATOR)) {
			throw new UnauthorizedAccessException();
		}
		logger.info(staff.toString());
	}
}
