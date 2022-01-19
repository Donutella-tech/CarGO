package com.example.sweater.domain;

import javax.persistence.*;


@Entity
@Table(name = "employees")
public class Employee {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)


    private Long id;
    private String name;
    private String surname;
    private String address;
    private String passport_id;


    public Employee() {
    }

    public Employee(String name, String surname, String address, String passport_id) {
        this.name = name;
        this.surname = surname;
        this.address = address;
        this.passport_id = passport_id;


    }


    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassport_id() {
        return passport_id;
    }

    public void setPassport_id(String passport_id) {
        this.passport_id = passport_id;
    }

    public void setId(Long id) {
        this.id = id;
    }


}
