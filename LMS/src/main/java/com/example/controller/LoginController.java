package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.Employee;
import com.example.repository.EmployeeRepository;


@Controller
public class LoginController {
	
	@Autowired
	EmployeeRepository repository;
	
	@GetMapping("/")
	public String welcome() {
		return "login.jsp";
	}
	
	@GetMapping("/login")
	public ModelAndView loginUser(@RequestParam("username") String username,@RequestParam("password") String password,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		Employee employee=repository.getReferenceByUsernameAndPassword(username,password);
		System.out.println(employee);
		if(employee==null) {
			
			return new ModelAndView("login.jsp");
		}
		else {
				if((employee.getRole()).equals("Admin")) {
				mv.setViewName("AdminDashboard.jsp");
				mv.addObject("employee",employee);
				return mv;
			}
			else if((employee.getRole()).equals("Employee")) {
				mv.setViewName("EmployeeDashboard.jsp");
				mv.addObject("employee",employee);
				return mv;
				
			}
			
			else if((employee.getRole()).equals("Manager")) {
				mv.setViewName("ManagerDashboard.jsp");
				mv.addObject("employee",employee);
				return mv;
			}
			else {
				return new ModelAndView("login.jsp");
			}
		}
	}
}
