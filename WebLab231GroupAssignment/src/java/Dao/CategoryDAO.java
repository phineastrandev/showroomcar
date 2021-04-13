/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import configdb.ConnectDB;
import java.sql.Connection; 

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.Category;

import model.Category;

/**
 *
 * @author ASUS
 */
public class CategoryDAO {

    public ArrayList<Category> getAll() {
        ArrayList<Category> list = new ArrayList<>();

        try {
//            con = db.getInstance().openConnection();
            Connection con = ConnectDB.getConnection();
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from Category");
            while (rs.next()) {
                Category cat = new Category();
                cat.setId(rs.getInt(1));
                cat.setName(rs.getString(2));
                list.add(cat);
            }
            rs.close();
            stm.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }
    public String getCateByID(int id) {
        ArrayList<Category> list = new ArrayList<>();
        try {
            Connection con = ConnectDB.getConnection();
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from Category where cateid = "+id+"");
            while (rs.next()) {
                Category cat = new Category();
                cat.setId(rs.getInt(1));
                cat.setName(rs.getString(2));
                return cat.getName();
            }
            rs.close();
            stm.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        ArrayList<Category> list = dao.getAll();
        for(Category cat : list ){
            System.out.println(cat.toString());
        }
        String c = dao.getCateByID(1);
        System.out.println(c);
    }
}
