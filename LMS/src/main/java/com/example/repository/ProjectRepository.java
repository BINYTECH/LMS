package com.example.repository;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.model.EmployeeProject;

public interface ProjectRepository extends JpaRepository<EmployeeProject, Integer>{

	@Query(value = "SELECT * FROM Employee_Project WHERE Assigned_to=?1 ", nativeQuery = true)
	List<EmployeeProject> findByAssigned_to(String assigned_to);

	EmployeeProject getReferenceByName(String name);

	

}
