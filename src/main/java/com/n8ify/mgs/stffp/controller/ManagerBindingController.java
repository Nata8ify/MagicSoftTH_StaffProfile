package com.n8ify.mgs.stffp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.n8ify.mgs.stffp.dealer.StaffManager;

@Controller
public class ManagerBindingController {

	@Autowired
	private StaffManager staffManager;

}
