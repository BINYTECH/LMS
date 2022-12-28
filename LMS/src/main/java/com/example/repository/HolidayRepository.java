package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.model.Holidays;

public interface HolidayRepository extends JpaRepository<Holidays, String> {

}
