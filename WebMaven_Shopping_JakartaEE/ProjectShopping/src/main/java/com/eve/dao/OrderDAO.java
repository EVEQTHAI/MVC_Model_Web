/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.eve.dao;

import com.eve.model.CartInfo;
import com.eve.model.CartModel;
import com.eve.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.Random;
import javax.naming.NamingException;

/**
 *
 * @author PC
 */
public class OrderDAO {
        public void addOrder(CartInfo cart, String cusAddress, String cusEmail, String cusName, String cusPhone)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                Map<String, CartModel> Order = cart.getCart();
                String sql = "insert into Orders(ID,Amount,Customer_Address,Customer_Email,Customer_Name,Customer_Phone,Order_Date) "
                        + "values(?,?,?,?,?,?,SYSDATETIME())";
                stm = con.prepareStatement(sql);
                stm.setString(1, generateRandomProductId());
                stm.setDouble(2, cart.totalMoney());
                stm.setString(3, cusAddress);
                stm.setString(4, cusEmail);
                stm.setString(5, cusName);
                stm.setString(6, cusPhone);

                stm.executeUpdate();

                String sqlIdOrder = "select top 1 ID from Orders "
                        + " order by Order_Date desc";
                PreparedStatement stmID = con.prepareStatement(sqlIdOrder);
                rs = stmID.executeQuery();
                if (rs.next()) {
                    String orderId = rs.getString("ID");

                    for (Map.Entry<String, CartModel> entry : Order.entrySet()) {
                        String sqlDetailOrder = "insert into Order_Details(ID,Amount,Price,Quanity,ORDER_ID,PRODUCT_ID) "
                                + " values(?,?,?,?,?,?)";
                        PreparedStatement stmDeOrder = con.prepareStatement(sqlDetailOrder);
                        stmDeOrder.setString(1, generateRandomDetailId());
                        stmDeOrder.setDouble(2,entry.getValue().getMoneyItem());
                        stmDeOrder.setDouble(3,entry.getValue().getProduct().getPrice());
                        stmDeOrder.setInt(4, entry.getValue().getQuanity());
                        stmDeOrder.setString(5,orderId);
                        stmDeOrder.setString(6, entry.getValue().getProduct().getCode());
                        
                        stmDeOrder.executeUpdate();
                    }
                    
                }

            }
        }finally{
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
    }

    public static String generateRandomProductId() {
        Random random = new Random();
        int randomNum = random.nextInt(9999) + 1000; // Generate a random three-digit number between 100 and 999

        return "P" + randomNum;
    }
        public static String generateRandomDetailId() {
        Random random = new Random();
        int randomNum = random.nextInt(9999) + 1000; // Generate a random three-digit number between 100 and 999

        return "d" + randomNum;
    }
}
