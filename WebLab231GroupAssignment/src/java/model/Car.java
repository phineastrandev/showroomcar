/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author tranp
 */
 public class Car {

    private int id;
    private String name;
    private String brand;
    private float price;
    private String img;
    private int event;
    private String url;
    private String LxWxH;
    private float wheelbase;
    private float fullload;
    private float fuel;
    private String engine;
    private float time_per_100;
    private String gear;
    private String color;
    private String img_color;
    private String color_code;
    private String banner_img;
    private String img_front;
    private String car_logo;
    private String img_list;
    private float preOderPrice;
    private String contentList;

   
    
    public Car() {
    }

    public Car(int id, String name, String brand, float price, String img, int event, String url, String LxWxH, float wheelbase, float fullload, float fuel, String engine, float time_per_100, String gear, String img_list, float preOderPrice, String contentList) {
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.price = price;
        this.img = img;
        this.event = event;
        this.url = url;
        this.LxWxH = LxWxH;
        this.wheelbase = wheelbase;
        this.fullload = fullload;
        this.fuel = fuel;
        this.engine = engine;
        this.time_per_100 = time_per_100;
        this.gear = gear;
        this.img_list = img_list;
        this.preOderPrice = preOderPrice;
        this.contentList = contentList;
    }

    public Car(String name, String brand, float price, String img, String url) {
        this.name = name;
        this.brand = brand;
        this.price = price;
        this.img = img;
        this.url = url;
    }

    public Car(int id, String LxWxH, float wheelbase, float fullload, float fuel, String engine, float time_per_100, String gear, String img_list, float preOderPrice) {
        this.id = id;
        this.LxWxH = LxWxH;
        this.wheelbase = wheelbase;
        this.fullload = fullload;
        this.fuel = fuel;
        this.engine = engine;
        this.time_per_100 = time_per_100;
        this.gear = gear;
        this.img_list = img_list;
        this.preOderPrice = preOderPrice;
    }


    public Car(int id, String name, String brand, float price, String img, int event, String url, String LxWxH, float wheelbase, float fullload, float fuel, String engine, float time_per_100, String gear, String banner_img, String img_front, String car_logo) {
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.price = price;
        this.img = img;
        this.event = event;
        this.url = url;
        this.LxWxH = LxWxH;
        this.wheelbase = wheelbase;
        this.fullload = fullload;
        this.fuel = fuel;
        this.engine = engine;
        this.time_per_100 = time_per_100;
        this.gear = gear;
        this.banner_img = banner_img;
        this.img_front = img_front;
        this.car_logo = car_logo;
    }

    
    public Car(int id, String name, String brand, float price, String img, int event, String url, String LxWxH, float wheelbase, float fullload, float fuel, String engine, float time_per_100, String gear, String color, String img_color, String color_code, String banner_img, String img_front) {
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.price = price;
        this.img = img;
        this.event = event;
        this.url = url;
        this.LxWxH = LxWxH;
        this.wheelbase = wheelbase;
        this.fullload = fullload;
        this.fuel = fuel;
        this.engine = engine;
        this.time_per_100 = time_per_100;
        this.gear = gear;
        this.color = color;
        this.img_color = img_color;
        this.color_code = color_code;
        this.banner_img = banner_img;
        this.img_front = img_front;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

   
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getEvent() {
        return event;
    }

    public void setEvent(int event) {
        this.event = event;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getLxWxH() {
        return LxWxH;
    }

    public void setLxWxH(String LxWxH) {
        this.LxWxH = LxWxH;
    }

    public float getWheelbase() {
        return wheelbase;
    }

    public void setWheelbase(float wheelbase) {
        this.wheelbase = wheelbase;
    }

    public float getFullload() {
        return fullload;
    }

    public void setFullload(float fullload) {
        this.fullload = fullload;
    }

    public float getFuel() {
        return fuel;
    }

    public void setFuel(float fuel) {
        this.fuel = fuel;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }

    public float getTime_per_100() {
        return time_per_100;
    }

    public void setTime_per_100(float time_per_100) {
        this.time_per_100 = time_per_100;
    }

    public String getGear() {
        return gear;
    }

    public void setGear(String gear) {
        this.gear = gear;
    }

    public String getImg_color() {
        return img_color;
    }

    public void setImg_color(String img_color) {
        this.img_color = img_color;
    }

    public String getColor_code() {
        return color_code;
    }

    public void setColor_code(String color_code) {
        this.color_code = color_code;
    }

    public String getBanner_img() {
        return banner_img;
    }

    public void setBanner_img(String banner_img) {
        this.banner_img = banner_img;
    }

    public String getImg_front() {
        return img_front;
    }

    public void setImg_front(String img_front) {
        this.img_front = img_front;
    }

     public String getImg_list() {
        return img_list;
    }

    public void setImg_list(String img_list) {
        this.img_list = img_list;
    }

    public float getPreOderPrice() {
        return preOderPrice;
    }

    public void setPreOderPrice(float preOderPrice) {
        this.preOderPrice = preOderPrice;
    }

    public String getContentList() {
        return contentList;
    }

    public void setContentList(String contentList) {
        this.contentList = contentList;
    }
    

    public String getCar_logo() {
        return car_logo;
    }

    public void setCar_logo(String car_logo) {
        this.car_logo = car_logo;
    }

    @Override
    public String toString() {
        return "Car{" + "id=" + id + ", name=" + name + ", brand=" + brand + ", price=" + price + ", img=" + img + ", event=" + event + ", url=" + url + ", LxWxH=" + LxWxH + ", wheelbase=" + wheelbase + ", fullload=" + fullload + ", fuel=" + fuel + ", engine=" + engine + ", time_per_100=" + time_per_100 + ", gear=" + gear + ", color=" + color + ", img_color=" + img_color + ", color_code=" + color_code + ", banner_img=" + banner_img + ", img_front=" + img_front + ", car_logo=" + car_logo + ", img_list=" + img_list + ", preOderPrice=" + preOderPrice + ", contentList=" + contentList + '}';
    }
    
   

   
   
    
}
