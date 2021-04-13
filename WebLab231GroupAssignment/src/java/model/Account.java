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
public class Account {

    private int id;
    private String name;
    private String username;
    private String pass;
    private String email;
    private int role;
    private String description;
    private String avatar;
    private String address;
    private String phone;

    public Account() {
    }

    public Account(int id, String name, String username, String pass, String email, int role, String description, String avatar, String address, String phone) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.pass = pass;
        this.email = email;
        this.role = role;
        this.description = description;
        this.avatar = avatar;
        this.address = address;
        this.phone = phone;
    }

    public Account(String name, String username, String pass, String email, int role, String description, String avatar, String address, String phone) {
        this.name = name;
        this.username = username;
        this.pass = pass;
        this.email = email;
        this.role = role;
        this.description = description;
        this.avatar = avatar;
        this.address = address;
        this.phone = phone;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", name=" + name + ", username=" + username + ", pass=" + pass + ", email=" + email + ", role=" + role + ", description=" + description + ", avatar=" + avatar + ", address=" + address + ", phone=" + phone + '}';
    }

  
    
    
    
}
