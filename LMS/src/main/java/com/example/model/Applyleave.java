package com.example.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Applyleave {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int lid;
	private int empid;
	private String name;
	private String lname;
	private String t_date;
	private String f_date;
	private String tdays;
	private String status;
	
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getT_date() {
		return t_date;
	}
	public void setT_date(String t_date) {
		this.t_date = t_date;
	}
	public String getF_date() {
		return f_date;
	}
	public void setF_date(String f_date) {
		this.f_date = f_date;
	}
	public String getTdays() {
		return tdays;
	}
	public void setTdays(String tdays) {
		this.tdays = tdays;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Applyleave [empid=" + empid + ", name=" + name + ", lname=" + lname + ", t_date=" + t_date + ", f_date="
				+ f_date + ", tdays=" + tdays + ", status=" + status + "]";
	}
	
	

}
