/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thainq.model;

import java.io.Serializable;

/**
 *
 * @author PC
 */
public class ProCart implements Serializable {

    private String Sku;
    private String name;
    private int quantity;
    private float price;

    public ProCart() {
    }

    public ProCart(String Sku, String name, int quantity, float price) {
        this.Sku = Sku;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
    }

    public String getSku() {
        return Sku;
    }

    public void setSku(String Sku) {
        this.Sku = Sku;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    
    
}
