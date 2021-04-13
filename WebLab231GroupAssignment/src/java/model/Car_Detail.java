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
public class Car_Detail {

    private  int id_car;
    private String LxWxH;
    private float wheelbase;
    private float fullload;
    private float fuel;
    
    private String engine;
    private float time_per_100;
    private String gear;

    public Car_Detail() {
    }

    public Car_Detail(int id_car, String LxWxH, float wheelbase, float fullload, float fuel, String engine, float time_per_100, String gear) {
        this.id_car = id_car;
        this.LxWxH = LxWxH;
        this.wheelbase = wheelbase;
        this.fullload = fullload;
        this.fuel = fuel;
        this.engine = engine;
        this.time_per_100 = time_per_100;
        this.gear = gear;
    }

    public int getId_car() {
        return id_car;
    }

    public void setId_car(int id_car) {
        this.id_car = id_car;
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
    
    
}
