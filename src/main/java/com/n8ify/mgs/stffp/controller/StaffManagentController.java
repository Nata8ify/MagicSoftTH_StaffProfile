package com.n8ify.mgs.stffp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StaffManagentController {

	@RequestMapping("/insertStaff")
	public String insertPerson(Model model
			,@RequestParam(value = "name", required = true)String name
			,@RequestParam(value = "email", required = true)String email
			,@RequestParam(value = "tel", required = true)String tel
			,@RequestParam(value = "division", required = true)String division
			,@RequestParam(value = "protraitPath", required = false)String protraitPath
			,@RequestParam(value = "division", required = true)String hostManagerId){
		return "manage/manage";
	}
}
