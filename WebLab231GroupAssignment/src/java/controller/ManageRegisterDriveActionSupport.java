/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.CarBorrowDAO;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import model.Car_Borrow;
import model.SendEmail;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author tranp
 */
public class ManageRegisterDriveActionSupport extends ActionSupport {

    private ArrayList<Car_Borrow> list;

    public ArrayList<Car_Borrow> getList() {
        return list;
    }

    public void setList(ArrayList<Car_Borrow> list) {
        this.list = list;
    }

    public ManageRegisterDriveActionSupport() {
    }

    public String execute() throws Exception {
        try {
            CarBorrowDAO dao = new CarBorrowDAO();
            list = dao.SelectAll();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return SUCCESS;
    }

    public String returnedCar() throws Exception {
        try {
            CarBorrowDAO dao = new CarBorrowDAO();
            list = dao.SelectReturnedCar();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return SUCCESS;
    }

    public String UpdateRegisterTest() throws Exception {
        CarBorrowDAO dao = new CarBorrowDAO();
        HttpServletRequest request = ServletActionContext.getRequest();
        int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id_register"));
        if (dao.updateRegister(id) > 0) {
            return SUCCESS;
        }
        return ERROR;

    }

    public String DeleteCarBorrow() throws Exception {
        CarBorrowDAO dao = new CarBorrowDAO();
        HttpServletRequest request = ServletActionContext.getRequest();
        int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id_register"));
        Car_Borrow car = dao.SelectEmailByID(id);
        String email = car.getEmail();
        SendEmail s = new SendEmail();
        if (dao.delete(id) > 0) {
            s.sendContact(email, "Đã xác nhận hủy yêu cầu mượn xe - Thông tin đến bạn");
            return SUCCESS;
        }
        return ERROR;
    }

}
