/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.eve.dao;

import com.eve.dto.Account;
import com.eve.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author PC
 */
public class AccountDAO {

    public Account checkLogin(String username, String password)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Account result = null;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "select Active,User_Role from Accounts "
                        + " where User_Name= ? and Password = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                rs = stm.executeQuery();
            }
            if (rs.next()) {
                boolean active = rs.getBoolean("Active");
                String role = rs.getString("User_Role");
                result = new Account(username, active, password, role);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public boolean createAccout(Account acc) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            //1.connect DB
            con = DBUtil.makeConnection();
            if (con != null) {
                //2.write SQL statement
                String sql = "insert into Accounts(User_Name,Active,Password,User_Role) "
                        + " values(?,?,?,?)";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setString(1, acc.getUsername());
                stm.setBoolean(2, acc.isActive());
                stm.setString(3, acc.getPassword());
                stm.setString(4, acc.getUserRole());
                //4.execute stm obj 
                int effectrow = stm.executeUpdate();
                if (effectrow > 0) {
                    result = true;
                }
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;

    }

}
