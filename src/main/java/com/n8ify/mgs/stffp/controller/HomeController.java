package com.n8ify.mgs.stffp.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.n8ify.mgs.stffp.dealer.StaffManager;
import com.n8ify.mgs.stffp.utils.ModelBody;

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

	@RequestMapping(value = "/adm/home", method = RequestMethod.GET)
	public String adminHome(Model model) {
		return "admhome";
	}

	@RequestMapping(value = "/dbg", method = RequestMethod.GET)
	public String dbg(Model model) {
		return "admhome";
	}
	
	@ExceptionHandler({ CannotGetJdbcConnectionException.class })
	public ModelAndView cannotGetJdbcConnectionException(CannotGetJdbcConnectionException cgjcex) {
		ModelAndView mav = new ModelAndView("result/errpage");
		return ModelBody.setErrorBody(HttpStatus.INTERNAL_SERVER_ERROR, ModelBody.ERR_ICO_ERROR, "Connection Timeout.!",
				"Please check the Internet Connection.", mav);
	}
}
