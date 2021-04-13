/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.CarDAO;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Car;
import model.Color;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author tranp
 */
public class ManagerCarAction extends ActionSupport implements SessionAware{

    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String name, gear, lwh ;
    private float price,fulload, fuel;
    private float wheelbase;

    public float getWheelbase() {
        return wheelbase;
    }

    public void setWheelbase(float wheelbase) {
        this.wheelbase = wheelbase;
    }

    private Car car;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGear() {
        return gear;
    }

    public void setGear(String gear) {
        this.gear = gear;
    }

    public String getLwh() {
        return lwh;
    }

    public void setLwh(String lwh) {
        this.lwh = lwh;
    }

    public float getFulload() {
        return fulload;
    }

    public void setFulload(float fulload) {
        this.fulload = fulload;
    }

    public float getFuel() {
        return fuel;
    }

    public void setFuel(float fuel) {
        this.fuel = fuel;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

 

    

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public ManagerCarAction() {
    }

    private String msg;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
    
    public String execute() throws Exception {
        CarDAO dao = new CarDAO();
        if (dao.UpdateCar(id, name, price, gear, lwh, wheelbase, fulload, fuel) > 0) {
            return SUCCESS;
        }
       
        return "fail";
    }
    //== add car 1 ====================================
    private String  brand, image, url;
    

    public String addCar1() throws Exception {
        CarDAO dao = new CarDAO();
        if (dao.insertCar1(new Car(name, brand, price, image, url)) > 0) {
            sessionMap.put("ThemOk", "ok");
            return SUCCESS;
        }
        sessionMap.put("ThemOkk", "Thêm không thành công");
        return "fail";
    }
    
    private String enginer;
    private float time_per_100;
    private String img_list;
    private float pre_order;

    public float getTime_per_100() {
        return time_per_100;
    }

    public void setTime_per_100(float time_per_100) {
        this.time_per_100 = time_per_100;
    }

    public String getImg_list() {
        return img_list;
    }

    public void setImg_list(String img_list) {
        this.img_list = img_list;
    }

    public float getPre_order() {
        return pre_order;
    }

    public void setPre_order(float pre_order) {
        this.pre_order = pre_order;
    }

    public String getEnginer() {
        return enginer;
    }

    public void setEnginer(String enginer) {
        this.enginer = enginer;
    }
    
     public String addCar2() throws Exception {
        CarDAO dao = new CarDAO();
        int id_lastCar = dao.getLastIdCar();
        if (dao.insertCar2(new Car(id_lastCar,lwh, wheelbase, fulload,  fuel,  enginer,  time_per_100,  gear,  img_list,  pre_order)) > 0) {
           
            return SUCCESS;
        }
        return "fail";
    }
    //====delete car===================================

    public String DeleteCarByID() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id_car"));
        CarDAO dao = new CarDAO();
        if (dao.DeleteCarByID(id) > 0) {
            return SUCCESS;
        }
        return "fail";
    }

    //========================Show color car admin
    private ArrayList<Color> listColor;

    public ArrayList<Color> getListColor() {
        return listColor;
    }

    public void setListColor(ArrayList<Color> listColor) {
        this.listColor = listColor;
    }

    public String ShowColor() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        int idc = Integer.parseInt(ServletActionContext.getRequest().getParameter("id_car"));
        CarDAO dao = new CarDAO();
        id_car = dao.getIdCar(idc);
        listColor = dao.getColorByID(idc);
        return SUCCESS;
    }

    // = =================================== add color=====
    private String name_color;
    private String id_color;
    private String img_color;
    private int id_car;

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public String getName_color() {
        return name_color;
    }

    public void setName_color(String name_color) {
        this.name_color = name_color;
    }

    public String getId_color() {
        return id_color;
    }

    public void setId_color(String id_color) {
        this.id_color = id_color;
    }

    public String getImg_color() {
        return img_color;
    }

    public void setImg_color(String img_color) {
        this.img_color = img_color;
    }

    public int getId_car() {
        return id_car;
    }

    public void setId_car(int id_car) {
        this.id_car = id_car;
    }

    public String AddColor() throws Exception {
        CarDAO dao = new CarDAO();
        Color cl = new Color(id_car, name_color, img_color, id_color);
        if (dao.insertColor(cl) > 0) {
            return "success";
        } else {
            return "fail";
        }
    }

    public String DeleteColor() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        int idc = Integer.parseInt(ServletActionContext.getRequest().getParameter("id_color"));
        CarDAO dao = new CarDAO();
        id_car = dao.getIdCar(idc);
        if (dao.DeleteColor(idc) > 0) {
            return "success";
        } else {
            return "fail";
        }
    }
     private SessionMap<String, Object> sessionMap;

    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        sessionMap = (SessionMap<String, Object>) map;
    }

}
