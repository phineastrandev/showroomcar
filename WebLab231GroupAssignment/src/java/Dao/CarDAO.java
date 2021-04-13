/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import configdb.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Car;
import model.Color;

/**
 *
 * @author tranp
 */
public class CarDAO {

    public ArrayList<Car> view() {
        ArrayList<Car> list = new ArrayList<Car>();
        try {
            Connection con = ConnectDB.getConnection();
            String sql = "Select c.id, c.name, c.brand, c.price, c.image, c.event, c.url, "
                    + " Car_Detail.LxWxH, Car_Detail.Wheelbase, Car_Detail.fullload, Car_Detail.fuel, "
                    + " Car_Detail.engine, Car_Detail.time_per_100, Car_Detail.gear, Car_Detail.img_list, Car_Detail.preorderprice, Car_Detail.contentList "
                    + " from _Car c "
                    + " Inner Join Car_Detail on c.id = Car_Detail.id_car";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Car c = new Car();
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String brand = rs.getString("brand");
                float price = rs.getFloat("price");
                String img = rs.getString("image");
                int event = rs.getInt("event");
                String url = rs.getString("url");
                String length = rs.getString("LxWxH");
                float wheelbase = rs.getFloat("Wheelbase");
                float fullload = rs.getFloat("fullload");
                float fuel = rs.getFloat("fuel");
                String engine = rs.getString("engine");
                float time_per_100 = rs.getFloat("time_per_100");
                String gear = rs.getString("gear");
                String img_list = rs.getString("img_list");
                float prePrice = rs.getFloat("preorderprice");
                String contentList = rs.getString("contentList");
                c = new Car(id, name, brand, price, img, event, url, length, wheelbase, fullload, fuel, engine, time_per_100, gear, img_list, prePrice, contentList);
                list.add(c);
            }
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    public Car getCarById(int cid) {
        Connection con = ConnectDB.getConnection();
        Car c = new Car();
        try {
            //String sql = "Select * from _Car where id='" + id + "'";
            String sql = "select c.id, c.name, c.brand, c.price, c.image, c.event, c.url, "
                    + "Car_Detail.LxWxH, Car_Detail.Wheelbase, Car_Detail.fullload, Car_Detail.fuel, Car_Detail.engine, Car_Detail.time_per_100, Car_Detail.gear, "
                    + "page_content_car.banner_img, page_content_car.img_front, page_content_car.car_logo "
                    + "from _Car c "
                    + "Inner Join Car_Detail on c.id = Car_Detail.id_car "
                    + "Inner join page_content_car on c.id = page_content_car.id_car where c.id='" + cid + "'";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String brand = rs.getString("brand");
                float price = rs.getFloat("price");
                String img = rs.getString("image");
                int event = rs.getInt("event");
                String url = rs.getString("url");
                String length = rs.getString("LxWxH");
                float wheelbase = rs.getFloat("Wheelbase");
                float fullload = rs.getFloat("fullload");
                float fuel = rs.getFloat("fuel");
                String engine = rs.getString("engine");
                float time_per_100 = rs.getFloat("time_per_100");
                String gear = rs.getString("gear");
                String banner_img = rs.getString("banner_img");
                String img_front = rs.getString("img_front");
                String car_logo = rs.getString("car_logo");
                c = new Car(id, name, brand, price, img, event, url, length, wheelbase, fullload, fuel, engine, time_per_100, gear, banner_img, img_front, car_logo);
                System.out.println("Get ok");
                con.close();
            } else {
                System.out.println("This id does not exist");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public String getCarByID(int id) {
        try {
            Connection con = ConnectDB.getConnection();
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from _Car where id = " + id + "");
            while (rs.next()) {
                Car c = new Car();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                return c.getName();
            }
            rs.close();
            stm.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public int getIdCar(int id) {
        try {
            Connection con = ConnectDB.getConnection();
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from Color where id = " + id + "");
            while (rs.next()) {
                Color c = new Color();
                c.setId(rs.getInt(1));
                c.setId_car(rs.getInt(2));
                return c.getId_car();
            }
            rs.close();
            stm.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public int getLastIdCar() {
        try {
            Connection con = ConnectDB.getConnection();
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from _Car order by id desc");
            while (rs.next()) {
                Car c = new Car();
                c.setId(rs.getInt(1));
                return c.getId();
            }
            rs.close();
            stm.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public ArrayList<Color> getColorByID(int cid) {
        ArrayList<Color> list = new ArrayList<Color>();
        Color c = null;
        try {
            Connection con = ConnectDB.getConnection();
            String sql = "Select ID, id_car, Color, Img_color, Color_code from Color where id_car = '" + cid + "'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int id_car = rs.getInt(2);
                String color = rs.getString(3);
                String img_color = rs.getString(4);
                String color_code = rs.getString(5);
                c = new Color(id, id_car, color, img_color, color_code);
                list.add(c);
            }
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    public int UpdateCar(int id, String name, float price, String gear, String lwh, float wheelbase, float fulload, float fuel) {
        int rc = 0;
        try {
            String sql = "BEGIN TRANSACTION;\n"
                    + "\n"
                    + "UPDATE _Car\n"
                    + "  SET _Car.name = ?, _Car.price = ? \n"
                    + "FROM _Car T1, Car_Detail T2\n"
                    + "WHERE T1.id = T2.id_car\n"
                    + "and T1.id = ?;\n"
                    + "\n"
                    + "UPDATE Car_Detail\n"
                    + "SET Car_Detail.gear = ?, Car_Detail.LxWxH=?, Car_Detail.Wheelbase=?, \n"
                    + " Car_Detail.fullload=?, Car_Detail.fuel=? \n"
                    + "FROM _Car T1, Car_Detail T2\n"
                    + "WHERE T1.id = T2.id_car\n"
                    + "and T1.id = ?;\n"
                    + "\n"
                    + "COMMIT;";
            Connection con = ConnectDB.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setFloat(2, price);
            stmt.setInt(3, id);
            stmt.setString(4, gear);
            stmt.setString(5, lwh);
            stmt.setFloat(6, wheelbase);
            stmt.setFloat(7, fulload);
            stmt.setFloat(8, fuel);
            stmt.setInt(9, id);
            rc = stmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return rc;
    }

    public int DeleteCarByID(int id) {
        int status = 0;
        try {
            String sql = "begin TRANSACTION;;\n"
                    + "\n"
                    + "DELETE\n"
                    + "FROM    _Car\n"
                    + "WHERE   id = ?\n"
                    + "\n"
                    + "DELETE\n"
                    + "FROM    Car_Detail\n"
                    + "WHERE   id_car = ?\n"
                    + "\n"
                    + "COMMIT;";
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, id);
            status = ps.executeUpdate();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }

        return status;
    }

    public int DeleteColor(int id) {
        int status = 0;
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("Delete from Color Where ID = ?");
            ps.setInt(1, id);
            status = ps.executeUpdate();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }

        return status;
    }

    public int insertColor(Color cl) {
        String sql = "Insert into Color (Color, Img_color, Color_code, id_car) values(?,?,?,?)";
        int rowsInserted = 0;
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, cl.getColor());
            pstmt.setString(2, cl.getImg_color());
            pstmt.setString(3, cl.getColor_code());
            pstmt.setInt(4, cl.getId_car());
            rowsInserted = pstmt.executeUpdate();;
            if (rowsInserted > 0) {
                System.out.println("inserted successfully!");
            }
            pstmt.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rowsInserted;
    }

    public int insertCar1(Car car) {
        String sql = "Insert into _Car(name, brand,price, image, url) values (?,?,?,?,?)";
        int rowsInserted = 0;
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, car.getName());
            pstmt.setString(2, car.getBrand());
            pstmt.setFloat(3, car.getPrice());
            pstmt.setString(4, car.getImg());
            pstmt.setString(5, car.getUrl());
            rowsInserted = pstmt.executeUpdate();;
            if (rowsInserted > 0) {
                System.out.println("inserted successfully!");
            }
            pstmt.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(CarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rowsInserted;
    }

    public int insertCar2(Car car) {
        String sql = "Insert into Car_Detail(id_car, LxWxH, Wheelbase, fullload, fuel, engine,time_per_100, gear"
                + ", img_list, preorderprice) values (?,?,?,?,?,?,?,?,?,?)";
        int rowsInserted = 0;
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, car.getId());
            pstmt.setString(2, car.getLxWxH());
            pstmt.setFloat(3, car.getWheelbase());
            pstmt.setFloat(4, car.getFullload());
            pstmt.setFloat(5, car.getFuel());
            pstmt.setString(6, car.getEngine());
            pstmt.setFloat(7, car.getTime_per_100());
            pstmt.setString(8, car.getGear());
            pstmt.setString(9, car.getImg_list());
            pstmt.setFloat(10, car.getPreOderPrice());
            rowsInserted = pstmt.executeUpdate();;
            if (rowsInserted > 0) {
                System.out.println("inserted successfully!");
            }
            pstmt.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(CarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rowsInserted;
    }

    public static void main(String[] args) throws Exception {
        CarDAO dao = new CarDAO();
        ArrayList<Car> ls = dao.view();
        if(dao.insertCar2(new Car(31, "1x2x3", 15, 15, 15, "CVT", 0, "CVT", "https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwfd31fe7f/images/President/CE16.png", 444444))>0){
            System.out.println("ok");
        }
    }
    
}
