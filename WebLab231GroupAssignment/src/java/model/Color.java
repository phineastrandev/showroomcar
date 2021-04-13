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
public class Color {

    public Color(String Color, String img_color, String Color_code) {
        this.Color = Color;
        this.img_color = img_color;
        this.Color_code = Color_code;
    }

    private int id;
    private int id_car;
    private String Color;
    private String img_color;
    private String Color_code;

    @Override
    public String toString() {
        return "Color{" + "id=" + id + ", id_car=" + id_car + ", Color=" + Color + ", img_color=" + img_color + ", Color_code=" + Color_code + '}';
    }

    public Color() {
    }

    public Color(int id_car, String Color, String img_color, String Color_code) {
        this.id_car = id_car;
        this.Color = Color;
        this.img_color = img_color;
        this.Color_code = Color_code;
    }

    public Color(int id, int id_car, String Color, String img_color, String Color_code) {
        this.id = id;
        this.id_car = id_car;
        this.Color = Color;
        this.img_color = img_color;
        this.Color_code = Color_code;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_car() {
        return id_car;
    }

    public void setId_car(int id_car) {
        this.id_car = id_car;
    }

    public String getColor() {
        return Color;
    }

    public void setColor(String Color) {
        this.Color = Color;
    }

    public String getImg_color() {
        return img_color;
    }

    public void setImg_color(String img_color) {
        this.img_color = img_color;
    }

    public String getColor_code() {
        return Color_code;
    }

    public void setColor_code(String Color_code) {
        this.Color_code = Color_code;
    }

}
