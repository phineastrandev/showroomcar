/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import model.Account;
import Dao.AccountDAO;

/**
 *
 * @author tranp
 */
public class RegisterActionSupport extends ActionSupport {

    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    private String rePass;
    private String name;
    private String email;
    private String username;
    private String pass;

    public String getRePass() {
        return rePass;
    }

    public void setRePass(String rePass) {
        this.rePass = rePass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

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

    public RegisterActionSupport() {
    }

    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        AccountDAO acc = new AccountDAO();
        Account user = null;
        if (pass.length() < 7) {
            message = "Mật khẩu phải trên 6 ký tự";
            return "fail";
        }
        if (acc.checkUser(username) == true) {
            user = acc.getAccount(username);
            message = "Tên đăng nhập của bạn đã tồn tại";
            return "fail";
        }

        if(!pass.equals(rePass)){
            message = "Mật khẩu không trùng nhau";
            return "fail";
        }
        
        if (acc.checkEmail(email)) {
            user = acc.getAccount(username);
            message = "Email của bạn đã tồn tại";
            return "fail";
        }

        if (acc.insert(new Account(name, username, pass, email, 2, "", "", "", "")) > 0) {
            message = "Đăng ký thành công";
            return SUCCESS;
        }

        return "fail";
    }

}
