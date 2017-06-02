package com.n8ify.mgs.stffp.utils;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;

public class Main {
	public static void main(String[] args) {
		// System.out.println(
		// new StaffBinder().getDynamicINClauseStatement(new
		// Object[]{"M60001","M60002","M60003","M60007"}));
		// System.out.println(Generator.getInstance().genImageName("juree.png"));

		System.out.println(new SimpleDateFormat("yy").format(new Date(System.currentTimeMillis())));
	}
}
