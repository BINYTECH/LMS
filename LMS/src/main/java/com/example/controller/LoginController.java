package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.model.Employee;
import com.example.repository.EmployeeRepository;


@Controller
public class LoginController {
	
	@Autowired
	EmployeeRepository repository;
	
	// For redirct to login page
	@GetMapping("/")
	public String welcome() {
		return "login.jsp";
	}
	
	// For authenticate username, password and logn the user
	@PostMapping("/login")
	public ModelAndView loginUser(@RequestParam("username") String username,@RequestParam("password") String password,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		Employee employee=repository.getReferenceByUsernameAndPassword(username,password);
		System.out.println(employee);
		if(employee==null) {
			session.setAttribute("message", "*Invalid Credentials");
			return new ModelAndView("login.jsp");
		}
		
		else {
				// For Admin login
			
				if((employee.getRole()).equals("Admin")) {
				session.setAttribute("empid", employee.getEmpid());
				mv.setViewName("AdminDashboard.jsp");
				mv.addObject("employee",employee);
				
				return mv;
			}
			// For Employee login
			else if((employee.getRole()).equals("Employee")) {
				session.setAttribute("empid", employee.getEmpid());
				mv.setViewName("EmployeeDashboard.jsp");
				mv.addObject("employee",employee);
				return mv;
				
			}
			// For Manager login
			else if((employee.getRole()).equals("Manager")) {
				session.setAttribute("empid", employee.getEmpid());
				mv.setViewName("ManagerDashboard.jsp");
				mv.addObject("employee",employee);
				return mv;
			}
			else {
				return new ModelAndView("login.jsp");
			}
		}
	}
	
	// For logout and end session
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		if (session != null) {
			session.invalidate();
		}
		return "login.jsp";
	}
}
