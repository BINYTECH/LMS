package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.model.DeletedEmployee;


public interface DeleteRepository extends JpaRepository<DeletedEmployee, Integer>{

	

}
