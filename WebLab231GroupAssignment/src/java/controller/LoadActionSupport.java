/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.ViewPageDAO;
import com.opensymphony.xwork2.ActionSupport;
import model.ViewPage;

/**
 *
 * @author tranp
 */
public class LoadActionSupport extends ActionSupport {
    
    public LoadActionSupport() {
    }
    
    public String execute() throws Exception {
        ViewPageDAO vdao = new ViewPageDAO();
            ViewPage p = new ViewPage();
            p = vdao.getPageById(5);
            vdao.updateViewPage(p, 1);
        return SUCCESS;
    }
    
}
