package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.example.model.Employee;
import com.example.repository.EmployeeRepository;


@Service
public class SendMailEmp {
	@Autowired
	EmployeeRepository repository;
	
	@Autowired
	JavaMailSender mailSender;
	
	public void sendEmail(String username,String password,String toEmail) {
		
		SimpleMailMessage message =new SimpleMailMessage();
		String emailbody="Congratulations Your Employee Account is Created Successfully..! \nYour UserID Password is :\n"+"Username : "+username+"\nPassword : "+password;
		message.setFrom("awhaleakash123@gmail.com");
		message.setTo(toEmail);
		message.setText(emailbody);
		message.setSubject("LMS Portel");
		
		mailSender.send(message);
		System.out.println("Mail Sent");
		}
	
	
	public void sendApproveReject(String name,String messagebody,String toEmail) {
		
		SimpleMailMessage message =new SimpleMailMessage();
		String emailbody="Dear " + name +"\n"+messagebody;
		message.setFrom("awhaleakash123@gmail.com");
		message.setTo(toEmail);
		message.setText(emailbody);
		message.setSubject("LMS Portel");
		
		mailSender.send(message);
		System.out.println(message);
		System.out.println("Mail Sent");
		}
	
	public void sendApplyLeave(String name,String messagebody) {
		Employee admin=repository.getReferenceByName(name);
		SimpleMailMessage message =new SimpleMailMessage();
		String emailbody="Dear " + name +"\n"+messagebody;
		message.setFrom("awhaleakash123@gmail.com");
		message.setTo(admin.getEmail());
		message.setText(emailbody);
		message.setSubject("LMS Portel");
		
		mailSender.send(message);
		System.out.println(message);
		System.out.println("Mail Sent");
	}
	
}
