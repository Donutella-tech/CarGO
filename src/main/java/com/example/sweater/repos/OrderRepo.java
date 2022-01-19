package com.example.sweater.repos;


import com.example.sweater.domain.Employee;
import com.example.sweater.domain.Order;
import org.springframework.data.repository.CrudRepository;

import java.util.List;


public interface OrderRepo extends CrudRepository<Order, Long> {

     List<Order> findByAuthor(String author);
}
