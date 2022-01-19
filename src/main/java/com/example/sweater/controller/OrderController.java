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

  /*    if (filter != null && !filter.isEmpty()) {

          messages=orderRepo.findByAuthor(filter);

        } else {

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
                      @RequestParam String contact,


                        Map<String, Object> model

    )
    {

        Order order = new Order(departure, destination,distance,price,user,contact);

        orderRepo.save(order);
        Iterable<Order> messages = orderRepo.findAll();
        model.put(sendMessage, messages);

        return "redirect:/map";
    }







    @PostMapping("/history/{id}/delete")
    public String Delete(@PathVariable(value = "id")Long id)
    {   if(!orderRepo.existsById(id))
    {
        return "redirect:/history";
    }

        Order order=orderRepo.findById(id).orElseThrow();


        orderRepo.delete(order);

        return "redirect:/history";
    }

    @GetMapping("/history/{id}")
    public String additionalInfo( @PathVariable(value = "id")Long id,  Model model) {
        Optional<Order> orders=orderRepo.findById(id);
        ArrayList<Order> result=new ArrayList<>();
        orders.ifPresent(result::add);
        model.addAttribute(sendMessage,result);
        return "history_additional";
    }

    @GetMapping("/history/{id}/edit")
    public String EditMessage( @PathVariable(value = "id")Long id,  Model model) {
        if(!orderRepo.existsById(id))
        {
            return "redirect:/history";
        }
        Optional<Order> messages=orderRepo.findById(id);
        ArrayList<Order> result=new ArrayList<>();
        messages.ifPresent(result::add);
        model.addAttribute(sendMessage,result);
        return "history_edit";
    }

    @PostMapping("/history/{id}/edit")
    public String Update( @PathVariable(value = "id")Long id,
                          @RequestParam String departure,
                          @RequestParam String destination,
                          @RequestParam String distance,
                          @RequestParam String price,
                          @RequestParam String ordered_car,
                      Map<String, Object> model

    )
    {

        Order order=orderRepo.findById(id).orElseThrow();

        order.setDeparture(departure);
        order.setDestination(destination);
        order.setDistance(distance);
        order.setPrice(price);
        order.setOrdered_car(ordered_car);

        orderRepo.save(order);

        return "redirect:/history";
    }

}