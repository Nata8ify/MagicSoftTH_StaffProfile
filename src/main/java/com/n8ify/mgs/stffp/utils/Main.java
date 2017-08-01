package com.n8ify.mgs.stffp.utils;

import java.security.NoSuchAlgorithmException;

public class Main {
	public static void main(String[] args) throws NoSuchAlgorithmException {
		// System.out.println(
		// new StaffBinder().getDynamicINClauseStatement(new
		// Object[]{"M60001","M60002","M60003","M60007"}));
		// System.out.println(Generator.getInstance().genImageName("juree.png"));
		System.out.println(Generator.getInstance().genMd5("kogy9i8u"));
	}
}
