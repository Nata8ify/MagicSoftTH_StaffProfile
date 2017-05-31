package com.n8ify.mgs.stffp.intface;

import java.util.List;

import com.n8ify.mgs.stffp.model.Staff;

public interface StaffManagementInterface {
	public boolean insertStaff(Staff staff);

	public boolean editStaff(Staff staff);

	public boolean deleteStaffById(String staffId);

	public Staff getStaffById(String staffId);

	public List<Staff> getStaffsByNameLike(String nameLike);

	public List<Staff> getStaffsByHostManagerId(int managerId);
}
