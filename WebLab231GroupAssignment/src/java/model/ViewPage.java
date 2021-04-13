/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author tranp
 */
public class ViewPage {

    private int id;
    private int viewer;
    private String name_page;
    private String date;

    public ViewPage() {
    }

    public ViewPage(int id, int viewer, String name_page, String date) {
        this.id = id;
        this.viewer = viewer;
        this.name_page = name_page;
        this.date = date;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public ViewPage(int id, int viewer, String name_page) {
        this.id = id;
        this.viewer = viewer;
        this.name_page = name_page;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setViewer(int viewer) {
        this.viewer = viewer;
    }

    public void setName_page(String name_page) {
        this.name_page = name_page;
    }

    public int getId() {
        return id;
    }

    public int getViewer() {
        return viewer;
    }

    public String getName_page() {
        return name_page;
    }

    @Override
    public String toString() {
        return "ViewPage{" + "id=" + id + ", viewer=" + viewer + ", name_page=" + name_page + ", date=" + date + '}';
    }

}
