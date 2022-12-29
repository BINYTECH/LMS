package com.example.repository;



import org.springframework.data.jpa.repository.JpaRepository;

import com.example.model.EmployeeProject;

public interface ProjectRepository extends JpaRepository<EmployeeProject, Integer>{

	

}
