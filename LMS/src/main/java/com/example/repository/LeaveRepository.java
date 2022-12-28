package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.model.Applyleave;

public interface LeaveRepository extends JpaRepository<Applyleave,Integer> {

}
