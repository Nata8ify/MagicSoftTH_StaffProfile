package com.n8ify.mgs.stffp.intface;

import com.n8ify.mgs.stffp.model.Staff;

public interface SttpfAccessInterface {
	public boolean login(String staffId, String password);

	public Staff getProfile(String staffId);

	public boolean editProfile(Staff staff);
}
