/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.ViewPageDAO;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import model.ViewPage;

/**
 *
 * @author tranp
 */
public class PageViewerActionSupport extends ActionSupport {

    private ArrayList<ViewPage> list;

    public ArrayList<ViewPage> getList() {
        return list;
    }

    public void setList(ArrayList<ViewPage> list) {
        this.list = list;
    }

    public PageViewerActionSupport() {
    }

    public String execute() throws Exception {
        try {
            ViewPageDAO vdao = new ViewPageDAO();
            list = vdao.selectAll();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return SUCCESS;
    }

}
