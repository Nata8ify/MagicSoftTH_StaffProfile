package com.n8ify.mgs.stffp.intface;

import com.n8ify.mgs.stffp.model.Staff;

public interface StffpfAccessInterface {

	public Staff login(String staffId, String password);

	public Staff login(String staffId, String password, String staffType);

	public Staff getProfile(String staffId);

	public boolean setToStffpsRole(String staffId, String stffpsRole);
}
