package com.n8ify.mgs.stffp.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.n8ify.mgs.stffp.dealer.SttfpAccess;
import com.n8ify.mgs.stffp.model.Staff;
import com.n8ify.mgs.stffp.model.StaffAccess;

@Controller
public class StaffAccessController {

	private static final Logger logger = LoggerFactory.getLogger(StaffAccessController.class);

	@Autowired
	private SttfpAccess sttfpAccess;

	@RequestMapping(value = "/login")
	public String login(Model model, HttpServletRequest request,
			@RequestParam(value = "staffId", required = true)String staffId,
			@RequestParam(value = "password", required = true)String password) {
		if(request.getSession(false).getAttribute("thisStaff") != null){
			request.getSession(false).invalidate();
		}
		Staff staff = sttfpAccess.login(staffId, password);
		logger.info("staffId, password"+staffId+":::"+password+">>>"+staff);
		if(staff.getStaffId().equals(staffId)){
			Staff.setStaffInstance(staff);
			StaffAccess.setAccessInstance(new StaffAccess(staffId, password));
			request.getSession(true).setAttribute("thisStaff", staff);
			request.getSession(true).setAttribute("thisStaffAccess", StaffAccess.getAccessInstance());
			logger.info("SESSION CREATED FOR :"+staff.getStaffId());
			return "home";
		}
		return "manage"; 
	}	
	
	@RequestMapping("/logout")
	public String logout(Model model, HttpServletRequest request){
		if(request.getSession(false).getAttribute("thisStaff") != null){
			logger.info("NOT NULL STAFF");
				request.getSession(false).invalidate();}
		return "home";
	}
}
