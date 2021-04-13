/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.CarBorrowDAO;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import model.Car_Borrow;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author tranp
 */
public class RegisterCarActionSupport extends ActionSupport implements SessionAware {

    private Car_Borrow car;

    
    public Car_Borrow getCar() {
        return car;
    }

    public void setCar(Car_Borrow car) {
        this.car = car;
    }

    private SessionMap<String, Object> sessionMap;

    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    private String fullname;
    private String email;
    private String phone;
    private int id_car;
    private int id_user;
    private String date;
    private String note;

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
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

    public int getId_car() {
        return id_car;
    }

    public void setId_car(int id_car) {
        this.id_car = id_car;
    }

    public RegisterCarActionSupport() {
    }

    public String execute() throws Exception {
        CarBorrowDAO dao = new CarBorrowDAO();
        car = dao.SelectByIdUser(id_user);
        if (car.getBorrowed() == 0) {
            if (dao.insert(new Car_Borrow(1, date, id_car, note, fullname, phone, email, id_user)) > 0) {
                sessionMap.put("Borrowed", "Đăng ký thành công ");
                return SUCCESS;
            }
        } else {
             sessionMap.put("Borrowed", "Đăng ký không thành công | bạn đã đăng ký mượn xe");
             return SUCCESS;
        }
        return "fail";
    }

    @Override
    public void setSession(Map<String, Object> map) {
        sessionMap = (SessionMap<String, Object>) map;
    }
}
