/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import configdb.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.RandomString;
import model.SendEmail;

/**
 *
 * @author tranp
 */
public class AccountDAO {

    public ArrayList<Account> selectAll() {
        ArrayList<Account> list = new ArrayList<Account>();
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Account");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setId(rs.getInt("ID"));
                acc.setName(rs.getString("name"));
                acc.setUsername(rs.getString("username"));
                acc.setPass(rs.getString("pass"));
                acc.setEmail(rs.getString("email"));
                acc.setRole(rs.getInt("role"));
                acc.setDescription(rs.getString("description"));
                acc.setAvatar(rs.getString("avatar"));
                acc.setAddress(rs.getString("address"));
                acc.setPhone(rs.getString("phone"));
                list.add(acc);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Account> selectAllCustomer() {
        ArrayList<Account> list = new ArrayList<Account>();
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Account where role <> 1");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setId(rs.getInt("ID"));
                acc.setName(rs.getString("name"));
                acc.setUsername(rs.getString("username"));
                acc.setPass(rs.getString("pass"));
                acc.setEmail(rs.getString("email"));
                acc.setRole(rs.getInt("role"));
                acc.setDescription(rs.getString("description"));
                acc.setAvatar(rs.getString("avatar"));
                acc.setAddress(rs.getString("address"));
                acc.setPhone(rs.getString("phone"));
                list.add(acc);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int checkLogin(String username, String password) {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Account ad = null;
        int rc = -1;
        String sql = "Select * from Account where username=? and pass=?";
        try {
            con = ConnectDB.getConnection();
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                if (rs.getInt(6) == 1) {
                    rc = 1;
                } else if (rs.getInt(6) == 2) {
                    rc = 0;
                } else {
                    rc = -1;
                }
            }
            stm.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rc;
    }

    public int insert(Account acc) {
        String sql = "Insert into Account values(?,?,?,?,?,?,?,?,?)";
        int rowsInserted = 0;
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, acc.getName());
            pstmt.setString(2, acc.getUsername());
            pstmt.setString(3, acc.getPass());
            pstmt.setString(4, acc.getEmail());
            pstmt.setInt(5, acc.getRole());
            pstmt.setString(6, acc.getDescription());
            pstmt.setString(7, acc.getAvatar());
            pstmt.setString(8, acc.getAddress());
            pstmt.setString(9, acc.getPhone());
            rowsInserted = pstmt.executeUpdate();;
            if (rowsInserted > 0) {
                System.out.println("inserted successfully!");
            }
            pstmt.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rowsInserted;
    }

    public ArrayList<Account> searchName(String name) {
        ArrayList<Account> list = new ArrayList<>();
        String sql = "Select * from Account where name LIKE '%" + name + "%'";
        try {
            Connection con = ConnectDB.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {

                String Name = rs.getString("name");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                int role = rs.getInt("role");
                String des = rs.getString("description");
                String avatar = rs.getString("avatar");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                list.add(new Account(Name, username, des, email, role, des, avatar, address, phone));
            }
            System.out.println(list);
            return list;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    //get all infor user by email
    public Account getAccount(String username) {
        Account bean = new Account();
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Account where username=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                bean.setId((rs.getInt(1)));
                bean.setName(rs.getString(2));
                bean.setUsername(rs.getString(3));
                bean.setPass(rs.getString(4));
                bean.setEmail(rs.getString(5));
                bean.setRole(rs.getInt(6));
                bean.setDescription(rs.getString(7));
                bean.setAvatar(rs.getString(8));
                bean.setAddress(rs.getString(9));
                bean.setPhone(rs.getString(10));
            }
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }

        return bean;
    }

    public Account getAccountyId(int id) {
        Account bean = new Account();
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Account where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                bean.setId((rs.getInt(1)));
                bean.setName(rs.getString(2));
                bean.setUsername(rs.getString(3));
                bean.setPass(rs.getString(4));
                bean.setEmail(rs.getString(5));
                bean.setRole(rs.getInt(6));
                bean.setDescription(rs.getString(7));
                bean.setAvatar(rs.getString(8));
                bean.setAddress(rs.getString(9));
                bean.setPhone(rs.getString(10));
            }
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }

        return bean;
    }

    public int updateName(int id, String name, String password, int role, String phone) {
        int rc = 0;
        try {
            String sql = "UPDATE Account SET name=?, pass=?, role=?, phone=? WHERE id=?";
            Connection con = ConnectDB.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, password);
            stmt.setInt(3, role);
            stmt.setString(4, phone);
            stmt.setInt(5, id);
            rc = stmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return rc;
    }

    public int UpdateAvatar(int id, String avatar) {
        int rc = 0;
        try {
            String sql = "UPDATE Account SET avatar=? WHERE id=?";
            Connection con = ConnectDB.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, avatar);
            stmt.setInt(2, id);
            rc = stmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return rc;
    }

    public int updateAccount(int id, String name, String phone, String email, String description, String password, String address) {
        int rc = 0;
        try {
            String sql = "UPDATE Account SET name=?, pass=?, email=?, phone=?, description=?, address=? WHERE id=?";
            Connection con = ConnectDB.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, password);
            stmt.setString(3, email);
            stmt.setString(4, phone);
            stmt.setString(5, description);
            stmt.setString(6, address);
            stmt.setInt(7, id);
            rc = stmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return rc;
    }
    
    public int updateAccountAdmin(int id, String name, String password, int role, String phone, String address, String username) {
        int rc = 0;
        try {
            String sql = "UPDATE Account SET name=?, pass=?, role=?, phone=?, username =?, address=? WHERE id=?";
            Connection con = ConnectDB.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, password);
            stmt.setInt(3, role);
            stmt.setString(4, phone);
            stmt.setString(5, username);
             stmt.setString(6, address);
            stmt.setInt(7, id);
            rc = stmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return rc;
    }

    //delete ac
    public int deleteAccount(int id) {
        int status = 0;
        try {
            String sql = "begin TRANSACTION;;\n"
                    + "\n"
                    + "DELETE\n"
                    + "FROM    Account \n"
                    + "WHERE   id = ?\n"
                    + "\n"
                    + "DELETE\n"
                    + "FROM    Car_Borrow\n"
                    + "WHERE   User_ID = ?\n"
                    + "\n"
                    + "COMMIT;";
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, id);
            status = ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status;
    }

    //change password
    public boolean updatePassword(String phone, String email) throws Exception {
        String sql = "UPDATE Account SET pass=? WHERE Phone=? and email=?";
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            String password = new RandomString().randomString(6);
            stmt.setString(1, password);
            stmt.setString(2, phone);
            stmt.setString(3, email);
            SendEmail s = new SendEmail();
            s.sendEmail(email, password);
            return stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean checkUser(String username, String email) {
        try {
            String sql = "SELECT * FROM Account WHERE username=? and email=?";
            Connection conn = ConnectDB.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, email);
            ResultSet rs = stmt.executeQuery();
            int count = 0;
            while (rs.next()) {
                count++;
            }
            if (count == 1) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //check ac exist or not
    public boolean checkEmail(String email) {
        try {
            String sql = "SELECT * FROM Account WHERE email=?";
            Connection con = ConnectDB.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            int count = 0;
            while (rs.next()) {
                count++;
            }
            if (count > 0) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }
    
     public boolean checkEmailUser(String email) {
        try {
            String sql = "SELECT * FROM Account WHERE email=?";
            Connection con = ConnectDB.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            int count = 0;
            while (rs.next()) {
                count++;
            }
            if (count > 1) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public boolean updatePasswordForgot(String username, String email) {
        try {
            String sql = "UPDATE Account SET pass=? WHERE username=? and email=?";
            Connection conn = ConnectDB.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            String password = new RandomString().randomString(8);
            stmt.setString(1, password);
            stmt.setString(2, username);
            stmt.setString(3, email);
            SendEmail s = new SendEmail();
            s.sendEmail(email, password);
            return stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean checkUser(String user) {
        try {
            String sql = "SELECT * FROM Account WHERE username=?";
            Connection con = ConnectDB.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, user);
            ResultSet rs = stmt.executeQuery();
            int count = 0;
            while (rs.next()) {
                count++;
            }
            if (count == 1) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public static void main(String[] args) throws Exception {
        AccountDAO dao = new AccountDAO();
        if (dao.deleteAccount(35) > 0) {
            System.out.println("ok");
        }

    }

}
