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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;

/**
 *
 * @author tranp
 */
public class BlogDAO {

    public ArrayList<Blog> SelectFromSecondBlog() {
        ArrayList<Blog> list = new ArrayList<Blog>();
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Blog order by id desc");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setDate(rs.getDate("date"));
                blog.setAuthor_id(rs.getInt("author_id"));
                blog.setViewer(rs.getInt("viewer"));
                blog.setLike(rs.getInt("like"));
                blog.setDislike(rs.getInt("dislike"));
                blog.setImg(rs.getString("img"));
                blog.setCategory(rs.getInt("category"));
                list.add(blog);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Blog> selectAll() {
        ArrayList<Blog> list = new ArrayList<Blog>();
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Blog order by id desc");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setDate(rs.getDate("date"));
                blog.setAuthor_id(rs.getInt("author_id"));
                blog.setViewer(rs.getInt("viewer"));
                blog.setLike(rs.getInt("like"));
                blog.setDislike(rs.getInt("dislike"));
                blog.setImg(rs.getString("img"));
                blog.setCategory(rs.getInt("category"));
                list.add(blog);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Blog SelectFirstBlog() {
        Blog blog = null;
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Blog order by id desc");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int idblog = rs.getInt(1);
                String title = rs.getString(2);
                String content = rs.getString(3);
                Date date = rs.getDate(4);
                int author_id = rs.getInt(5);
                int viewer = rs.getInt(6);
                int like = rs.getInt(7);
                int dislike = rs.getInt(8);
                String img = rs.getString(9);
                int cate = rs.getInt(10);
                blog = new Blog(idblog, title, content, date, author_id, viewer, like, dislike, img, cate);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return blog;
    }
    
    public ArrayList<Blog> selectAllByCategory(int id_cate) {
        ArrayList<Blog> list = new ArrayList<Blog>();
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Blog Where category = "+ id_cate + " ");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setDate(rs.getDate("date"));
                blog.setAuthor_id(rs.getInt("author_id"));
                blog.setViewer(rs.getInt("viewer"));
                blog.setLike(rs.getInt("like"));
                blog.setDislike(rs.getInt("dislike"));
                blog.setImg(rs.getString("img"));
                blog.setCategory(rs.getInt("category"));
                list.add(blog);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }


    public Blog getBlogById(int id) {
        Connection con = ConnectDB.getConnection();
        Blog blog = null;
        try {
            String sql = "Select * from Blog where Id='" + id + "'";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                int idblog = rs.getInt(1);
                String title = rs.getString(2);
                String content = rs.getString(3);
                Date date = rs.getDate(4);
                int author_id = rs.getInt(5);
                int viewer = rs.getInt(6);
                int like = rs.getInt(7);
                int dislike = rs.getInt(8);
                String img = rs.getString(9);
                int cate = rs.getInt(10);
                blog = new Blog(id, title, content, date, author_id, viewer, like, dislike, img, cate);
                System.out.println("Get ok");
                con.close();
            } else {
                System.out.println("This id does not exist");
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blog;
    }
    
    

    public boolean addItem(Blog m) throws Exception {
        String sql = "insert into Blog (title , content, date, img, author_id, category) values(?,?,?,?,?,?)";
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, m.getTitle());
            pstmt.setString(2, m.getContent());
            pstmt.setDate(3, (java.sql.Date) m.getDate());
            pstmt.setString(4, m.getImg());
            pstmt.setInt(5,m.getAuthor_id());
            pstmt.setInt(6, m.getCategory());
            return pstmt.executeUpdate() > 0;
        } catch (Exception ex) {
            System.out.println("" + ex);
        }
        return false;
    }

    public int updateView(Blog a, int count) throws Exception {
        Connection con = ConnectDB.getConnection();
        a.setViewer(a.getViewer() + count);
        String sql = "Update Blog Set viewer = " + a.getViewer() + "where id = '" + a.getId() + "'";
        Statement st = con.createStatement();
        return st.executeUpdate(sql);
    }

    public int DeleteBlog(int id) {
        int status = 0;
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("Delete from Blog Where id = ?");
            ps.setInt(1, id);
            status = ps.executeUpdate();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }

        return status;
    }

    public int updateName(int id, String title, String content, Date date, int author_id, String img, int category) {
        int rc = 0;
        try {
            String sql = "UPDATE Blog SET title=?, content=?, date=?, author_id=?, img=?, category=? WHERE id=?";
            Connection con = ConnectDB.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setString(2, content);
            stmt.setDate(3, (java.sql.Date) date);
            stmt.setInt(4, author_id);
            stmt.setString(5, img);
            stmt.setInt(6, category);
            stmt.setInt(7, id);
            rc = stmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return rc;
    }
    
    
    public ArrayList<Blog> searchBlog(String titleSe) {
        ArrayList<Blog> list = new ArrayList<Blog>();
        try {
            Connection con = ConnectDB.getConnection();
            String sql = "Select * from Blog where title Like '%"+titleSe+"%'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setDate(rs.getDate("date"));
                blog.setAuthor_id(rs.getInt("author_id"));
                blog.setViewer(rs.getInt("viewer"));
                blog.setLike(rs.getInt("like"));
                blog.setDislike(rs.getInt("dislike"));
                blog.setImg(rs.getString("img"));
                blog.setCategory(rs.getInt("category"));
                list.add(blog);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) throws Exception {
        BlogDAO dao = new BlogDAO();
         Date now = new Date();
        java.sql.Date date = new java.sql.Date(now.getTime());
        if(dao.addItem(new Blog("hello", "test", date, "test", 3, 1))){
        System.out.println("ok");}
    }
    

}
