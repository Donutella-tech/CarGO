package com.example.sweater.controller;

import com.example.sweater.domain.*;

import com.example.sweater.repos.OrderRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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
public class OrderController {
    String sendMessage = "messages";
    @Autowired
    private OrderRepo orderRepo;


    @GetMapping("/")
    public String greeting(Map<String, Object> model) {

        return "greeting";
    }

    @GetMapping("/history")
    public String history(@RequestParam(required = false, defaultValue = "")String filter, Model model) {
        Iterable<Order> messages;
       /* if (filter != null && !filter.isEmpty()) {
            messages = OrderRepo.findBySurname(filter);

        } else {
            messages = messageRepo.findAll();
        }*/
        messages = orderRepo.findAll();
        model.addAttribute(sendMessage, messages);
        model.addAttribute("filter",filter);
        return "history";
    }



@GetMapping("/map")
public  String map(){return "map";}







    @PostMapping("/map")
    public String map(@AuthenticationPrincipal User user,
                        @RequestParam String departure,
                        @RequestParam String destination,
                        @RequestParam String distance,
                        @RequestParam String price,


                        Map<String, Object> model

    )
    {

        Order order = new Order(departure, destination,distance,price);

        orderRepo.save(order);
        Iterable<Order> messages = orderRepo.findAll();
        model.put(sendMessage, messages);

        return "redirect:/map";
    }







  /*  @PostMapping("/main/{id}/delete")
    public String Delete(@PathVariable(value = "id")Long id)
    {   if(!messageRepo.existsById(id))
    {
        return "redirect:/accidents";
    }

        Message message=messageRepo.findById(id).orElseThrow();


        messageRepo.delete(message);

        return "redirect:/main";
    }

    @GetMapping("/main/{id}")
    public String additionalInfo( @PathVariable(value = "id")Long id,  Model model) {
        Optional<Message> messages=messageRepo.findById(id);
        ArrayList<Message> result=new ArrayList<>();
        messages.ifPresent(result::add);
        model.addAttribute(sendMessage,result);
        return "additional-info";
    }

    @GetMapping("/main/{id}/edit")
    public String EditMessage( @PathVariable(value = "id")Long id,  Model model) {
        if(!messageRepo.existsById(id))
        {
            return "redirect:/main";
        }
        Optional<Message> messages=messageRepo.findById(id);
        ArrayList<Message> result=new ArrayList<>();
        messages.ifPresent(result::add);
        model.addAttribute(sendMessage,result);
        return "message_edit";
    }

    @PostMapping("/main/{id}/edit")
    public String Update( @PathVariable(value = "id")Long id,
                      @RequestParam String surname,
                      @RequestParam String name,
                      @RequestParam String patronymic,
                      @RequestParam String dateOfBirth,
                      @RequestParam String city,
                      @RequestParam String street,
                      @RequestParam String apartment,
                      @RequestParam String nameOfPosition,
                      @RequestParam Long salary,
                      Map<String, Object> model

    )
    {

        Message message=messageRepo.findById(id).orElseThrow();

        message.setName(name);
        message.setSurname(surname);
        message.setPatronymic(patronymic);
        message.setDateName(dateOfBirth);
        message.setCityName(city);
        message.setStreetName(street);
        message.setApartmentName(apartment);
        message.setPositionName(nameOfPosition);
        message.setSalary(salary);

        messageRepo.save(message);

        return "redirect:/main";
    }*/

}