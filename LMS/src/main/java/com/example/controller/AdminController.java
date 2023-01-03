package com.example.controller;


import java.util.List;

import javax.mail.Session;
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
import com.example.service.EmployeeService;
import com.example.service.SendMailEmp;

@Controller
public class AdminController {
	
	@Autowired
	EmployeeRepository repository;
	
	@Autowired
	ProjectRepository projectRepo;
	
	@Autowired
	HolidayRepository holidayRepo;
	
	@Autowired
	LeaveRepository lrepo;
	
	@Autowired
	BalanceLeaveRepo balancerepo;
	
	@Autowired
	SendMailEmp serviceMail;
	
	@GetMapping("/dashboard")
	public ModelAndView empDashboard() {
	return new ModelAndView("AdminDashboard.jsp");
	}
	
	@GetMapping("/profilea")
	public ModelAndView profileE(HttpServletRequest req) {
		int empid=Integer.parseInt(req.getParameter("empid"));
		Employee employee=repository.getReferenceById(empid);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("profileA.jsp");
		mv.addObject("employee",employee);
		return mv;
	}
	
	@GetMapping("/employeeadd")
	public ModelAndView employeeAdd() {
		List<Employee> employee=repository.findByRoleOrRole("Admin","Manager");
		ModelAndView mv =new ModelAndView();
		mv.setViewName("AddEmployee.jsp");
		mv.addObject("employee",employee);
		return mv;
	}
	@GetMapping("/addemp")
	public ModelAndView addEmployee(Employee employee,HttpServletRequest req,HttpSession session) {
		BalanceLeave bleave=new BalanceLeave();
		EmployeeService service=new EmployeeService();
		String username=service.genrateUsername(employee.getName());
		String password=service.genratePassword();
		employee.setUsername(username);
		employee.setPassword(password);
		System.out.println(employee);
		try {
		repository.save(employee);
		bleave.setEmpid(employee.getEmpid());
		bleave.setAdoptionleave(30);
		bleave.setCasualleave(15);
		bleave.setMarriageleave(15);
		bleave.setMaternityleave(180);
		bleave.setPaternityleave(30);
		bleave.setSickleave(15);
		bleave.setPersonalleave(15);
		balancerepo.save(bleave);
		
		serviceMail.sendEmail(username, password, employee.getEmail());
		session.setAttribute("addsuccess", true);
		return new ModelAndView("/employeedetails");
		}
		catch (Exception e) {
			
			return new ModelAndView("/employeedetails");
		}
		
		
		
	}
	@GetMapping("/employeedetails")
	public ModelAndView viewEmp(HttpServletRequest req) {
		List<Employee> employee=repository.findByRoleOrRole("Manager","Employee");
		
		System.out.println(employee);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("EmployeeDetails.jsp");
		mv.addObject("employee",employee);
		return mv;
	}
	@GetMapping("/editdetails")
	public String editEmployee(HttpServletRequest request) {
		int empid=Integer.parseInt(request.getParameter("empid"));
		Employee employee=repository.getReferenceById(empid);
		System.out.println(employee);
		request.setAttribute("employee", employee);
		return "update.jsp";
	}
	
	@GetMapping("/update")
	public ModelAndView editEmployee(Employee employee,HttpSession session) {
		System.out.println(employee.getEmpid());
		Employee employees=repository.getReferenceById(employee.getEmpid());
		employee.setPassword(employees.getPassword());
		employee.setRp(employees.getRp());
		System.out.println(employee);
		try {
		repository.save(employee);
		session.setAttribute("updatesuccess", true);
		}catch (Exception e) {
			return new ModelAndView("/employeedetails");
		}
		return new ModelAndView("/employeedetails");
	}
	@GetMapping("/delete")
	public String deleteEmployee(HttpServletRequest request,HttpSession session) {
		int empid=Integer.parseInt(request.getParameter("empid"));
		Employee employee=repository.getReferenceById(empid);
		repository.delete(employee);
		session.setAttribute("deletesuccess", true);
		return "employeedetails";
	}
	
	@GetMapping("/addevent")
	public String addEvents(Holidays holiday,HttpSession session) {
		EmployeeService service=new EmployeeService();
		
		String weekday=service.getWeek(holiday.getHdate());
		holiday.setHday(weekday);
		holidayRepo.save(holiday);
		session.setAttribute("eventaddsuccess", true);
		return "/viewevents";
		
	}
	@GetMapping("/viewevents")
	public ModelAndView viewEvents() {
		List<Holidays> holiday=holidayRepo.findAll();
		ModelAndView mv =new ModelAndView();
		mv.setViewName("Holidays_list.jsp");
		mv.addObject("holiday",holiday);
		return mv;
	}
	
	@GetMapping("/proassign")
	public ModelAndView proAssign() {
		List<Employee> employee=repository.findByRole("Employee");
		ModelAndView mv =new ModelAndView();
		mv.setViewName("AddProject.jsp");
		mv.addObject("employee",employee);
		return mv;
	}
	
	@GetMapping("/addproject")
	public String addProject(EmployeeProject project,HttpSession session) {
		project.setStatus("Inactive");
		projectRepo.save(project);
		session.setAttribute("addprosuccess", true);
		return "/viewproject";
	}
	
	@GetMapping("/viewproject")
	public ModelAndView viewProject() {
		List<EmployeeProject> pdetails=projectRepo.findAll();
		ModelAndView mv =new ModelAndView();
		mv.setViewName("ViewProject.jsp");
		mv.addObject("pdetails",pdetails);
		return mv;
	}
	@GetMapping("/deleteproject")
	public String deleteProject(HttpServletRequest request) {
		int pid=Integer.parseInt(request.getParameter("pid"));
		projectRepo.deleteById(pid);
		return "/viewproject";
	}
	
	
	@GetMapping("/leaveAPP")
	public ModelAndView leaveApprovel() {
		List<Applyleave> leave=lrepo.findByRoleAndStatus("Manager","pending");
		System.out.println(leave);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("LeaveApprove.jsp");
		mv.addObject("leave",leave);
		
		return mv;
	}

	@GetMapping("/viewbalanceleave")
	public ModelAndView viewBalanceLeave(HttpServletRequest request) {
		int empid=Integer.parseInt(request.getParameter("empid"));
		BalanceLeave bleave=balancerepo.getReferenceById(empid);
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("BalanceLeave.jsp");
		mv.addObject("bleave",bleave);
		
		return mv;
	}
	
	@GetMapping("appleavehistory")
	public ModelAndView appLeaveHistory(){
		List<Applyleave> aleave=lrepo.findByRole("Manager");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("AppLeaveHistory.jsp");
		mv.addObject("aleave",aleave);
		return mv;
	}
	
	@GetMapping("/approveleave")
	public ModelAndView approveLeave(HttpServletRequest request,HttpSession session) {
		int empid=Integer.parseInt(request.getParameter("empid"));
		int lid=Integer.parseInt(request.getParameter("lid"));
		System.out.println("========="+lid);
		Employee employee=repository.getReferenceById(empid);
		BalanceLeave bleave=balancerepo.getReferenceById(empid);
		System.out.println(bleave);
	
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
		
		return new ModelAndView("/leaveAPP");
	}
	
	@GetMapping("/rejectleave")
	public ModelAndView rejectLeave(HttpServletRequest request,HttpSession session) {
		int lid=Integer.parseInt(request.getParameter("lid"));
		Applyleave aleave=lrepo.getReferenceByLid(lid);
		
		Employee employee=repository.getReferenceById(aleave.getEmpid());
		aleave.setStatus("reject");
		lrepo.save(aleave);
		String msg="Your "+aleave.getLname()+" is rejected.";
		serviceMail.sendApproveReject(employee.getName(), msg, employee.getEmail());
		session.setAttribute("rejectalert", true);
		return new ModelAndView("/leaveAPP");
	}
	
	@GetMapping("resetpass")
	public ModelAndView resetPass() {
		
		return new ModelAndView("ResetPass.jsp");
	}
	@PostMapping("/resetpassA")
	public ModelAndView resetPassA(HttpServletRequest req,HttpSession session)
	{
		int empid=Integer.parseInt(req.getParameter("emp_id"));
		String opass=req.getParameter("opass");
		String npass=req.getParameter("npass");
		
		Employee employee=repository.getReferenceByEmpidAndPassword(empid,opass);
		if(employee==null) {
			session.setAttribute("opasswrong", "*old password is wrong");
			return new  ModelAndView("ResetPass.jsp");
		}else {
			employee.setPassword(npass);
			repository.save(employee);
			
			return new  ModelAndView("/logout");
		}
	}
	
	
	
	
	
	@GetMapping("/addadmin")
	public ModelAndView addAdmin(Employee employee) {
		EmployeeService service=new EmployeeService();
		String username=service.genrateUsername(employee.getName());
		String password=service.genratePassword();
		employee.setUsername(username);
		employee.setPassword(password);
		System.out.println(employee);
		
		repository.save(employee);
		
		serviceMail.sendEmail(username, password, employee.getEmail());
		return new ModelAndView("/employeedetails");
		
	}
}
