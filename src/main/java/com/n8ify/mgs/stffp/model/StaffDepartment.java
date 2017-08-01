package com.n8ify.mgs.stffp.model;

public class StaffDepartment {
	private int departmentId;
	private String department;
	
	
	
	public StaffDepartment() {
		super();
	}
	public StaffDepartment(int departmentId, String department) {
		super();
		this.departmentId = departmentId;
		this.department = department;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	@Override
	public String toString() {
		return "StaffDepartment [departmentId=" + departmentId + ", department=" + department + "]";
	}
	
	
}
