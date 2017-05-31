package com.n8ify.mgs.stffp.model;

public class StaffAccess {
	private String staffId;
	private String password;

	public StaffAccess(String staffId, String password) {
		super();
		this.staffId = staffId;
		this.password = password;
	}

	public String getStaffId() {
		return staffId;
	}

	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "StaffAccess [staffId=" + staffId + ", password=" + password + "]";
	}

}
