package com.n8ify.mgs.stffp.intface;

import java.util.List;

public interface StaffBinderInterface {

	public void bindStaffToManager(String staffId, String managerId);

	public void bindStaffsToManager(List<String> staffId, String managerId);

	public void unbindStaffFromManager(String staffId);

	public void unbindStaffsFromManager(List<String> staffId);

	public void changeManagerForStaff(String staffId, String managerId);

	public void changeManagerForStaffs(List<String> staffId, String managerId);
}
