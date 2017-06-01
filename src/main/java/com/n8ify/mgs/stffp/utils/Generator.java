package com.n8ify.mgs.stffp.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Generator {
	private static Generator accessUtils;

	public static Generator getInstance() {
		if (accessUtils == null)
			accessUtils = new Generator();
		return accessUtils;
	}

	public String genPassword() {
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

	// In the beginning is the words and the words made the world when the word end the world end.
	public String genMd5(String str){
		return "";
	}
	
	public String genImageName(String imgName){
		String current = new SimpleDateFormat("yyyyMMddssSSS").format(new Date(System.currentTimeMillis()));
		int randomSome = ((int) (Math.random() * (999 - 116 + 1) + 116));
		return current.concat(String.valueOf(randomSome)).concat(imgName);
	}
	
}
