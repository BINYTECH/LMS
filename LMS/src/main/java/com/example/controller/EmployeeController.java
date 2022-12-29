package com.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.Applyleave;
import com.example.model.Employee;
import com.example.repository.EmployeeRepository;
import com.example.repository.LeaveRepository;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeRepository repository;
	
	@Autowired
	LeaveRepository lrepo;
	
	@GetMapping("/appleaveemp")
	public String applyLeaveformE(HttpServletRequest request) {
		int empid=Integer.parseInt(request.getParameter("empid"));
		Employee employee=repository.getReferenceById(empid);
		request.setAttribute("employee", employee);
		return "AppLeaveEmp.jsp";
	}
	
	@GetMapping("/leaveemp")
	public ModelAndView applyLeave(Applyleave aleave) {
		ModelAndView mv=new ModelAndView();
		aleave.setStatus("pending");
		int empid=aleave.getEmpid();
		Employee employee=repository.getReferenceById(empid);
		aleave.setRole(employee.getRole());
		lrepo.save(aleave);
		mv.setViewName("EmployeeDashboard.jsp");
		mv.addObject("employee",employee);
		return mv;
	}

}
