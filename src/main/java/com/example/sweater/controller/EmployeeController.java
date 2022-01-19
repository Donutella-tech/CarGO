package com.example.sweater.controller;

import com.example.sweater.domain.Employee;
import com.example.sweater.repos.EmployeeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Map;
import java.util.Optional;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeRepo employeeRepo;


    String sendMessage = "employees";


    @GetMapping("/employees")
    public String showEmployees(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Employee> employees;
        if (filter != null && !filter.isEmpty()) {
            employees = employeeRepo.findBySurname(filter);

        } else {
            employees = employeeRepo.findAll();
        }


        model.addAttribute(sendMessage, employees);
        model.addAttribute("filter", filter);
        return "employees";


    }


    @PostMapping("/employees")
    public String addEmployee(
            @RequestParam String name,
            @RequestParam String surname,
            @RequestParam String address,
            @RequestParam String passport_id,

            Map<String, Object> model
    ) {

        Employee employee = new Employee(name, surname, address, passport_id);
        employeeRepo.save(employee);
        Iterable<Employee> employees = employeeRepo.findAll();

        model.put(sendMessage, employees);

        return "redirect:/employees";
    }

    @GetMapping("/employees/{id}")
    public String additionalInfo(@PathVariable(value = "id") Long id, Model model) {
        Optional<Employee> employee = employeeRepo.findById(id);
        ArrayList<Employee> result = new ArrayList<>();
        employee.ifPresent(result::add);
        model.addAttribute(sendMessage, result);
        return "employee_additional";
    }

 @GetMapping("/employees/{id}/edit")
    public String EditMessage( @PathVariable(value = "id")Long id,  Model model) {
        if(!employeeRepo.existsById(id))
        {
            return "redirect:/employees";
        }
        Optional<Employee> employee=employeeRepo.findById(id);
        ArrayList<Employee> result=new ArrayList<>();
        employee.ifPresent(result::add);
        model.addAttribute(sendMessage,result);
        return "employeeEdit";
    }

    @PostMapping("/employees/{id}/edit")
    public String Update( @PathVariable(value = "id")Long id,
                          @RequestParam String name,
                          @RequestParam String surname,
                          @RequestParam String address,
                          @RequestParam String passport_id
    )
    {

        Employee employees=employeeRepo.findById(id).orElseThrow();


        employees.setName(name);
        employees.setSurname(surname);
        employees.setAddress(address);
        employees.setPassport_id(passport_id);

        employeeRepo.save(employees);

        return "redirect:/employees";
    }
    @PostMapping("/employees/{id}/delete")
    public String Delete(@PathVariable(value = "id")Long id) {
        if (!employeeRepo.existsById(id)) {
            return "redirect:/employees";
        }

        Employee employees = employeeRepo.findById(id).orElseThrow();
        employeeRepo.delete(employees);

        return "redirect:/employees";
    }

}