package com.example.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;



@Entity
public class EmployeeProject {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int pid;
	private String name;
	private String description;
	@Column(nullable = true)
	private String assigned_to;
	private String assigned_by;
	private String status;
	private String s_date;
	private String e_date;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAssigned_to() {
		return assigned_to;
	}
	public void setAssigned_to(String assigned_to) {
		this.assigned_to = assigned_to;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getE_date() {
		return e_date;
	}
	public void setE_date(String e_date) {
		this.e_date = e_date;
	}
	public String getAssigned_by() {
		return assigned_by;
	}
	public void setAssigned_by(String assigned_by) {
		this.assigned_by = assigned_by;
	}
	@Override
	public String toString() {
		return "EmployeeProject [pid=" + pid + ", name=" + name + ", description=" + description + ", assigned_to="
				+ assigned_to + ", assigned_by=" + assigned_by + ", status=" + status + ", s_date=" + s_date
				+ ", e_date=" + e_date + "]";
	}
	
	
	
	
	
	
}
