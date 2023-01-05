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
	
	// For sending mail with username and password after adding employee data
	public void sendEmail(String username,String password,String toEmail) {
		
		SimpleMailMessage message =new SimpleMailMessage();
		String emailbody="Congratulations Your Employee Account is Created Successfully..! \nYour UserID Password is :\n"+"Username : "+username+"\nPassword : "+password;
		message.setFrom("amitkumaryadav855@gmail.com");
		message.setTo(toEmail);
		message.setText(emailbody);
		message.setSubject("LMS Portal");
		
		mailSender.send(message);
		System.out.println("Mail Sent");
		}
	
	// For send approve and reject mail
	public void sendApproveReject(String name,String messagebody,String toEmail) {
		
		SimpleMailMessage message =new SimpleMailMessage();
		String emailbody="Dear " + name +"\n"+messagebody;
		message.setFrom("amitkumaryadav855@gmail.com");
		message.setTo(toEmail);
		message.setText(emailbody);
		message.setSubject("LMS Portal");
		
		mailSender.send(message);
		System.out.println(message);
		System.out.println("Mail Sent done");
		}
	// For send mail after apply for leaves
	public void sendApplyLeave(String name,String messagebody) {
		Employee employee1=repository.getReferenceByName(name);
		SimpleMailMessage message =new SimpleMailMessage();
		String emailbody="Dear " + name +"\n"+messagebody;
		message.setFrom("amitkumaryadav855@gmail.com");
		message.setTo(employee1.getEmail());
		message.setText(emailbody);
		message.setSubject("LMS Portal");
		
		mailSender.send(message);
		System.out.println(message);
		System.out.println("Mail Sent");
	}
	
}
