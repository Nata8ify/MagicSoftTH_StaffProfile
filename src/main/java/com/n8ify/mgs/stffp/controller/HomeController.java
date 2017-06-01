package com.n8ify.mgs.stffp.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.n8ify.mgs.stffp.dealer.StaffManager;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private StaffManager staffManager;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		model.addAttribute("managers", staffManager.getTotalManagers());
		model.addAttribute("staffs", staffManager.getTotalStaffs());
		return "home";
	}
	
	
	@RequestMapping(value = "/admhome", method = RequestMethod.GET)
	public String adminHome(Model model) {
		return "admhome";
	}
}
