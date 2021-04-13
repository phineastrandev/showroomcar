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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import model.Account;
import model.Blog;
import model.Car;
import model.Comment;

/**
 *
 * @author tranp
 */
public class CommentDAO {

    public ArrayList<Comment> selectAll() {
        ArrayList<Comment> list = new ArrayList<Comment>();
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from FeedBack order by id desc ");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Comment m = new Comment();
                m.setId(rs.getInt("id"));
                m.setContent(rs.getString("content"));
                m.setAuthor(rs.getString("author"));
                m.setDate(rs.getDate("create_time"));
                m.setId_author(rs.getInt("id_author"));
                list.add(m);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public String getAvatar(int id){
        try {
            Connection con = ConnectDB.getConnection();
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select avatar from Account where id = " + id + "");
            while (rs.next()) {
                Account c = new Account();
                c.setAvatar(rs.getString(1));
                return c.getAvatar();
            }
            rs.close();
            stm.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean addItem(Comment m) throws Exception {
        String sql = "insert into FeedBack (content, author, create_time, id_author) values(?,?,?,?)";
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, m.getContent());
            pstmt.setString(2, m.getAuthor());
            pstmt.setDate(3, (java.sql.Date) m.getDate());
            pstmt.setInt(4,  m.getId_author());
            return pstmt.executeUpdate() > 0;
        } catch (Exception ex) {
            System.out.println("" + ex);
        }
        return false;
    }

    public static void main(String[] args) throws Exception {
        CommentDAO dao = new CommentDAO();
        Date now = new Date();
        java.sql.Date date = new java.sql.Date(now.getTime());
       // dao.addItem(new Comment("Xe này còn không ạ?", "Phi Anh", date));
         if(dao.addItem(new Comment("alo", "phi anh", date, 2)))
             System.out.println("ok");

    }

}
