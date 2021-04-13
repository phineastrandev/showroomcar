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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;
import model.ViewPage;

/**
 *
 * @author tranp
 */
public class ViewPageDAO {

    public ArrayList<ViewPage> selectAll() {
        ArrayList<ViewPage> list = new ArrayList<ViewPage>();
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Page_View");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ViewPage m = new ViewPage();
                m.setId(rs.getInt("id"));
                m.setName_page(rs.getString("name_page"));
                m.setViewer(rs.getInt("viewer"));
                m.setDate(rs.getString("date_time"));
                list.add(m);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ViewPage getPageById(int id) {
        Connection con = ConnectDB.getConnection();
        ViewPage v = null;
        try {
            String sql = "Select * from Page_View where Id='" + id + "'";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                int idpage = rs.getInt(1);
                String name_page = rs.getString(2);
                int viewer = rs.getInt(3);
                String date = rs.getString(4);
                v = new ViewPage(id, viewer, name_page, date);
                System.out.println("Get ok");
                con.close();
            } else {
                System.out.println("This id does not exist");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ViewPageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return v;
    }
    public int updateViewPage(ViewPage a, int count) {
        int rc = 0;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String time = dtf.format(now);
        try {
            a.setViewer(a.getViewer() + count);
            String sql = "Update Page_view Set viewer= ?, date_time = ? WHERE id=?";
            Connection con = ConnectDB.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            a.setViewer(a.getViewer() + count);
            stmt.setInt(1, a.getViewer());
            stmt.setString(2, time);
            stmt.setInt(3, a.getId());
            rc = stmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return rc;
    }

    public static void main(String[] args) throws Exception {
        ViewPageDAO vdao = new ViewPageDAO();
        ViewPage a = vdao.getPageById(1);
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String time = dtf.format(now);
        System.out.println(time);
        vdao.updateViewPage(a, 1);
        ArrayList<ViewPage> list = vdao.selectAll();
        
        for (ViewPage viewPage : list) {
            System.out.println(viewPage.toString());
        }
    }

}
