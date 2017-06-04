package com.n8ify.mgs.stffp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.n8ify.mgs.stffp.utils.Generator;

@Controller
public class NonFunctionController {

	private static final Logger logger = LoggerFactory.getLogger(StaffAccessController.class);
	
	@Autowired
	private Generator gen;

	@RequestMapping(value = "/utils/latestMgsId", method = RequestMethod.GET)
	public String getLatestMgsId(Model model) {
		model.addAttribute("results", gen.genLatestMGSStaffId());
		return "result/result";
	}
	
	@RequestMapping(value = "/mp", method = RequestMethod.GET)
	public String testMultiParam(Model model,
			@RequestParam(value = "param", required = false)String[] params) {
		for(String s : params){
			logger.info(s);
		}
		return "result/result";
	}
	
}
