package com.n8ify.mgs.stffp.intface;

public interface StaffBinderInterface {

	public void bindStaffToManager(String staffId, String managerId);

	public void bindStaffsToManager(Object[] staffIds, String managerId);

	public void unbindStaffFromManager(String staffId);

	public void unbindStaffsFromManager(Object[] staffIds);

	public void unbindStaffsFromManager(String managerId);

}
