package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.model.Applyleave;
import com.example.repository.LeaveRepository;

@Controller
public class ManagerController {
	
	@Autowired
	LeaveRepository lrepo;

	@GetMapping("/manager")
	public String welcome3() {
		return "ManagerDashboard.jsp";
	}
	
	@GetMapping("/appleave")
	public String applyLeave(Applyleave aleave) {
		aleave.setStatus("pending");
		lrepo.save(aleave);
		
		return "/manager";
	}
	
	
}
