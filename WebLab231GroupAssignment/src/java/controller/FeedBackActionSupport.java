/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.BlogDAO;
import Dao.CommentDAO;
import Dao.ViewPageDAO;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Blog;
import model.Comment;
import model.ViewPage;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author tranp
 */
public class FeedBackActionSupport extends ActionSupport implements SessionAware {

    private SessionMap<String, Object> sessionMap;

    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    public void setSessionMap(SessionMap<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }
    private String content;
    private String author_name;
    private int id_author;

    public int getId_author() {
        return id_author;
    }

    public void setId_author(int id_author) {
        this.id_author = id_author;
    }
    
    public String getAuthor_name() {
        return author_name;
    }

    public void setAuthor_name(String author_name) {
        this.author_name = author_name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public FeedBackActionSupport() {
    }

    public String execute() throws Exception {
        CommentDAO dao = new CommentDAO();
        Date now = new Date();
        java.sql.Date date = new java.sql.Date(now.getTime());
        Comment m = new Comment(content, author_name, date, id_author);
        if (dao.addItem(m)) {
            return "success";
        } else {
            return "fail";
        }

    }

    //--------------------------------------------------
    private ArrayList<Comment> cmList;

    public ArrayList<Comment> getCmList() {
        return cmList;
    }

    public void setCmList(ArrayList<Comment> cmList) {
        this.cmList = cmList;
    }

    public String displayComment() throws Exception {
        CommentDAO dao = new CommentDAO();
        ViewPageDAO vdao = new ViewPageDAO();
        ViewPage p = new ViewPage();
        p = vdao.getPageById(2);
        vdao.updateViewPage(p, 1);
        try {
            cmList = dao.selectAll();
            System.out.println(cmList.size());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return SUCCESS;

    }

    @Override
    public void setSession(Map<String, Object> map) {
        sessionMap = (SessionMap<String, Object>) map;
    }

}
