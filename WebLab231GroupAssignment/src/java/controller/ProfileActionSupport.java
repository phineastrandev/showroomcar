/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.AccountDAO;
import Dao.CarBorrowDAO;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Account;
import model.Car;
import model.Car_Borrow;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author tranp
 */
public class ProfileActionSupport extends ActionSupport implements SessionAware {

    private SessionMap<String, Object> sessionMap;

    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    private String mess;
    private String name;
    private String phone;
    private String email;
    private String des;
    private String address;
    private String pass;
    private String repass;
    private int id;

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    
    private Account profileUser;

    public Account getProfileUser() {
        return profileUser;
    }

    public void setProfileUser(Account profileUser) {
        this.profileUser = profileUser;
    }

    //=========================
    private String feedback;
    private int id_turn_borrow;
    private String note;

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    private Car_Borrow car;

    public Car_Borrow getCar() {
        return car;
    }

    public void setCar(Car_Borrow car) {
        this.car = car;
    }

    public int getId_turn_borrow() {
        return id_turn_borrow;
    }

    public void setId_turn_borrow(int id_turn_borrow) {
        this.id_turn_borrow = id_turn_borrow;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getRepass() {
        return repass;
    }

    public void setRepass(String repass) {
        this.repass = repass;
    }

    public ProfileActionSupport() {
    }

    public String execute() throws Exception {
        AccountDAO dao = new AccountDAO();
        if(dao.checkEmailUser(email)){
            mess = "Email này đã tồn tại!";
            return "fail";
        }
        if (dao.updateAccount(id, name, phone, email, des, pass, address) > 0) {
            mess = "Update thành công";
            return SUCCESS;
        }
        return "fail";

    }

    public String getInformation() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        int id_user = Integer.parseInt(ServletActionContext.getRequest().getParameter("id_user"));
        CarBorrowDAO carDAO = new CarBorrowDAO();
        car = carDAO.SelectByIdUser(id_user);
        AccountDAO adao = new AccountDAO();
        profileUser = adao.getAccountyId(id_user);
        sessionMap.remove("Borrowed");
        return SUCCESS;

    }

    public String AddFeedback() throws Exception {
        CarBorrowDAO dao = new CarBorrowDAO();
        if (dao.updateRegister(id_turn_borrow) > 0) {
            if (dao.addFeedback(id_turn_borrow, feedback) > 0) {
                return SUCCESS;
            }
        }
        return ERROR;

    }
    //==========================================================================

    private String avatar;
    private int id_cus;

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getId_cus() {
        return id_cus;
    }

    public void setId_cus(int id_cus) {
        this.id_cus = id_cus;
    }


    public String AddAvatar() throws Exception {
        AccountDAO adao = new AccountDAO();
        if (adao.UpdateAvatar(id_cus, avatar) > 0) {
            return SUCCESS;
        }
        return ERROR;

    }

    public String RequireCancel() throws Exception {
        CarBorrowDAO dao = new CarBorrowDAO();
        if (dao.updateNote(id_turn_borrow, note) > 0) {
            return SUCCESS;
        }
        return ERROR;

    }

    @Override
    public void setSession(Map<String, Object> map) {
        sessionMap = (SessionMap<String, Object>) map;
    }

}
