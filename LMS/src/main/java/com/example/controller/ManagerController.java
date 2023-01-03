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
import com.example.model.Holidays;
import com.example.repository.BalanceLeaveRepo;
import com.example.repository.EmployeeRepository;
import com.example.repository.HolidayRepository;
import com.example.repository.LeaveRepository;
import com.example.repository.ProjectRepository;
import com.example.service.BalanceService;
import com.example.service.SendMailEmp;

@Controller
public class ManagerController {
	
	@Autowired
	LeaveRepository lrepo;
	
	@Autowired
	EmployeeRepository repository;
	
	@Autowired
	BalanceLeaveRepo balancerepo;
	
	@Autowired
	HolidayRepository holidayRepo;
	
	@Autowired
	ProjectRepository projectrepo;
	
	@Autowired
	SendMailEmp serviceMail;
	
	@GetMapping("/dashboardM")
	public ModelAndView empDashboard() {
	return new ModelAndView("ManagerDashboard.jsp");
	}
	
	@GetMapping("/profilem")
	public ModelAndView profileM(HttpServletRequest req) {
		int empid=Integer.parseInt(req.getParameter("empid"));
		Employee employee=repository.getReferenceById(empid);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("profileM.jsp");
		mv.addObject("employee",employee);
		return mv;
	}
	
	@GetMapping("/appleaveform")
	public String applyLeaveform(HttpServletRequest request) {
		int empid=Integer.parseInt(request.getParameter("empid"));
		Employee employee=repository.getReferenceById(empid);
		BalanceLeave bleave=balancerepo.getReferenceById(empid);
		request.setAttribute("employee", employee);
		request.setAttribute("bleave", bleave);
		return "ApplyLeave.jsp";
	}
	
	@GetMapping("/appleave")
	public ModelAndView applyLeave(Applyleave aleave,HttpSession session) {
		ModelAndView mv =new ModelAndView();
		aleave.setStatus("pending");
		int empid=aleave.getEmpid();
		Employee employee=repository.getReferenceById(empid);
		aleave.setRole(employee.getRole());
		lrepo.save(aleave);
		
		String mess=employee.getName()+" apply for leave.";
		serviceMail.sendApplyLeave(employee.getRp(), mess);
		session.setAttribute("applyleavem", true);
		mv.setViewName("ManagerDashboard.jsp");
		mv.addObject("employee",employee);
		return mv;
	}
	@GetMapping("/leaveAppM")
	public ModelAndView leaveApprovel() {
		List<Applyleave> leave=lrepo.findByRoleAndStatus("Employee","pending");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("LeaveApproveM.jsp");
		mv.addObject("leave",leave);
		return mv;
	}
	
	@GetMapping("appleavehistorym")
	public ModelAndView appLeaveHistory(){
		List<Applyleave> aleave=lrepo.findByRole("Employee");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("AppLeaveHistoryM.jsp");
		mv.addObject("aleave",aleave);
		return mv;
	}
	
	@GetMapping("/empbalhistory")
	public String empBalHistory(HttpServletRequest request){
		int empid=Integer.parseInt(request.getParameter("empid"));
		List<Applyleave> hleave=lrepo.findByEmpid(empid);
		request.setAttribute("leave", hleave);
		return "LeaveHistory.jsp";
		
	}
	@GetMapping("/approveleavem")
	public ModelAndView approveLeave(HttpServletRequest request,HttpSession session) {
		int empid=Integer.parseInt(request.getParameter("empid"));
		int lid=Integer.parseInt(request.getParameter("lid"));
		System.out.println("========="+lid);
		BalanceLeave bleave=balancerepo.getReferenceById(empid);
		System.out.println(bleave);
		Employee employee=repository.getReferenceById(empid);
		Applyleave aleave=lrepo.getReferenceByLid(lid);
		System.out.println(aleave);
		BalanceService bservice=new BalanceService();
		bleave=bservice.balanceL(empid,bleave,aleave);
		System.out.println(bleave.getCasualleave());
		balancerepo.save(bleave);
		
		if(aleave.getStatus().equals("approved")) {
			String msg="Your "+aleave.getLname()+" is approved.";		
			serviceMail.sendApproveReject(employee.getName(), msg, employee.getEmail());
			session.setAttribute("approvealert", true);
		}
		return new ModelAndView("/leaveAppM");
	}
	
	@GetMapping("/rejectleavem")
	public ModelAndView rejectLeave(HttpServletRequest request,HttpSession session) {
		int lid=Integer.parseInt(request.getParameter("lid"));
		Applyleave aleave=lrepo.getReferenceByLid(lid);
		Employee employee=repository.getReferenceById(aleave.getEmpid());
		aleave.setStatus("reject");
		lrepo.save(aleave);
		String msg="Your "+aleave.getLname()+" is rejected.";
		serviceMail.sendApproveReject(employee.getName(), msg, employee.getEmail());
		session.setAttribute("rejectalert", true);
		return new ModelAndView("/leaveAppM");
	}
	
	@GetMapping("/viewprojectm")
	public ModelAndView viewProjectM() {
	
		List<EmployeeProject> pdetails=projectrepo.findAll();
		ModelAndView mv =new ModelAndView();
		mv.setViewName("ViewProjectM.jsp");
		mv.addObject("pdetails",pdetails);
		return mv;
	}
	
	@GetMapping("/assignprojectemp")
	public ModelAndView assignProjectEmp() {
		
		List<Employee> employee=repository.findByRole("Employee");
		
		List<EmployeeProject> pdetails=projectrepo.findAll();
		ModelAndView mv =new ModelAndView();
		mv.setViewName("EmpAssignedProject.jsp");
		mv.addObject("project",pdetails);
		mv.addObject("employee",employee);
		return mv;
	}
	
	
	@GetMapping("/empassigned")
	public ModelAndView empAssigned(EmployeeProject project) {
		
		
		Employee employee=repository.getReferenceByName(project.getAssigned_to());
		EmployeeProject pdetails=projectrepo.getReferenceByName(project.getName());
		pdetails.setAssigned_to(project.getAssigned_to());
		pdetails.setStatus("Active");
		pdetails.setAssigned_by(employee.getRp());
		projectrepo.save(pdetails);
		return new ModelAndView("/viewprojectm");
	}
	@GetMapping("/vieweventsemp")
	public ModelAndView viewEventsEmp() {
		List<Holidays> holiday=holidayRepo.findAll();
		ModelAndView mv =new ModelAndView();
		mv.setViewName("EventsList.jsp");
		mv.addObject("holiday",holiday);
		return mv;
	}
	
	@GetMapping("resetpassm")
	public ModelAndView resetPassM() {
		return new ModelAndView("ResetPassManager.jsp");
	}
	@PostMapping("/resetpassmanager")
	public ModelAndView resetPassManager(HttpServletRequest req,HttpSession session)
	{
		int empid=Integer.parseInt(req.getParameter("emp_id"));
		String opass=req.getParameter("opass");
		String npass=req.getParameter("npass");
		
		Employee employee=repository.getReferenceByEmpidAndPassword(empid,opass);
		
		if(employee==null) {
			session.setAttribute("opasswrong", "*old password is wrong");
			return new  ModelAndView("ResetPassManager.jsp");
		}else {
			employee.setPassword(npass);
			repository.save(employee);
			
			return new  ModelAndView("/logout");
		}
	}
}
