package com.n8ify.mgs.stffp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.n8ify.mgs.stffp.dealer.StaffManager;
import com.n8ify.mgs.stffp.model.Staff;

@Controller
public class StaffManagentController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private StaffManager staffManager;

	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String toManage() {
		return "manage/manage";
	}

	@RequestMapping(value = "/insertStaff", method = RequestMethod.POST)
	public String insertPerson(Model model, @RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "tel", required = true) String tel,
			@RequestParam(value = "division", required = true) String division,
			@RequestParam(value = "protraitPath", required = false) String protraitPath,
			@RequestParam(value = "hostManagerId", required = false) String hostManagerId) {
		staffManager.insertStaff(new Staff(staffId, name, email, tel, division, protraitPath, hostManagerId));
		return toManage();
	}
}
