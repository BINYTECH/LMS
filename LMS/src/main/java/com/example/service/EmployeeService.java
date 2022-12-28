package com.example.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.model.Employee;
import com.example.repository.EmployeeRepository;



public class EmployeeService {
	
	@Autowired
	EmployeeRepository repository;
	
	public String genrateUsername(String name) {
		
		String username="";
		Random random=new Random();
		name=name.replaceAll("\\s", "");
		name=name.toLowerCase();
		boolean valid = true;
		while(valid) {
		int ran=random.nextInt(100);
		if(ran>9 || ran<100) {
			username=name+ran;
			valid=false;
		}
		
		}
		
		return username;
	}
	public String genratePassword() {
		boolean validPass=false;
		char[] password = null;
		while(!validPass) {
		String capitalLetter="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String lowerLetter="abcdemghijklmnopqrstuvwxyz";
		String specialChar="!@#$";
		String numbers="1234567890";
		String combine=capitalLetter+lowerLetter+specialChar+numbers;
		Random random=new Random();
		password=new char[8];
		
		password[0]=capitalLetter.charAt(random.nextInt(capitalLetter.length()));
		password[1]=lowerLetter.charAt(random.nextInt(lowerLetter.length()));
		password[2]=specialChar.charAt(random.nextInt(specialChar.length()));
		password[3]=numbers.charAt(random.nextInt(numbers.length()));
		for(int i=4;i<8;i++) {
		password[i]=combine.charAt(random.nextInt(combine.length()));
		}
		for(int i=0;i<capitalLetter.length();i++) {
			char upper=capitalLetter.charAt(i);
			char lower=lowerLetter.charAt(i);
		if(password[0]==upper) {
			validPass=true;
			break;
		}
		else if(password[0]==lower) {
			validPass=true;
			break;
		}	
		}
		}
		String pass=new String(password);
		return pass;
	}
	
	public String getWeek(String hdate) {
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      Date date = null;
	      try {
	         date = sdf.parse(hdate);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      sdf = new SimpleDateFormat("EEEE");
	      String dayName = sdf.format(date);
	      return dayName;
	}
}
