package com.n8ify.mgs.stffp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.n8ify.mgs.stffp.dealer.StaffBinder;

@Controller
public class ManagerBindingController {

	private static final Logger logger = LoggerFactory.getLogger(ManagerBindingController.class);

	@Autowired
	private StaffBinder staffBinder;

	@RequestMapping(value = "/bindToMng")
	public String bindToMng(Model model, @RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "managerId", required = true) String managerId) {
		staffBinder.bindStaffToManager(staffId, managerId);
		return "list"; // <-- Not the Finalize Destination May have to Make more
						// Page.
	}

	@RequestMapping(value = "/bindMoreToMng")
	public String bindMoreToMng(Model model, @RequestParam(value = "staffIds", required = true) String[] staffIds,
			@RequestParam(value = "managerId", required = true) String managerId) {
		staffBinder.bindStaffsToManager(staffIds, managerId);
		return "/viewAll"; // <-- Not the Finalize Destination May have to Make
							// more
							// Page.
	}

	@RequestMapping(value = "/unbindFromMng")
	public String unbindFromMng(Model model, @RequestParam(value = "staffId", required = true) String staffId) {
		staffBinder.unbindStaffFromManager(staffId);
		return "list"; // <-- Not the Finalize Destination May have to Make more
						// Page.
	}

	@RequestMapping(value = "/unbindMoreFromMng")
	public String unbindMoreFromMng(Model model, @RequestParam(value = "staffIds", required = true) String[] staffIds) {
		return "list"; // <-- Not the Finalize Destination May have to Make more
						// Page.
	}

}
