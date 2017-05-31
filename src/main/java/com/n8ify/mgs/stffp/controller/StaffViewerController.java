package com.n8ify.mgs.stffp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.n8ify.mgs.stffp.dealer.StaffManager;

@Controller
public class StaffViewerController {

	@Autowired
	private StaffManager staffManager;

	@RequestMapping(value = "/viewAll", method = RequestMethod.GET)
	public String viewAllStaff(Model model) {
		model.addAttribute("staffs", staffManager.getEntireStaffs());
		return "list";
	}

	@RequestMapping(value = "/searchNameLike", method = RequestMethod.GET)
	public String viewNameLikedStaff(Model model,
			@RequestParam(value = "searchWord", required = true) String searchWord) {
		model.addAttribute("staffs", staffManager.getStaffsByNameLike(searchWord));
		return "list";
	}

	@RequestMapping(value = "/searchMngsStaff", method = RequestMethod.GET)
	public String viewMngsStaff(Model model, @RequestParam(value = "managerId", required = true) String managerId) {
		model.addAttribute("staffs", staffManager.getStaffsByHostManagerId(managerId));
		return "list";
	}
}
