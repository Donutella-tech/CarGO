package com.example.sweater.repos;


import com.example.sweater.domain.Car;
import com.example.sweater.domain.Employee;
import org.springframework.data.repository.CrudRepository;

import java.util.List;


public interface EmployeeRepo extends CrudRepository<Employee, Long> {

    List<Employee> findBySurname(String surname);
}

