package com.n8ify.mgs.stffp.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class Generator {
	private static Generator accessUtils;

	private DataSource dataSource;
	

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplate = new JdbcTemplate(this.dataSource);
	}

	private JdbcTemplate jdbcTemplate;
	
	public static Generator getInstance() {
		if (accessUtils == null){
			accessUtils = new Generator();
		}
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
	
	private final int LAST2TDIGIT_BUDDHIST_YEAR = 43;
	public String genLatestMGSStaffId(){
		String mgsIdPrefix = "M".concat(String
				.valueOf(Integer.valueOf(new SimpleDateFormat("yy").format(new Date(System.currentTimeMillis())))+LAST2TDIGIT_BUDDHIST_YEAR));
		String mgsIdSuffix = "";
		String sql = "SELECT MAX(`staffId`) FROM `Staff`;";
		mgsIdSuffix = this.jdbcTemplate.queryForObject(sql, String.class);
			String orderDigits = String.valueOf(Integer.valueOf(mgsIdSuffix.substring(3))+1);
			if(orderDigits.length()==2){
				return mgsIdPrefix.concat("0".concat(orderDigits));
			}
			else if(orderDigits.length()==1){
				return mgsIdPrefix.concat("00".concat(orderDigits));
			}
			else{
				return mgsIdPrefix.concat("".concat(orderDigits));
			}
	}
	
}
