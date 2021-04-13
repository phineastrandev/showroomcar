/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.http.HttpSession;
import model.Account;
import Dao.AccountDAO;
import Dao.CarBorrowDAO;
import Dao.ViewPageDAO;
import model.Car_Borrow;
import model.ViewPage;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author tranp
 */
public class LoginActionSupport extends ActionSupport implements SessionAware {

    private String msg;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
    
    private String username;
    private String pass;
    private String name;
    private SessionMap<String, Object> sessionMap;


    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
        
    public LoginActionSupport() {
    }
    
    public String execute() throws Exception {

        HttpSession session = ServletActionContext.getRequest().getSession(true);
        AccountDAO adao = new AccountDAO();
        Account user = null;
        Car_Borrow car = new Car_Borrow();
        CarBorrowDAO carDAO = new CarBorrowDAO();
        ViewPageDAO vdao = new ViewPageDAO();
        ViewPage p = new ViewPage();
        p = vdao.getPageById(6);
        vdao.updateViewPage(p, 1);
        int result = adao.checkLogin(username, pass);
        if (result == 1) {
            user = adao.getAccount(username);
            sessionMap.put("USER", user);
            sessionMap.put("NAME", user.getName());
            return "admin";
        } else if (result ==0) {
            user = adao.getAccount(username);
            int id = user.getId();
           
            sessionMap.put("USER", user);

            return "viewer";
        } else {
            msg = "tên đăng nhập hoặc mật khẩu sai";
            return "input";
        }
    }

    @Override
    public void setSession(Map<String, Object> map) {
        sessionMap = (SessionMap<String, Object>) map;
    }

    public String logout() {
        Account a = (Account) sessionMap.get("USER");
        sessionMap.remove("USER");
        sessionMap.remove("Borrowed");
        return "LOGOUT";
    }

}
