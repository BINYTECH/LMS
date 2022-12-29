package com.example.controller;

import java.util.List;

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
public class ManagerController {
	
	@Autowired
	LeaveRepository lrepo;
	
	@Autowired
	EmployeeRepository repository;
	
	
	
	@GetMapping("/appleaveform")
	public String applyLeaveform(HttpServletRequest request) {
		int empid=Integer.parseInt(request.getParameter("empid"));
		Employee employee=repository.getReferenceById(empid);
		request.setAttribute("employee", employee);
		return "ApplyLeave.jsp";
	}
	
	@GetMapping("/appleave")
	public ModelAndView applyLeave(Applyleave aleave) {
		ModelAndView mv =new ModelAndView();
		aleave.setStatus("pending");
		int empid=aleave.getEmpid();
		Employee employee=repository.getReferenceById(empid);
		aleave.setRole(employee.getRole());
		lrepo.save(aleave);
		mv.setViewName("ManagerDashboard.jsp");
		mv.addObject("employee",employee);
		return mv;
	}
	@GetMapping("/leaveAppM")
	public ModelAndView leaveApprovel() {
		List<Applyleave> leave=lrepo.findByRole("Employee");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("LeaveApprove.jsp");
		mv.addObject("leave",leave);
		return mv;
	}
	
}
