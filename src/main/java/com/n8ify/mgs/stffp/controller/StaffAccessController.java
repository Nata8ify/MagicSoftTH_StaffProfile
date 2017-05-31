package com.n8ify.mgs.stffp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.n8ify.mgs.stffp.dealer.SttfpAccess;

@Controller
public class StaffAccessController {

	private static final Logger logger = LoggerFactory.getLogger(StaffAccessController.class);

	@Autowired
	private SttfpAccess sttfpAccess;

	@RequestMapping(value = "/login")
	public String login(Model model) {
		return "list"; // <-- Not the Finalize Destination May have to Make more
						// Page.
	}

	@RequestMapping(value = "/editSelf")
	public String editSelf(Model model) {
		return "list"; // <-- Not the Finalize Destination May have to Make more
						// Page.
	}

}
