package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.model.Applyleave;

public interface LeaveRepository extends JpaRepository<Applyleave,Integer> {

	List<Applyleave> findByRole(String role);

	

}
