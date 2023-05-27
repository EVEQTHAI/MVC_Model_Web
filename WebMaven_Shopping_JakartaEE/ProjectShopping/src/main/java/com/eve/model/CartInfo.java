/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.eve.model;

import com.eve.dao.ProductDAO;
import com.eve.dto.Product;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.naming.NamingException;

/**
 *
 * @author PC
 */
public class CartInfo implements Serializable {

    private Map<String, CartModel> cart;

    public Map<String, CartModel> getCart() {
        return cart;
    }

    private Product findPro(String code) {
        Product p = null;
        ProductDAO dao = new ProductDAO();
        try {
            ArrayList<Product> product = dao.findAllProduct();
            for (Product pro : product) {
                if (pro.getCode().equals(code)) {
                    return pro;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        }
        return p;
    }

    public boolean addItemToCart(String code, int quanity) {
        boolean result = false;

        if (code == null) {
            return result;
        }
        if (code.trim().isEmpty()) {
            return result;
        }
        if (quanity <= 0) {
            return result;
        }
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(code)) {
            int currenQuanity = this.cart.get(code).getQuanity();
            quanity = quanity + currenQuanity;
        }
        CartModel cm = new CartModel(findPro(code), quanity);
        this.cart.put(code, cm);
        result = true;
        return result;
    }

    public boolean removeItemFromCart(String code, int quanity) {
        boolean result = false;
        if (code == null) {
            return result;
        }
        if (code.trim().isEmpty()) {
            return result;
        }
        if (quanity <= 0) {
            return result;
        }
        if (this.cart == null) {
            return result;
        }
        if (!this.cart.containsKey(code)) {
            return result;
        }
        int currentQuanity = this.cart.get(code).getQuanity();
        if (currentQuanity >= quanity) {
            quanity = currentQuanity - quanity;
        }
        if (quanity == 0) {
            this.cart.remove(code);
            if (this.cart.isEmpty()) {
                this.cart = null;
            }
        } else {
            CartModel cm = new CartModel(findPro(code), quanity);
            this.cart.put(code, cm);
            result = true;
        }
        return result;
    }

    public double totalMoney() {
        double total = 0;
        for (Map.Entry<String, CartModel> entry : getCart().entrySet()) {
            total += entry.getValue().getQuanity() * entry.getValue().getProduct().getPrice();
        }
        return total;
    }

    public int quanity() {
        int quanity = 0;
        for (Map.Entry<String, CartModel> entry : getCart().entrySet()) {
            quanity += entry.getValue().getQuanity();
        }
        return quanity;
    }
    
    public static void main(String[] args) {
        CartInfo ca= new CartInfo();
        ca.addItemToCart("S001", 3);
        System.out.println(ca.cart.entrySet());
        System.out.println(ca.quanity());
    }
}
