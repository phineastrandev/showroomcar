/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.ContactDAO;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Date;
import model.ContactUs;
import model.SendEmail;

/**
 *
 * @author tranp
 */
public class ContactUsActionSupport extends ActionSupport {

    private String name;
    private String address;
    private String email;
    private String phone;

    //=====================================
    private ArrayList<ContactUs> arrList;

    public ArrayList<ContactUs> getArrList() {
        return arrList;
    }

    public void setArrList(ArrayList<ContactUs> arrList) {
        this.arrList = arrList;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public ContactUsActionSupport() {
    }

    public String execute() throws Exception {
        ContactDAO dao = new ContactDAO();
        SendEmail s = new SendEmail();
        Date now = new Date();
        java.sql.Date date = new java.sql.Date(now.getTime());
        if (dao.insert(new ContactUs(phone, address, name, email, date)) > 0) {
            s.sendContact(email, "Chúng tôi sẽ sớm liên lạc với bạn!");
            return SUCCESS;
        }
        return ERROR;
    }

    public String getInformation() throws Exception {
        ContactDAO dao = new ContactDAO();
        arrList = dao.selectAll();
        return SUCCESS;
    }

}
