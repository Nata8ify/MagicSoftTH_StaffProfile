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

@Controller
public class StaffAccessController {

	private static final Logger logger = LoggerFactory.getLogger(StaffAccessController.class);

	@Autowired
	private SttfpAccess sttfpAccess;

	@RequestMapping(value = "/login")
	public String login(Model model, HttpServletRequest request,
			@RequestParam(value = "staffId", required = true)String staffId,
			@RequestParam(value = "password", required = true)String password) {
		Staff staff = sttfpAccess.login(staffId, password);
		if(staff.getStaffId().equals(staffId)){
			Staff.setStaffInstance(staff);
			request.getSession(true).setAttribute("thisStaff", staff);
			logger.info("SESSION CREATED FOR :"+staff.getStaffId());
			return "home";
		}
		return "manage"; 
	}	
	
	@RequestMapping(value = "/editSelf")
	public String editSelf(Model model) {
		return "home"; // <-- Not the Finalize Destination May have to Make more
						// Page.
	}

	@RequestMapping("/logout")
	public String logout(Model model, HttpServletRequest request){
		if(request.getSession(false).getAttribute("thisStaff") != null){
			logger.info("NOT NULL STAFF");
				request.getSession(false).invalidate();}
		return "home";
	}
}
