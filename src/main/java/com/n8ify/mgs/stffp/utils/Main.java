package com.n8ify.mgs.stffp.utils;

import com.n8ify.mgs.stffp.dealer.StaffBinder;

public class Main {
	public static void main(String[] args) {
//System.out.println(
//		new StaffBinder().getDynamicINClauseStatement(new Object[]{"M60001","M60002","M60003","M60007"}));
System.out.println(Generator.getInstance().genImageName("juree.png"));	
	}
}
