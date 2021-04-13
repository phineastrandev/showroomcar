/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author tranp
 */
public class Blog {

    private int id;
    private String title;
    private String content;
    private Date date;
    private int author_id;
    private int viewer;
    private int like;
    private int dislike;
    private String img;
    private int category;

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public Blog() {
    }

    public Blog(String title, String content, Date date, String img) {
        this.title = title;
        this.content = content;
        this.date = date;
        this.img = img;
    }

  
    
    public Blog(String title, String content, Date date, String img, int category, int author_id) {
        this.title = title;
        this.content = content;
        this.date = date;
        this.img = img;
        this.category = category;
        this.author_id = author_id;
    }
    
    

    public Blog(int id, String title, String content, Date date, int author_id, int viewer, int like, int dislike, String img, int category) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.date = date;
        this.author_id = author_id;
        this.viewer = viewer;
        this.like = like;
        this.dislike = dislike;
        this.img = img;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return "Blog{" + "id=" + id + ", title=" + title + ", content=" + content + ", date=" + date + ", author_id=" + author_id + ", viewer=" + viewer + ", like=" + like + ", dislike=" + dislike + ", img=" + img + '}';
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }

    public int getViewer() {
        return viewer;
    }

    public void setViewer(int viewer) {
        this.viewer = viewer;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public int getDislike() {
        return dislike;
    }

    public void setDislike(int dislike) {
        this.dislike = dislike;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
