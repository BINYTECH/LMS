package com.example.service;




import org.springframework.stereotype.Service;

import com.example.model.Applyleave;
import com.example.model.BalanceLeave;


@Service
public class BalanceService {


	
	public BalanceLeave balanceL(int empid,BalanceLeave bleave,Applyleave aleave) {
		
		
		
		int rem=0;
		if(aleave.getLname().equals("Sick Leave")) {
			 rem=bleave.getSickleave()-Integer.parseInt(aleave.getTdays());
			 if(rem>=0) {
				bleave.setSickleave(rem);
				aleave.setStatus("approved");
				
			}
			return bleave;	
		}
		else if(aleave.getLname().equals("Casual Leave")) {
			 rem=bleave.getCasualleave()-Integer.parseInt(aleave.getTdays());
			 if(rem>=0) {
					bleave.setCasualleave(rem);
					aleave.setStatus("approved");
					
				}
			return bleave;	
		}
		else if(aleave.getLname().equals("Personal Leave")) {
			 rem=bleave.getPersonalleave()-Integer.parseInt(aleave.getTdays());
			 if(rem>=0) {
					bleave.setPersonalleave(rem);
					aleave.setStatus("approved");
					
				}
			return bleave;	
		}
		else if(aleave.getLname().equals("Adoption Leave")) {
			 rem=bleave.getAdoptionleave()-Integer.parseInt(aleave.getTdays());
			 if(rem>=0) {
					bleave.setAdoptionleave(rem);
					aleave.setStatus("approved");
					
				}
			 return bleave;	
		}
		else if(aleave.getLname().equals("Maternity Leave")) {
			 rem=bleave.getMaternityleave()-Integer.parseInt(aleave.getTdays());
			 if(rem>=0) {
					bleave.setMaternityleave(rem);
					aleave.setStatus("approved");
					
				}
			 return bleave;	
		}
		else if(aleave.getLname().equals("Paternity Leave")) {
			 rem=bleave.getPaternityleave()-Integer.parseInt(aleave.getTdays());
			 if(rem>=0) {
					bleave.setPaternityleave(rem);
					aleave.setStatus("approved");
					
				}
			return bleave;	
		}
		else if(aleave.getLname().equals("Marriage Leave")) {
			 rem=bleave.getMarriageleave()-Integer.parseInt(aleave.getTdays());
			 if(rem>=0) {
					bleave.setPaternityleave(rem);
					aleave.setStatus("approved");
					
				}
			return bleave;	
		}
		else {
		return bleave;
		}
	}
}
