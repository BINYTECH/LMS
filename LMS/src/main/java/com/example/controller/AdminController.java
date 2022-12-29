package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
import com.example.service.EmployeeService;

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
	

	@GetMapping("/employeeadd")
	public ModelAndView employeeAdd() {
		List<Employee> employee=repository.findByRoleOrRole("Admin","Manager");
		ModelAndView mv =new ModelAndView();
		mv.setViewName("AddEmployee.jsp");
		mv.addObject("employee",employee);
		return mv;
	}
	@GetMapping("/addemp")
	public ModelAndView addEmployee(Employee employee) {
		BalanceLeave bleave=new BalanceLeave();
		EmployeeService service=new EmployeeService();
		String username=service.genrateUsername(employee.getName());
		String password=service.genratePassword();
		employee.setUsername(username);
		employee.setPassword(password);
		System.out.println(employee);
		
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
		return new ModelAndView("/employeedetails");
		
	}
	@GetMapping("/employeedetails")
	public ModelAndView viewEmp() {
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
	public ModelAndView editEmployee(Employee employee) {
		System.out.println(employee.getEmpid());
		Employee employees=repository.getReferenceById(employee.getEmpid());
		employee.setPassword(employees.getPassword());
		employee.setRp(employees.getRp());
		System.out.println(employee);
		repository.save(employee);
		return new ModelAndView("/employeedetails");
	}
	@GetMapping("/delete")
	public String deleteEmployee(HttpServletRequest request) {
		int empid=Integer.parseInt(request.getParameter("empid"));
		Employee employee=repository.getReferenceById(empid);
		repository.delete(employee);
		return "employeedetails";
	}
	
	@GetMapping("/addevent")
	public String addEvents(Holidays holiday) {
		EmployeeService service=new EmployeeService();
		
		String weekday=service.getWeek(holiday.getHdate());
		holiday.setHday(weekday);
		holidayRepo.save(holiday);
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
	public String addProject(EmployeeProject project) {
		projectRepo.save(project);
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
		List<Applyleave> leave=lrepo.findByRole("Manager");
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("LeaveApprove.jsp");
		mv.addObject("leave",leave);
		
		return mv;
	}
	
	@GetMapping("/employee")
	public String welcome2() {
		return "EmployeeDashboard.jsp";
	}
	
}
