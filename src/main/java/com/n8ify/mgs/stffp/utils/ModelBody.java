package com.n8ify.mgs.stffp.utils;

import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.ModelAndView;

public class ModelBody {
	
//	Error/Exception Body
	public static final String ERR_ICO_WARN_NORM = "orange-error-icon-0.png"; 
	public static final String ERR_ICO_UNAUTH = "unauthorized.png"; 
	public static final String ERR_ICO_ERROR = "error.png"; 
	
	public static ModelAndView setErrorBody(HttpStatus errCode, String errIco, String srrMsg, String errDesc, ModelAndView mav){
		mav.addObject("errIco", errIco);
		mav.addObject("errCode", errCode);
		mav.addObject("errMsg", srrMsg);
		mav.addObject("errDesc", errDesc);
		return mav;
	} 
}
