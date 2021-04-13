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
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Blog;
import model.Car_Borrow;

/**
 *
 * @author tranp
 */
public class CarBorrowDAO {

    public ArrayList<Car_Borrow> SelectAll() {
        ArrayList<Car_Borrow> list = new ArrayList<Car_Borrow>();
        try {
            Connection con = ConnectDB.getConnection();
            String sql = " select  br.id, br.time, br.note,\n"
                    + "br.name_customer, br.phone, br.email, c.name \n"
                    + "from _Car c \n"
                    + "Inner Join  Car_Borrow  br on c.id = br.Car_ID where br.Borrowed <> 0";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Car_Borrow c = new Car_Borrow();
                c.setId(rs.getInt("id"));
                c.setDate(rs.getString("time"));
                c.setNote(rs.getString("note"));
                c.setFullname(rs.getString("name_customer"));
                c.setPhone(rs.getString("phone"));
                c.setEmail(rs.getString("email"));
                c.setName_car(rs.getString("name"));
                list.add(c);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Car_Borrow> SelectReturnedCar() {
        ArrayList<Car_Borrow> list = new ArrayList<Car_Borrow>();
        try {
            Connection con = ConnectDB.getConnection();
            String sql = " select   br.id, br.time, br.note,\n"
                    + "br.name_customer, br.phone, br.email, c.name \n"
                    + "from _Car c \n"
                    + "Inner Join  Car_Borrow  br on c.id = br.Car_ID where br.Borrowed = 0";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Car_Borrow c = new Car_Borrow();
                c.setId(rs.getInt("id"));
                c.setDate(rs.getString("time"));
                c.setNote(rs.getString("note"));
                c.setFullname(rs.getString("name_customer"));
                c.setPhone(rs.getString("phone"));
                c.setEmail(rs.getString("email"));
                c.setName_car(rs.getString("name"));
                list.add(c);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int insert(Car_Borrow acc) {
        String sql = "Insert into  Car_Borrow (Car_ID, Borrowed, time, note, name_customer, phone, email ,User_ID)  values(?,?,?,?,?,?,?,?)";
        int rowsInserted = 0;
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, acc.getCar_id());
            pstmt.setInt(2, acc.getBorrowed());
            pstmt.setString(3, acc.getDate());
            pstmt.setString(4, acc.getNote());
            pstmt.setString(5, acc.getFullname());
            pstmt.setString(6, acc.getPhone());
            pstmt.setString(7, acc.getEmail());
            pstmt.setInt(8, acc.getUser_ID());
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

    public Car_Borrow SelectEmailByID(int id) {
        Car_Borrow c = new Car_Borrow();
        try {
            Connection con = ConnectDB.getConnection();
            String sql = "Select email from Car_Borrow where id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c.setEmail((rs.getString("email")));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return c;

    }
    

    public Car_Borrow SelectByIdUser(int id) {
        Car_Borrow c = new Car_Borrow();
        try {
            Connection con = ConnectDB.getConnection();
            String sql = " select br.id, br.time, br.note,\n"
                    + "br.name_customer, br.phone, br.email, c.name, br.Borrowed \n"
                    + "from _Car c \n"
                    + "Inner Join  Car_Borrow  br on c.id = br.Car_ID where br.User_ID = ? AND (br.Borrowed = 1 or br.Borrowed = 2)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c.setId((rs.getInt(1)));
                c.setDate(rs.getString(2));
                c.setNote(rs.getString(3));
                c.setFullname(rs.getString(4));
                c.setPhone(rs.getString(5));
                c.setEmail(rs.getString(6));
                c.setName_car(rs.getString(7));
                c.setBorrowed(rs.getInt(8));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return c;
    }

    

    public int addFeedback(int id, String feedback) {
        int rc = 0;
        try {
            String sql = "UPDATE Car_Borrow SET FeedBack=? WHERE id=?";
            Connection con = ConnectDB.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, feedback);
            stmt.setInt(2, id);
            rc = stmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return rc;
    }

    public int updateRegister(int id) {
        int rc = 0;
        try {
            String sql = "UPDATE Car_Borrow SET Borrowed= 0 where ID = ?";
            Connection con = ConnectDB.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);

            rc = stmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return rc;
    }

    public int updateNote(int id, String note) {
        int rc = 0;
        try {
            String sql = "UPDATE Car_Borrow SET Borrowed = 2, note= ? where ID = ?";
            Connection con = ConnectDB.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, note);
            stmt.setInt(2, id);

            rc = stmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return rc;
    }

    public static void main(String[] args) throws Exception {
        CarBorrowDAO dao = new CarBorrowDAO();
        ArrayList<Car_Borrow> c = dao.getFeedBackByIDCar(1);
        for (Car_Borrow car_Borrow : c) {
            System.out.println(car_Borrow.toString());
        }
    }
    
    public ArrayList<Car_Borrow> getFeedBackByIDCar(int id_car) {
        ArrayList<Car_Borrow> list = new ArrayList<Car_Borrow>();
        try {
            Connection con = ConnectDB.getConnection();
            String sql = "select Feedback, name_customer, Borrowed,  User_ID from Car_Borrow WHERE Car_ID = ? ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_car);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Car_Borrow c = new Car_Borrow();
                c.setFeedBack(rs.getString("FeedBack"));
                c.setFullname(rs.getString("name_customer"));
                c.setBorrowed(rs.getInt("Borrowed"));
                c.setUser_ID(rs.getInt("User_ID"));
                list.add(c);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int delete(int id) {
        int status = 0;
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("Delete from Car_Borrow Where id = ?");
            ps.setInt(1, id);
            status = ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status;
    }

}
