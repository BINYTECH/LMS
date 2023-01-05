package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.Applyleave;
import com.example.model.BalanceLeave;
import com.example.model.Employee;
import com.example.model.EmployeeProject;
import com.example.repository.BalanceLeaveRepo;
import com.example.repository.EmployeeRepository;
import com.example.repository.LeaveRepository;
import com.example.repository.ProjectRepository;
import com.example.service.SendMailEmp;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeRepository repository;
	
	@Autowired
	LeaveRepository lrepo;
	
	@Autowired
	ProjectRepository projectrepo;
	
	@Autowired
	BalanceLeaveRepo balancerepo;
	
	@Autowired
	SendMailEmp serviceMail;
	
	// For redirect to Employee Dashboard
	@GetMapping("/dashboardE")
	public ModelAndView empDashboard(HttpServletRequest req) {
	return new ModelAndView("EmployeeDashboard.jsp");
	}
	
	// For redirect to profile page
	@GetMapping("/profilee")
	public ModelAndView profileE(HttpServletRequest req) {
		int empid=Integer.parseInt(req.getParameter("empid"));
		Employee employee=repository.getReferenceById(empid);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("profileE.jsp");
		mv.addObject("employee",employee);
		return mv;
	}
	
	// For redirect to apply leave page
	@GetMapping("/appleaveemp")
	public String applyLeaveEmp(HttpServletRequest request) {
		int empid=Integer.parseInt(request.getParameter("empid"));
		Employee employee=repository.getReferenceById(empid);
		BalanceLeave bleave=balancerepo.getReferenceById(empid);
		request.setAttribute("employee", employee);
		request.setAttribute("bleave", bleave);
		return "AppLeaveEmp.jsp";
	}
	
	// For apply leave
	@GetMapping("/leaveemp")
	public ModelAndView applyLeave(Applyleave aleave,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		aleave.setStatus("pending");
		int empid=aleave.getEmpid();
		Employee employee=repository.getReferenceById(empid);
		aleave.setRole(employee.getRole());
		lrepo.save(aleave);
		String mess=employee.getName()+" apply for leave.";
		serviceMail.sendApplyLeave(employee.getRp(), mess);
		session.setAttribute("applyleavee", true);
		mv.setViewName("EmployeeDashboard.jsp");
		mv.addObject("employee",employee);
		return mv;
	}
	
	// For redirect leave history
	@GetMapping("/empbalhistoryE")
	public String empBalHistory(HttpServletRequest request){
		int empid=Integer.parseInt(request.getParameter("empid"));
		List<Applyleave> hleave=lrepo.findByEmpid(empid);
		request.setAttribute("leave", hleave);
		return "LeaveHistoryE.jsp";
		
	}
	
	// For view project details
	@GetMapping("/viewprojectemp")
	public ModelAndView viewProjectEmp(HttpServletRequest req) {
		int empid=Integer.parseInt(req.getParameter("empid"));
		Employee employee=repository.getReferenceById(empid);
		String name=employee.getName();
		List<EmployeeProject> pdetails=projectrepo.findByAssigned_to(name);
		ModelAndView mv =new ModelAndView();
		mv.setViewName("ViewProjectEmp.jsp");
		mv.addObject("pdetails",pdetails);
		return mv;
	}
	
	// For redirect to reset password
	@GetMapping("resetpasse")
	public ModelAndView resetPassE(HttpServletRequest req) {
		return new ModelAndView("ResetPassEmp.jsp");
	}
	
	// For reset password
	@PostMapping("/resetpassemp")
	public ModelAndView resetPassEmp(HttpServletRequest req,HttpSession session)
	{
		int empid=Integer.parseInt(req.getParameter("emp_id"));
		String opass=req.getParameter("opass");
		String npass=req.getParameter("npass");
		
		Employee employee=repository.getReferenceByEmpidAndPassword(empid,opass);
		if(employee==null) {
			session.setAttribute("opasswrong", "*old password is wrong");
			return new  ModelAndView("ResetPassEmp.jsp");
		}else {
			employee.setPassword(npass);
			repository.save(employee);
			return new  ModelAndView("/logout");
		}
	}

}
