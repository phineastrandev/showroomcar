/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package configdb;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author tranp
 */
public class ConnectDB implements DatabaseInfo{
    public static Connection con = null;
    public static Connection getConnection(){
        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(connectionURL,userName,password);
            System.out.println("Connect successfully");
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("Connect failure!");
        }
        return con;
    }
}
