package com.example.sweater.repos;

import com.example.sweater.domain.Order;
import org.springframework.data.repository.CrudRepository;




public interface OrderRepo extends CrudRepository<Order, Long> {


}
