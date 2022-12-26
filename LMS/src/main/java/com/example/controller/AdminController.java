package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@GetMapping("/")
	public String welcome0() {
		return "login.jsp";
	}

	
	@GetMapping("/admin")
	public String welcome() {
		return "AdminDashboard.jsp";
	}
	@GetMapping("/manager")
	public String welcome1() {
		return "ManagerDashboard.jsp";
	}
	@GetMapping("/employee")
	public String welcome2() {
		return "EmployeeDashboard.jsp";
	}
}
