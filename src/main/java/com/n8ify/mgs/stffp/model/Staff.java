package com.n8ify.mgs.stffp.model;

public class Staff {
	private String staffId;
	private String name;
	private String nameLocale;
	private String email;
	private String tel;
	private String mobileTel;
	private String division;
	private String position;
	private String protraitPath;
	private String hostManagerId;
	private String honorific;
	private String staffType;

	public static final String TYPE_STAFF = "s";
	public static final String TYPE_ADMINISTRATOR = "a";
	public static final String TYPE_MANAGER = "m";

	private static Staff staff;

	public static void setStaffInstance(Staff staff) {
		Staff.staff = staff;
	}

	public static Staff getStaffInstance() {
		if (Staff.staff == null)
			Staff.staff = new Staff();
		return Staff.staff;
	}

	public Staff() {
		super();
	}

	public Staff(String staffId, String name, String nameLocale, String email, String tel, String mobileTel,
			String division, String position, String protraitPath, String hostManagerId, String honorific,
			String staffType) {
		this.staffId = staffId;
		this.name = name;
		this.nameLocale = nameLocale;
		this.email = email;
		this.tel = tel;
		this.mobileTel = mobileTel;
		this.division = division;
		this.position = position;
		this.protraitPath = protraitPath;
		this.hostManagerId = hostManagerId;
		this.honorific = honorific;
		this.staffType = staffType;
	}

	public Staff(String staffId, String name, String nameLocale, String email, String tel, String mobileTel,
			String protraitPath) {
		this.staffId = staffId;
		this.name = name;
		this.nameLocale = nameLocale;
		this.email = email;
		this.tel = tel;
		this.mobileTel = mobileTel;
		this.protraitPath = protraitPath;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getStaffId() {
		return staffId;
	}

	public String getHonorific() {
		return honorific;
	}

	public String getStaffType() {
		return staffType;
	}

	public void setStaffType(String staffType) {
		this.staffType = staffType;
	}

	public void setHonorific(String honorific) {
		this.honorific = honorific;
	}

	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNameLocale() {
		return nameLocale;
	}

	public void setNameLocale(String nameLocale) {
		this.nameLocale = nameLocale;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMobileTel() {
		return mobileTel;
	}

	public void setMobileTel(String mobileTel) {
		this.mobileTel = mobileTel;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getProtraitPath() {
		return protraitPath;
	}

	public void setProtraitPath(String protraitPath) {
		this.protraitPath = protraitPath;
	}

	public String getHostManagerId() {
		return hostManagerId;
	}

	public void setHostManagerId(String hostManagerId) {
		this.hostManagerId = hostManagerId;
	}

	@Override
	public String toString() {
		return "Staff [staffId=" + staffId + ", name=" + name + ", nameLocale=" + nameLocale + ", email=" + email
				+ ", tel=" + tel + ", division=" + division + ", position=" + position + ", protraitPath="
				+ protraitPath + ", hostManagerId=" + hostManagerId + ", honorific=" + honorific + ", staffType="
				+ staffType + ", hostManagerName=" + hostManagerName + ", hostManagerEmail=" + hostManagerEmail + "]";
	}

	// Required Information every Non-manager Staff must have.
	private String hostManagerName;
	private String hostManagerNameLocale;
	private String hostManagerEmail;

	public String getHostManagerName() {
		return hostManagerName;
	}

	public void setHostManagerName(String hostManagerName) {
		this.hostManagerName = hostManagerName;
	}

	public String getHostManagerNameLocale() {
		return hostManagerNameLocale;
	}

	public void setHostManagerNameLocale(String hostManagerNameLocale) {
		this.hostManagerNameLocale = hostManagerNameLocale;
	}

	public String getHostManagerEmail() {
		return hostManagerEmail;
	}

	public void setHostManagerEmail(String hostManagerEmail) {
		this.hostManagerEmail = hostManagerEmail;
	}

}
