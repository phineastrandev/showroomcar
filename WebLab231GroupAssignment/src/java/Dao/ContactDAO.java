/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import configdb.ConnectDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.ContactUs;

/**
 *
 * @author tranp
 */
public class ContactDAO {

    public ArrayList<ContactUs> selectAll() {
        ArrayList<ContactUs> list = new ArrayList<ContactUs>();
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Contact");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ContactUs acc = new ContactUs();
                acc.setId(rs.getInt("ID"));
                acc.setName(rs.getString("Name"));
                acc.setAddress(rs.getString("Address"));
                acc.setEmail(rs.getString("Email"));
                acc.setPhone(rs.getString("Phone"));
                acc.setDate(rs.getDate("date"));
                list.add(acc);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public int insert(ContactUs acc) {
        String sql = "Insert into Contact (Name, Address, Email, Phone, Date) values(?,?,?,?,?)";
        int rowsInserted = 0;
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, acc.getName());
            pstmt.setString(2, acc.getAddress());
            pstmt.setString(3, acc.getEmail());
            pstmt.setString(4, acc.getPhone());
            pstmt.setDate(5, (Date) acc.getDate());
            rowsInserted = pstmt.executeUpdate();;
            if (rowsInserted > 0) {
                System.out.println("inserted successfully!");
            }
            pstmt.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ContactDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rowsInserted;
    }
   
      public static void main(String[] args) throws Exception {
        ContactDAO dao = new ContactDAO();
        ContactUs acc = new ContactUs();
        if (dao.insert(new ContactUs("Phi Anh", "", "tranphianh1518@gmail.com", "0941404225")) > 0) {
            System.out.println("ok");
        }
    }
    
}
