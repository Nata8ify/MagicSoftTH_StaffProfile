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
import com.n8ify.mgs.stffp.utils.StaffAccessUtils;

@Controller
public class StaffManagentController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private StaffManager staffManager;

	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String toManage() {
		return "manage/manage";
	}

	@RequestMapping(value = "/insertPerson", method = RequestMethod.POST)
	public String insertPerson(Model model, @RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "gender", required = false) String gender,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "tel", required = true) String tel,
			@RequestParam(value = "division", required = true) String division,
			@RequestParam(value = "position", required = true) String position,
			@RequestParam(value = "protraitPath", required = false) String protraitPath,
			@RequestParam(value = "hostManagerId", required = false) String hostManagerId,
			@RequestParam(value = "password", required = false, defaultValue = "") String password,
			@RequestParam(value = "insertType", required = true) String insertType) {
		// Checking Is this an Administrator Account Roll.
		switch (insertType) {
		case Staff.TYPE_STAFF:
			if (staffManager.insertStaff(
					new Staff(staffId, name, email, tel, division, position, protraitPath, hostManagerId, gender,
							Staff.TYPE_STAFF),
					password.equals("") ? StaffAccessUtils.getInstance().getRandomPassword() : password)) {
				model.addAttribute("msg", "สำเร็จ!");
			} else {
				model.addAttribute("msg", "ไม่สำเร็จ!");
			}
			break;
		case Staff.TYPE_MANAGER:
			break;
		case Staff.TYPE_ADMINISTRATOR:
			break;
		default: // TODO
		}
		return toManage();
	}

	@RequestMapping(value = "/editPerson", method = RequestMethod.POST)
	public String editPerson(Model model, @RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "gender", required = false) String gender,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "tel", required = true) String tel,
			@RequestParam(value = "division", required = true) String division,
			@RequestParam(value = "position", required = true) String position,
			@RequestParam(value = "protraitPath", required = false) String protraitPath,
			@RequestParam(value = "hostManagerId", required = false) String hostManagerId,
			@RequestParam(value = "editType", required = true) String editType) {
		switch (editType) {
		case Staff.TYPE_STAFF:
			if (staffManager.editStaff(new Staff(staffId, name, email, tel, division, position, protraitPath,
					hostManagerId, gender, Staff.TYPE_STAFF))) {
				model.addAttribute("msg", "สำเร็จ!");
			} else {
				model.addAttribute("msg", "ไม่สำเร็จ!");
			}
			break;
		case Staff.TYPE_MANAGER:
			break;
		case Staff.TYPE_ADMINISTRATOR:
			break;
		default: // TODO
		}
		return toManage();
	}

	@RequestMapping(value = "/deletePerson", method = RequestMethod.POST)
	public String insertPerson(Model model, @RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "deleteType", required = true) String deleteType) {
		// Checking Is this an Administrator Account Roll.
		switch (deleteType) {
		case Staff.TYPE_STAFF:
			if (staffManager.deleteStaffById(staffId)) {
				model.addAttribute("msg", "สำเร็จ!");
			} else {
				model.addAttribute("msg", "ไม่สำเร็จ!");
			}
			break;
		case Staff.TYPE_MANAGER:
			break;
		case Staff.TYPE_ADMINISTRATOR:
			break;
		default: // TODO
		}
		return toManage();
	}
}
