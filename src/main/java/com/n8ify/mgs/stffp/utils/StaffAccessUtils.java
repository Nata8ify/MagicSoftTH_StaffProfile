package com.n8ify.mgs.stffp.utils;

public class StaffAccessUtils {
	private static StaffAccessUtils accessUtils;

	public static StaffAccessUtils getInstance() {
		if (accessUtils == null)
			accessUtils = new StaffAccessUtils();
		return accessUtils;
	}

	public String getRandomPassword() {
		char firstChar = (char) ((int) (Math.random() * (122 - 64 + 1) + 64));
		char secondChar = (char) ((int) (Math.random() * (122 - 64 + 1) + 64));
		char thirdChar = (char) ((int) (Math.random() * (122 - 64 + 1) + 64));
		char fouthChar = (char) ((int) (Math.random() * (122 - 64 + 1) + 64));
		char fifthChar = (char) ((int) (Math.random() * (122 - 64 + 1) + 64));
		char sixthChar = (char) ((int) (Math.random() * (122 - 64 + 1) + 64));
		char seventhChar = (char) ((int) (Math.random() * (122 - 64 + 1) + 64));
		char eigththChar = (char) ((int) (Math.random() * (122 - 64 + 1) + 64));
		return String.valueOf(firstChar + "" + secondChar + thirdChar + fouthChar + fifthChar + sixthChar + seventhChar
				+ eigththChar);
	}

}
