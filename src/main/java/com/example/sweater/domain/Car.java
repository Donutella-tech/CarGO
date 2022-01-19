package com.example.sweater.domain;

import javax.persistence.*;

@Entity
@Table(name = "cars")
public class Car {

        @Id
        @GeneratedValue(strategy = GenerationType.AUTO)




        private Long id;
        private String carBrand;
        private String car_model;
        private String release_date;
        private String plate_num;
        private String mileage;
        private String carrying_capacity;

    public Car() {
    }

    public Car(String carBrand, String car_model, String release_date, String plate_num, String mileage,String carrying_capacity) {
        this.carBrand = carBrand;
        this.car_model = car_model;
        this.release_date = release_date;
        this.plate_num = plate_num;
        this.mileage = mileage;
        this.carrying_capacity=carrying_capacity;

    }






    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCarBrand() {

        return carBrand;

    }



    public void setCar_brand(String car_brand) {
        this.carBrand = car_brand;
    }

    public String getCarModel() {

        return car_model;

    }

    public void setCar_model(String car_model) {
        this.car_model = car_model;
    }

    public String getDate() {

        return release_date;

    }

    public void setRelease_date(String release_date) {
        this.release_date = release_date;
    }

    public String getPlateNum() {

        return plate_num;

    }

    public void setPlate_num(String plate_num) {
        this.plate_num = plate_num;
    }

    public String getMileage() {
         return mileage;
    }

    public void setMileage(String mileage) {
        this.mileage = mileage;
    }
    public String getCarrying_capacity() {
        return carrying_capacity;
    }

    public void setCarrying_capacity(String carrying_capacity) {
        this.carrying_capacity = carrying_capacity;
    }


}
