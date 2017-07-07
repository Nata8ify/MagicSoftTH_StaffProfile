package com.n8ify.mgs.stffp.intface;

import java.util.List;

import com.n8ify.mgs.stffp.model.Staff;

public interface StaffManagementInterface {
	public boolean insertStaff(Staff staff, String password);

	public boolean editStaff(Staff staff, String newPassword);

	public boolean editStaffForNoImage(Staff staff, String newPassword);

	public boolean resetStaffPortrait(String StaffId);

	public boolean editSelfStaff(Staff staff, String newPassword);

	public boolean editPassword(String staffId, String password);

	public boolean deleteStaffById(String staffId, String staffType);

	public boolean deleteAll();

	public Staff getStaffById(String staffId);

	public List<Staff> getEntireStaffs();

	public List<Staff> getStaffsByNameLike(String nameLike);

	public List<Staff> getStaffsByHostManagerId(String managerId);

	public List<Staff> getTotalManagers();

	public List<Staff> getTotalStaffs();

	public List<Staff> getTotalAssignedStaffs();

	public List<Staff> getTotalUnassignedStaffs();

	public boolean isValidStaffId(String staffId);
}
