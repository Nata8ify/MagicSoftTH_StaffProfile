package com.n8ify.mgs.stffp.model;

public class Administrator {
	private String adminId;
	private String name;
	private String email;
	private String tel;
	private String division;
	private String protraitPath;
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
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
	@Override
	public String toString() {
		return "รหัสบุคคล=" + adminId + ", ชื่อ-สกุล=" + name + ", Email=" + email + ", Tel=" + tel
				+ ", แผนก=" + division + ", ที่อยู่ของรูปภาพ=" + protraitPath + "]";
	}

	
}
