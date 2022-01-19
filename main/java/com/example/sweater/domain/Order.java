package com.example.sweater.domain;

import org.hibernate.annotations.Cascade;

import javax.persistence.*;

@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String departure;
    private String destination;
    private String distance;
    private String price;
    private String ordered_car;



    /*@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;
*/

    public Order(){}


    public Order(String departure, String destination, String distance,String price) {
        this.departure = departure;
        this.destination = destination;
        this.distance=distance;
        this.price=price;
        this.ordered_car=ordered_car;

    }







    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }
    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
    public String getOrdered_car() {
        return ordered_car;
    }

    public void setOrdered_car(String ordered_car) {
        this.ordered_car = ordered_car;
    }


  /*  public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }*/
}
