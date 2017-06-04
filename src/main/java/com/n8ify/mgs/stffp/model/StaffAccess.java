package com.n8ify.mgs.stffp.model;

public class StaffAccess {
	private String staffId;
	private String password;

	private static StaffAccess staffAccess;

	public static StaffAccess getAccessInstance() {
		if (StaffAccess.staffAccess == null)
			throw new NullPointerException("No Staff Access Instance By Now.");
		return StaffAccess.staffAccess;
	}

	public static void setAccessInstance(StaffAccess staffAccess) {
		StaffAccess.staffAccess = staffAccess;
	}

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
