package com.example.sweater.controller;

import com.example.sweater.domain.*;
import com.example.sweater.repos.CarRepo;

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
public class CarController {
    @Autowired
    CarRepo carRepo;

    String sendMessage="cars";


    @GetMapping("/cars")
    public String cars(@RequestParam(required = false, defaultValue = "")String filter,Model model) {
        Iterable<Car> cars;
       if (filter != null && !filter.isEmpty()) {
         cars = carRepo.findByCarBrand(filter);

        } else {
            cars = carRepo.findAll();
        }




        model.addAttribute(sendMessage, cars);
        model.addAttribute("filter",filter);
        return "cars";


    }


    @PostMapping("/cars")
    public String addCar(
                      @RequestParam String carBrand,
                      @RequestParam String car_model,
                      @RequestParam String mileage,
                       @RequestParam String release_date,
                      @RequestParam  String plate_num,
                      @RequestParam String carrying_capacity,


                      Map<String, Object> model
    )
    {

        Car car = new Car(carBrand,car_model,release_date,plate_num,mileage,carrying_capacity);
        carRepo.save(car);
        Iterable<Car> cars=carRepo.findAll();

        model.put(sendMessage, cars);

        return "redirect:/cars";
    }
    @GetMapping("/cars/{id}")
    public String additionalInfo(@PathVariable(value = "id")Long id, Model model) {
        Optional<Car> cars=carRepo.findById(id);
        ArrayList<Car> result=new ArrayList<>();
        cars.ifPresent(result::add);
        model.addAttribute(sendMessage,result);
        return "additional-info-cars";
    }

    @GetMapping("/cars/{id}/edit")
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


}
