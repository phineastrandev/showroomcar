/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author tranp
 */
public class Comment {

    private int id;
    private String content;
    private String author;
    private Date date;
    private int id_author;

    public Comment(String content, String author, Date date, int id_author) {
        this.content = content;
        this.author = author;
        this.date = date;
        this.id_author = id_author;
    }

   

    public int getId_author() {
        return id_author;
    }

    public void setId_author(int id_author) {
        this.id_author = id_author;
    }
    

    public Comment() {
    }

    public Comment(String content, String author, Date date) {
        this.content = content;
        this.author = author;
        this.date = date;
    }

    
    public Comment(int id, String content, String author, Date date) {
        this.id = id;
        this.content = content;
        this.author = author;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Comment{" + "id=" + id + ", content=" + content + ", author=" + author + ", date=" + date + '}';
    }
    
    
}
