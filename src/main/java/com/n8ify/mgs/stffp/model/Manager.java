package com.n8ify.mgs.stffp.model;

public class Manager {
	private String managerId;
	private String name;
	private String email;
	private String tel;
	private String division;
	private String protraitPath;
	private String hostManagerId;

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
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
		return "รหัสบุคคล=" + managerId + ", ชื่อ-สกุล=" + name + ", Email=" + email + ", Tel=" + tel + ", แผนก="
				+ division + ", ที่อยู่ของรูปภาพ=" + protraitPath + "]";
	}
}
