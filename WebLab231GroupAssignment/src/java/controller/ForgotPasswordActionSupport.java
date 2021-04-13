/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.AccountDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author tranp
 */
public class ForgotPasswordActionSupport extends ActionSupport {

    private String msg1;

    public String getMsg1() {
        return msg1;
    }

    public void setMsg1(String msg1) {
        this.msg1 = msg1;
    }

     
    private String email_forgot;
    private String username_forgot;

    public String getUsername_forgot() {
        return username_forgot;
    }

    public void setUsername_forgot(String username_forgot) {
        this.username_forgot = username_forgot;
    }

    public String getEmail_forgot() {
        return email_forgot;
    }

    public void setEmail_forgot(String email_forgot) {
        this.email_forgot = email_forgot;
    }

    public ForgotPasswordActionSupport() {
    }

    public String execute() throws Exception {
        AccountDAO dao = new AccountDAO();
        if (dao.checkUser(username_forgot, email_forgot)) {
            return dao.updatePasswordForgot(username_forgot, email_forgot) ? "success" : "error";
        } else{
            msg1 = "Email hoặc username không tồn tại!";
        }
        return "fail";
    }

}
