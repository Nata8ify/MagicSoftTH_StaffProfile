package com.n8ify.mgs.stffp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.n8ify.mgs.stffp.utils.Generator;

@Controller
public class NonFunctionController {

	@Autowired
	private Generator gen;

	@RequestMapping(value = "/utils/latestMgsId", method = RequestMethod.GET)
	public String getLatestMgsId(Model model) {
		model.addAttribute("results", gen.genLatestMGSStaffId());
		return "result/result";
	}
}
