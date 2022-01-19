package com.example.sweater.controller;

import com.example.sweater.domain.Car;
import com.example.sweater.domain.Employee;
import com.example.sweater.repos.CarRepo;
import com.example.sweater.repos.EmployeeRepo;
import com.example.sweater.repos.OrderRepo;
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
        return "additional-info-employees";
    }

   /* @GetMapping("/cars/{id}/edit")
    public String EditMessage( @PathVariable(value = "id")Long id,  Model model) {
        if(!carRepo.existsById(id))
        {
            return "redirect:/main";
        }
        Optional<Car> cars=carRepo.findById(id);
        ArrayList<Car> result=new ArrayList<>();
        cars.ifPresent(result::add);
        model.addAttribute(sendMessage,result);
        return "cars_edit";
    }

    @PostMapping("/cars/{id}/edit")
    public String Update( @PathVariable(value = "id")Long id,
                          @RequestParam String car_brand,
                          @RequestParam String car_model,
                          @RequestParam String release_date,
                          @RequestParam String plate_num,
                          @RequestParam String mileage
    )
    {

        Car cars=carRepo.findById(id).orElseThrow();


        cars.setCar_brand(car_brand);
        cars.setCar_model(car_model);
        cars.setRelease_date(release_date);
        cars.setMileage(mileage);

        carRepo.save(cars);

        return "redirect:/cars";
    }
    @PostMapping("/cars/{id}/delete")
    public String Delete(@PathVariable(value = "id")Long id)
    {   if(!carRepo.existsById(id))
    {
        return "redirect:/cars";
    }

        Car cars=carRepo.findById(id).orElseThrow();
        carRepo.delete(cars);

        return "redirect:/cars";
    }
*/
}