/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Blog;
import Dao.BlogDAO;
import Dao.CarBorrowDAO;
import model.Car;
import Dao.CarDAO;
import Dao.ViewPageDAO;
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
public class HomeActionSupport extends ActionSupport implements SessionAware {

    private SessionMap<String, Object> sessionMap;

    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    public void setSessionMap(SessionMap<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }
     //----------------------------------------------------------------------
    private  ArrayList<Car_Borrow> feedBackCar;

    public ArrayList<Car_Borrow> getFeedBackCar() {
        return feedBackCar;
    }

    public void setFeedBackCar(ArrayList<Car_Borrow> feedBackCar) {
        this.feedBackCar = feedBackCar;
    }

    //-----------------Get set list car---------------------------------------
    public ArrayList<Car> cars;

    public ArrayList<Color> listColor;

    public ArrayList<Color> getListColor() {
        return listColor;
    }

    public void setListColor(ArrayList<Color> listColor) {
        this.listColor = listColor;
    }

    private Car carDetail;

    public ArrayList<Car> getCars() {
        return cars;
    }

    public void setCars(ArrayList<Car> cars) {
        this.cars = cars;
    }

    public Car getCarDetail() {
        return carDetail;
    }

    public void setCarDetail(Car carDetail) {
        this.carDetail = carDetail;
    }
    //-----------------Get Set list blog--------------------------------------

    public ArrayList<Blog> blogs; // mang chua cac blogs

    public ArrayList<Blog> getBlogs() {
        return blogs;
    }

    public void setBlogs(ArrayList<Blog> blogs) {
        this.blogs = blogs;
    }
    //----------------Get Set the most highlight blog display -----------------
    private Blog displayBlog;

    public Blog getDisplayBlog() {
        return displayBlog;
    }

    public void setDisplayBlog(Blog displayBlog) {
        this.displayBlog = displayBlog;
    }

    //-------------------------------------------------------------------------
    public HomeActionSupport() {
    }

    public String displayAllContentAtHome() throws Exception {
        CarDAO dao = new CarDAO();
        try {
            //put session and list cars
            cars = dao.view();
            ViewPageDAO vdao = new ViewPageDAO();
            ViewPage p = new ViewPage();
            p = vdao.getPageById(1);
            vdao.updateViewPage(p, 1);
            sessionMap.put("listCar", cars);
            // display blog at homepage
            BlogDAO blogDao = new BlogDAO();

            displayBlog = blogDao.SelectFirstBlog(); // display new blog/highlight blog  
            blogs = blogDao.SelectFromSecondBlog(); //display blog after highlight blog
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return SUCCESS;
    }

    public String displayCarById() {
        HttpServletRequest request = ServletActionContext.getRequest();
        int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
        CarDAO dao = new CarDAO();
        CarBorrowDAO brDao = new CarBorrowDAO();
        try {
            carDetail = dao.getCarById(id);
            listColor = dao.getColorByID(carDetail.getId());
            feedBackCar = brDao.getFeedBackByIDCar(carDetail.getId());
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
