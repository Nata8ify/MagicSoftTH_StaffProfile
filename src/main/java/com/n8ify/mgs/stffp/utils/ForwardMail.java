package com.n8ify.mgs.stffp.utils;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

import com.n8ify.mgs.stffp.model.Staff;

public class ForwardMail {

	private SimpleMailMessage mailMessage;
	private MailSender mailSender;

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
		this.mailMessage = new SimpleMailMessage();
	}

	public void sendIfPasswordSelfEditedMail(Staff staff, String password) {
		try{
			mailMessage.setTo(staff.getEmail());
			mailMessage.setSubject("You have edited your Profile Information");
			mailMessage.setText(
					"You have done of editing your information in the Staff Profile System and this is your latest update Information, So, please check"
							+ "\nStaff ID : " + staff.getStaffId() + "\nName : " + staff.getName() + "\nE-mail : "
							+ staff.getEmail() + "\nTel. : " + staff.getTel() + "\nPassword : " + password);
			mailSender.send(mailMessage);
		} catch (Exception exp){
			// Mail Feature Not function.
		}
	}

	public void sendEditByAdministratorInfoMail(Staff staff, String password) {
		try{
			mailMessage.setTo(staff.getEmail());
			mailMessage.setSubject("We have edited your Profile Information");
			mailMessage.setText(
					"We are completed for editing your information in the Staff Profile System and this is your latest update Information, So, please check"
							+ "\nStaff ID : " + staff.getStaffId() + "\nName : " + staff.getName() + "\nE-mail : "
							+ staff.getEmail() + "\nTel. : " + staff.getTel() + "\nPassword : " + password);
			mailSender.send(mailMessage);
		} catch (Exception exp){
			// Mail Feature Not function.
		}
	}
}
