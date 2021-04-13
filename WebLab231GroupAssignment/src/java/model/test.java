/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import Dao.AccountDAO;

/**
 *
 * @author tranp
 */
public class test {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        AccountDAO a = new AccountDAO();
//        a.checkLogin("phianh", "123");
//        Account acc = new Account();
//        acc = a.getAccount("conacmong5@gmail.com");
//        System.out.println(acc.toString());
//        a.checkLogin("phianh", "123");
        if(a.insert(new Account("phi anh", "user", "123", "tranphianh2008@gmail.com", 2, "", "", "",""))>0){
            System.out.println("OK");
        }
        
        
    }

}
