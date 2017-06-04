package com.n8ify.mgs.stffp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.GsonBuilder;
import com.n8ify.mgs.stffp.dealer.StaffManager;

@Controller
public class StaffViewerController {

	private static final Logger logger = LoggerFactory.getLogger(StaffViewerController.class);

	@Autowired
	private StaffManager staffManager;

	@Autowired
	private GsonBuilder gsonb;
	
	@RequestMapping(value = "/viewAll", method = RequestMethod.GET)
	public String viewAll(Model model,
			@RequestParam(value = "json", required = true, defaultValue = "false")boolean json) {
		
		if(json){
			gsonb.serializeNulls();
			model.addAttribute("results", gsonb.create().toJson(staffManager.getEntireStaffs()));
			return "result/result";
		}
		model.addAttribute("staffs", staffManager.getEntireStaffs());
		return "list";
	}

	@RequestMapping(value = "/viewAllMngs", method = RequestMethod.GET)
	public String viewAllManager(Model model,
			@RequestParam(value = "json", required = true, defaultValue = "false")boolean json) {
		if(json){
			gsonb.serializeNulls();
			model.addAttribute("results", gsonb.create().toJson(staffManager.getTotalManagers()));
			return "result/result";
		}
		model.addAttribute("staffs", staffManager.getEntireStaffs());
		return "list";
	}
	
	@RequestMapping(value = "/viewAllStaffs", method = RequestMethod.GET)
	public String viewAllStaffs(Model model,
			@RequestParam(value = "json", required = true, defaultValue = "false")boolean json) {
		if(json){
			gsonb.serializeNulls();
			model.addAttribute("results", gsonb.create().toJson(staffManager.getTotalStaffs()));
			return "result/result";
		}
		model.addAttribute("staffs", staffManager.getEntireStaffs());
		return "list";
	}
	
	@RequestMapping(value = "/viewAllUnassignedStaffs", method = RequestMethod.GET)
	public String viewAllUnassignedStaffs(Model model,
			@RequestParam(value = "json", required = true, defaultValue = "false")boolean json) {
		if(json){
			gsonb.serializeNulls();
			model.addAttribute("results", gsonb.create().toJson(staffManager.getTotalUnassignedStaffs()));
			return "result/result";
		}
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
	public String viewMngsStaff(Model model,
			@RequestParam(value = "json", required = true, defaultValue = "false")boolean json,
			@RequestParam(value = "managerId", required = true) String managerId) {
		if(json){
			gsonb.serializeNulls();
			model.addAttribute("results", gsonb.create().toJson(staffManager.getStaffsByHostManagerId(managerId)));
			return "result/result";
		}
		model.addAttribute("staffs", staffManager.getStaffsByHostManagerId(managerId));
		return "list";
	}
	
	
}
