package com.n8ify.mgs.stffp.model;

public class Staff {
	private String staffId;
	private String name;
	private String email;
	private String tel;
	private String division;
	private String position;
	private String protraitPath;
	private String hostManagerId;
	private String gender;
	private String staffType;

	public static final String TYPE_STAFF = "s";
	public static final String TYPE_ADMINISTRATOR = "a";
	public static final String TYPE_MANAGER = "m";

	private static Staff staff;
	
	public static void setStaffInstance(Staff staff){
		Staff.staff = staff;
	}
	
	public static Staff getStaffInstance(){
		if(Staff.staff == null)
			Staff.staff = new Staff();
		return Staff.staff;
	}
	
	public Staff() {
		super();
	}

	public Staff(String staffId, String name, String email, String tel, String division, String position,
			String protraitPath, String hostManagerId, String gender, String staffType) {
		this.staffId = staffId;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.division = division;
		this.position = position;
		this.protraitPath = protraitPath;
		this.hostManagerId = hostManagerId;
		this.gender = gender;
		this.staffType = staffType;
	}


	public Staff(String staffId, String name, String email, String tel, String protraitPath) {
		this.staffId = staffId;
		this.name = name;
		this.email = email;
		this.tel = tel;
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

	public String getGender() {
		return gender;
	}

	public String getStaffType() {
		return staffType;
	}

	public void setStaffType(String staffType) {
		this.staffType = staffType;
	}

	public void setGender(String gender) {
		this.gender = gender;
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
		return "*รหัสบุคคล=" + staffId + ", *ชื่อ-สกุล=" + name + ", *Email=" + email + ", *Tel=" + tel + ", *แผนก="
				+ division + ", *ที่อยู่ของรูปภาพ=" + protraitPath + " *รหัสบุคคลหัวหน้าแผนก : " + hostManagerId + "=]";
	}

	private String hostManagerName;

	public String getHostManagerName() {
		return hostManagerName;
	}

	public void setHostManagerName(String hostManagerName) {
		this.hostManagerName = hostManagerName;
	}

}
