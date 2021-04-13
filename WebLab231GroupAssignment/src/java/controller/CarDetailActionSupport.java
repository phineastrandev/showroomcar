/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.BlogDAO;
import Dao.CarBorrowDAO;
import Dao.CarDAO;
import Dao.ViewPageDAO;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Blog;
import model.Car;
import model.Car_Borrow;
import model.Color;
import model.ViewPage;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author tranp
 */
public class CarDetailActionSupport extends ActionSupport implements SessionAware {

    private SessionMap<String, Object> sessionMap;

    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    private Car carDetailRedirect;

    public Car getCarDetail() {
        return carDetailRedirect;
    }

    public void setCarDetail(Car carDetail) {
        this.carDetailRedirect = carDetailRedirect;
    }

 //----------------------------------------------------------------------
 
//------------------------------------------------------------------------//
    public ArrayList<Car> listCar;

    public ArrayList<Car> getCars() {
        return listCar;
    }

    public void setCars(ArrayList<Car> listCar) {
        this.listCar = listCar;
    }

    public CarDetailActionSupport() {
    }

    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
        CarDAO dao = new CarDAO();
        try {
            carDetailRedirect = dao.getCarById(id);
            sessionMap.put("detailing", carDetailRedirect);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return SUCCESS;
    }

    public String displayListCar() throws Exception {
        CarDAO dao = new CarDAO();
        ViewPageDAO vdao = new ViewPageDAO();
        ViewPage p = new ViewPage();
        p = vdao.getPageById(4);
        vdao.updateViewPage(p, 1);
        try {
            //put session and list cars
            listCar = dao.view();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return SUCCESS;
    }

//    public String DeleteCar() throws Exception {
//        HttpServletRequest request = ServletActionContext.getRequest();
//        int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id_car"));
//        CarDAO dao = new CarDAO();
//        if (dao.deleteAccount(id) > 0) {
//            return SUCCESS;
//        }
//        return ERROR;
//    }
    @Override
    public void setSession(Map<String, Object> map) {
        sessionMap = (SessionMap<String, Object>) map;
    }

}
