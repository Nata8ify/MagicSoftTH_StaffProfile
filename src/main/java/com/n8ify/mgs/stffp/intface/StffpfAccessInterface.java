package com.n8ify.mgs.stffp.intface;

import com.n8ify.mgs.stffp.model.Staff;

public interface StffpfAccessInterface {
	
	public Staff login(String staffId, String password);

	public Staff getProfile(String staffId);

	 
}