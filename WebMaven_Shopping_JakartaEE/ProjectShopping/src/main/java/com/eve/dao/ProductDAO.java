/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.eve.dao;

import com.eve.dto.Product;
import com.eve.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;

/**
 *
 * @author PC
 */
public class ProductDAO {
    public ArrayList<Product> findAllProduct()
            throws SQLException, NamingException {
        ArrayList<Product> product = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = " select * from Products ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    product.add(new Product(rs.getString(1), rs.getDate(2), rs.getString(3), rs.getString(4), rs.getDouble(5)));
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
        return product;
    }

    public Product findOneProduct(String code)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Product product=null;
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "select * from Products "
                        + " where Code = ? ";
                
                stm = con.prepareStatement(sql);
                stm.setString(1, code);      
                rs = stm.executeQuery();
            }
            if(rs.next()){
               product = (Product) new Product(code, rs.getDate(2), rs.getString(3), rs.getString(4), rs.getDouble(5));
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
        return product;
    }
    
//    public static void main(String[] args) throws SQLException,NamingException{
//        ProductDAO dao = new ProductDAO();
//        System.out.println("Hello");
//        System.out.println("san pham S100: " + dao.findOneProduct("S001"));
//  }
}
