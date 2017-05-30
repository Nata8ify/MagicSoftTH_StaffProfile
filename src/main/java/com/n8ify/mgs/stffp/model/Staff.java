package com.n8ify.mgs.stffp.model;

public class Staff {
	private String staffId;
	private String name;
	private String email;
	private String tel;
	private String division;
	private String protraitPath;
	private String hostManagerId;
	
	public Staff() {
		super();
	}

	public Staff(String name, String email, String tel, String division, String protraitPath, String hostManagerId) {
		super();
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.division = division;
		this.protraitPath = protraitPath;
		this.hostManagerId = hostManagerId;
	}

	public String getStaffId() {
		return staffId;
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
		return "รหัสบุคคล=" + staffId + ", ชื่อ-สกุล=" + name + ", Email=" + email + ", Tel=" + tel + ", แผนก="
				+ division + ", ที่อยู่ของรูปภาพ=" + protraitPath + "รหัสบุคคลหัวหน้าแผนก : "+hostManagerId+"=]";
	}
}
