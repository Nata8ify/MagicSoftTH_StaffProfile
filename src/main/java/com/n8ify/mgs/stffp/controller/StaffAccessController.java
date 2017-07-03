package com.n8ify.mgs.stffp.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.n8ify.mgs.stffp.dealer.SttfpAccess;
import com.n8ify.mgs.stffp.excp.UnauthorizedAccessException;
import com.n8ify.mgs.stffp.model.Staff;
import com.n8ify.mgs.stffp.model.StaffAccess;
import com.n8ify.mgs.stffp.utils.Generator;
import com.n8ify.mgs.stffp.utils.ModelBody;

@Controller
public class StaffAccessController {

	private static final Logger logger = LoggerFactory.getLogger(StaffAccessController.class);

	@Autowired
	private SttfpAccess sttfpAccess;

	@RequestMapping(value = "/login")
	public String login(Model model, HttpServletRequest request,
			@RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "password", required = true) String password) {
		if (request.getSession(false).getAttribute("thisStaff") != null) {
			request.getSession(false).invalidate();
		}
		Staff staff = sttfpAccess.login(staffId, Generator.getInstance().genMd5(password));
		if (staff.getStaffId().equalsIgnoreCase(staffId)) {
			Staff.setStaffInstance(staff);
			StaffAccess.setAccessInstance(new StaffAccess(staffId, password)); //No need System role to be assigned.
			request.getSession(true).setAttribute("thisStaff", staff);
			request.getSession(true).setAttribute("thisStaffAccess", StaffAccess.getAccessInstance());
			logger.info("SESSION CREATED FOR :" + staff.getStaffId());
			return "home";
		}
		return "NO_WHERE_LOGIN_MODULE_IS_DEFECTED";
	}

	@RequestMapping(value = "/adm/admlogin")
	public String adminLogin(Model model, HttpServletRequest request,
			@RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "password", required = true) String password) throws UnauthorizedAccessException {
		if (request.getSession(false).getAttribute("thisStaff") != null) {
			request.getSession(false).invalidate();
		}
		Staff staff = sttfpAccess.login(staffId, Generator.getInstance().genMd5(password), Staff.TYPE_ADMINISTRATOR);
		if (staff.getStaffId().equalsIgnoreCase(staffId)) {
			Staff.setStaffInstance(staff);
			StaffAccess.setAccessInstance(new StaffAccess(staffId, password, Staff.TYPE_ADMINISTRATOR)); //Assigned System Role as Administrator.
			request.getSession(true).setAttribute("thisStaff", staff);
			request.getSession(true).setAttribute("thisStaffAccess", StaffAccess.getAccessInstance());
			logger.info("SESSION CREATED FOR ADMIN :" + staff.getStaffId());
			return "redirect:manage";
		}
		throw new UnauthorizedAccessException();
	}

	@RequestMapping(value = { "/logout", "/adm/logout" })
	public String logout(Model model, HttpServletRequest request) {
		if (request.getSession(false).getAttribute("thisStaff") != null) {
			logger.info("NOT NULL STAFF");
			request.getSession(false).invalidate();
		}
		return "home";
	}

	// Exception Handler Here!
	@ExceptionHandler({ NullPointerException.class })
	public ModelAndView nullAccountException(NullPointerException npex) {
		ModelAndView mav = new ModelAndView("result/errpage");
		return ModelBody.setErrorBody(HttpStatus.INTERNAL_SERVER_ERROR, ModelBody.ERR_ICO_WARN_NORM, "Oops!",
				"It seem your Staff ID or Password is not valid or not exists.", mav);
	}

}
