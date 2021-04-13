/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author tranp
 */
public class Car_Borrow {

    private int id;
    private int borrowed;
    private String date;
    private int car_id;
    protected String note;
    private String fullname;
    private String phone;
    private String email;
    private String name_car;
    private String FeedBack;
    private int User_ID;

 

    public Car_Borrow(int id, int borrowed, String date, int car_id, String note, String fullname, String phone, String email, String name_car) {
        this.id = id;
        this.borrowed = borrowed;
        this.date = date;
        this.car_id = car_id;
        this.note = note;
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
        this.name_car = name_car;
    }

    public Car_Borrow(int borrowed, String date, int car_id, String note, String fullname, String phone, String email) {
        this.borrowed = borrowed;
        this.date = date;
        this.car_id = car_id;
        this.note = note;
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
    }

    public Car_Borrow(int borrowed, String date, int car_id, String note, String fullname, String phone, String email, int User_ID) {
        this.borrowed = borrowed;
        this.date = date;
        this.car_id = car_id;
        this.note = note;
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
        this.User_ID = User_ID;
    }

    public Car_Borrow(int borrowed, String date, int car_id, String note, String fullname, String phone, String email, String name_car, String FeedBack, int User_ID) {
        this.borrowed = borrowed;
        this.date = date;
        this.car_id = car_id;
        this.note = note;
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
        this.name_car = name_car;
        this.FeedBack = FeedBack;
        this.User_ID = User_ID;
    }

    public String getFeedBack() {
        return FeedBack;
    }

    public void setFeedBack(String FeedBack) {
        this.FeedBack = FeedBack;
    }

    public int getUser_ID() {
        return User_ID;
    }

    public void setUser_ID(int User_ID) {
        this.User_ID = User_ID;
    }

    public String getName_car() {
        return name_car;
    }

    public void setName_car(String name_car) {
        this.name_car = name_car;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Car_Borrow() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBorrowed() {
        return borrowed;
    }

    public void setBorrowed(int borrowed) {
        this.borrowed = borrowed;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCar_id() {
        return car_id;
    }

    public void setCar_id(int car_id) {
        this.car_id = car_id;
    }

    @Override
    public String toString() {
        return "Car_Borrow{" + "id=" + id + ", borrowed=" + borrowed + ", date=" + date + ", car_id=" + car_id + ", note=" + note + ", fullname=" + fullname + ", phone=" + phone + ", email=" + email + ", name_car=" + name_car + ", FeedBack=" + FeedBack + ", User_ID=" + User_ID + '}';
    }

}
