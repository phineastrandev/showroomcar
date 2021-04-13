/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.AccountDAO;
import Dao.BlogDAO;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Account;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author tranp
 */
public class ManageAccountActionSupport extends ActionSupport implements SessionAware {

    private ArrayList<Account> listAccount;

    private Account acc;

    public Account getAcc() {
        return acc;
    }

    public void setAcc(Account acc) {
        this.acc = acc;
    }

    public ArrayList<Account> getListAccount() {
        return listAccount;
    }

    public void setListAccount(ArrayList<Account> listAccount) {
        this.listAccount = listAccount;
    }

    public String execute() throws Exception {
        try {
            AccountDAO accDao = new AccountDAO();
            listAccount = accDao.selectAllCustomer();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return SUCCESS;
    }

    public String DeleteAccount() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id_acc"));
        AccountDAO accDao = new AccountDAO();
        if (accDao.deleteAccount(id) > 0) {
            return SUCCESS;
        }
        return "fail";
    }

    public String displayById() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id_account"));
        AccountDAO dao = new AccountDAO();
        try {
            acc = dao.getAccountyId(id);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return SUCCESS;

    }

    //==========================================================================
    private int id;
    private String name;
    private String password;
    private String phone;
    private int role;
    private String username;
    private String address;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String UpdateAccount() throws Exception {
        AccountDAO dao = new AccountDAO();
        if (dao.updateAccountAdmin(id, name, password, role, phone, address, username)>0) {
            return SUCCESS;
        }
        return ERROR;

    }

    //==========================================================================
    private SessionMap<String, Object> sessionMap;

    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        sessionMap = (SessionMap<String, Object>) map;
    }

}
