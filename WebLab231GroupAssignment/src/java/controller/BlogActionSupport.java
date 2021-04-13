/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.BlogDAO;
import Dao.CarDAO;
import Dao.ViewPageDAO;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import model.Blog;
import java.util.Date;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.ViewPage;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author tranp
 */
public class BlogActionSupport extends ActionSupport implements SessionAware {

    private String msg;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
    
    private SessionMap<String, Object> sessionMap;

    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }
    private int id;
    private String title_modify;
    private String content_modify;
    private int author_id_modify;
    private String img_modify;
    private int category;

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle_modify() {
        return title_modify;
    }

    public void setTitle_modify(String title_modify) {
        this.title_modify = title_modify;
    }

    public String getContent_modify() {
        return content_modify;
    }

    public void setContent_modify(String content_modify) {
        this.content_modify = content_modify;
    }

    public int getAuthor_id_modify() {
        return author_id_modify;
    }

    public void setAuthor_id_modify(int author_id_modify) {
        this.author_id_modify = author_id_modify;
    }

    public String getImg_modify() {
        return img_modify;
    }

    public void setImg_modify(String img_modify) {
        this.img_modify = img_modify;
    }

    public void setSessionMap(SessionMap<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }

    public ArrayList<Blog> listBlog; 
    // mang chua cac blogs

    public ArrayList<Blog> getBlogs() {
        return listBlog;
    }

    public void setBlogs(ArrayList<Blog> listBlog) {
        this.listBlog = listBlog;
    }

    public BlogActionSupport() {
        
    }

    // display all blog at news page
    public String execute() throws Exception {
        try {
            ViewPageDAO vdao = new ViewPageDAO();
            ViewPage p = new ViewPage();
            p = vdao.getPageById(3);
            vdao.updateViewPage(p, 1);
            BlogDAO blogDao = new BlogDAO();
            listBlog = blogDao.selectAll();// lay tat ca blog ra listblog
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return SUCCESS;
    }

    //--------------------Add blog action support-----------------
    private String title;
    private String content;
    private String image_url;
    private int id_author;
    private int category_modify;

    public int getCategory_modify() {
        return category_modify;
    }

    public void setCategory_modify(int category_modify) {
        this.category_modify = category_modify;
    }

    
    public int getId_author() {
        return id_author;
    }

    public void setId_author(int id_author) {
        this.id_author = id_author;
    }
    

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String addBlog() throws Exception {
        BlogDAO dao = new BlogDAO();
        Date now = new Date();
        java.sql.Date date = new java.sql.Date(now.getTime());
        Blog m = new Blog(title, content, date, image_url, category,id_author);
        if (dao.addItem(m)) {
            return "success";
        } else {
            return "fail";
        }
    }

    //---------------Display blog by id-----------------------------
    private Blog blogDetail;

    public Blog getBlogDetail() {
        return blogDetail;
    }

    public void setBlogDetail(Blog blogDetail) {
        this.blogDetail = blogDetail;
    }

    public String displayById() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id_blog"));
        BlogDAO dao = new BlogDAO();
        try {
            Blog b = dao.getBlogById(id);
            dao.updateView(b, 1);
            blogDetail = b;
            listBlog = dao.SelectFromSecondBlog();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return SUCCESS;

    }

    public String DeleteNews() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id_blog"));
        BlogDAO blogDao = new BlogDAO();
        if (blogDao.DeleteBlog(id) > 0) {
            return SUCCESS;
        }
        return ERROR;
    }
    //==========================================================================

    public String UpdateNews() throws Exception {
        BlogDAO dao = new BlogDAO();
        Date now = new Date();
        java.sql.Date date = new java.sql.Date(now.getTime());
        if (dao.updateName(id, title_modify, content_modify, date, author_id_modify, img_modify, category_modify) > 0) {
            return SUCCESS;
        }
        return ERROR;

    }

    public String getBlogByCate() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id_cate"));
        try {
            BlogDAO blogDao = new BlogDAO();
            listBlog = blogDao.selectAllByCategory(id);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return SUCCESS;
    }

    //=========================================================================
    private String title_search;

    public String getTitle_search() {
        return title_search;
    }

    public void setTitle_search(String title_search) {
        this.title_search = title_search;
    }

    public String SearchByTitle() throws Exception {
        BlogDAO dao = new BlogDAO();
        try {
            listBlog = dao.searchBlog(title_search);
            return SUCCESS;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        msg = "Không tìm thấy bài viết nào";
        return "fail";
    }

    @Override
    public void setSession(Map<String, Object> map) {
        sessionMap = (SessionMap<String, Object>) map;
    }

}
