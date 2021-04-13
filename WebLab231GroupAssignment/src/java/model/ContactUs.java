/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author tranp
 */
public class ContactUs {

    private int id;
    private String phone;
    private String address;
    private String name;
    private String email;
    private Date date;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public ContactUs() {
    }

    public ContactUs(String phone, String address, String name, String email) {
        this.phone = phone;
        this.address = address;
        this.name = name;
        this.email = email;
    }

    public ContactUs(String phone, String address, String name, String email, Date date) {
        this.phone = phone;
        this.address = address;
        this.name = name;
        this.email = email;
        this.date = date;
    }
    

}
