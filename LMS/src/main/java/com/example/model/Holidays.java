package com.example.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Holidays {
	@Id
	private String hdate;
	private String hname;
	private String hday;
	public String getHdate() {
		return hdate;
	}
	public void setHdate(String hdate) {
		this.hdate = hdate;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getHday() {
		return hday;
	}
	public void setHday(String hday) {
		this.hday = hday;
	}
	@Override
	public String toString() {
		return "Holidays [hdate=" + hdate + ", hname=" + hname + ", hday=" + hday + "]";
	}
	
	
	
}
