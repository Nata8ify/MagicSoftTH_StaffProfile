package com.n8ify.mgs.stffp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.n8ify.mgs.stffp.dealer.StaffDepartmentManagement;
import com.n8ify.mgs.stffp.model.StaffDepartment;

@Controller
public class StaffDepartmentController {
	private static final Logger logger = LoggerFactory.getLogger(StaffDepartmentController.class);

	@Autowired
	private StaffDepartmentManagement departmentMng;
	
	@Autowired
	@Qualifier("gsonb")
	private GsonBuilder gsonb;
	
	@RequestMapping(value = "adm/department/departments", method = RequestMethod.POST)
	@ResponseBody
	public String getAllDepartments(){
		return gsonb.create().toJson(departmentMng.findAll());
	}
	
	@RequestMapping(value = "/adm/department/create", method = RequestMethod.POST)
	@ResponseBody
	public String createDepartment(@RequestParam(value="department", required = true)String department){
		if(departmentMng.add(department)){
			return "true";
		} else {
			return "false";
		}
	}
	
	
	@RequestMapping(value = "/adm/department/update", method = RequestMethod.POST)
	@ResponseBody
	public String updateDepartment(StaffDepartment department){
		logger.info(department.toString());
		if(departmentMng.update(department)){
			return "true";
		} else {
			return "false";
		}
	}
	
	@RequestMapping(value = "/adm/department/delbyId", method = RequestMethod.POST)
	@ResponseBody
	public String deleteDepartmentById(@RequestParam(value="departmentId", required = true)int departmentId){
		if(departmentMng.deleteById(departmentId)){
			return "true";
		} else {
			return "false";
		}
	}
	
	@RequestMapping(value = "/adm/department/delByName", method = RequestMethod.POST)
	@ResponseBody
	public String deleteDepartmentByName(@RequestParam(value="department", required = true)String department){
		if(departmentMng.deleteByName(department)){
			return "true";
		} else {
			return "false";
		}
	}

}
