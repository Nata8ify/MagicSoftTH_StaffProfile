package com.n8ify.mgs.stffp.intface;

import com.n8ify.mgs.stffp.model.Staff;

public interface SttpfAccessInterface {
	
	public Staff login(String staffId, String password);

	@Deprecated
	public Staff getProfile(String staffId);

	public boolean editProfile(Staff staff);
	
	public boolean editPassword(String staffId, String password);
}
