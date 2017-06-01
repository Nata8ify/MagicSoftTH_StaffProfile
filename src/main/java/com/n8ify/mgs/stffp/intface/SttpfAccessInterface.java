package com.n8ify.mgs.stffp.intface;

import com.n8ify.mgs.stffp.model.Staff;

public interface SttpfAccessInterface {
	
	public Staff login(String staffId, String password);

	@Deprecated
	public Staff getProfile(String staffId);

	 
}
