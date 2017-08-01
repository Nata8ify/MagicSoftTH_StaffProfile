package com.n8ify.mgs.stffp.intface;

import java.util.List;

import com.n8ify.mgs.stffp.model.StaffDepartment;

public interface StaffDepartmentManagementInterface {
	public boolean add(String department);
	public boolean update(StaffDepartment department);
	public boolean deleteById(int departmentId);
	public boolean deleteByName(String department);
	
	public List<StaffDepartment> findAll();
}
