/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thainq.cart;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.naming.NamingException;
import thainq.model.Item;
import thainq.model.ProCart;
import thainq.model.Product;
import thainq.registration.RegistrationDAO;

/**
 *
 * @author PC
 */
public class Cart implements Serializable {

    //khai bao ngan chua do
    private Map<String, ProCart> items;
    
    public Map<String, ProCart> getItems() {
        return items;
    }
    
    
    public boolean addItemToCart(String id, int quantity) {
        boolean result = false;
        String name = "";
        float price=0;
        try {
            RegistrationDAO dao = new RegistrationDAO();
            ArrayList<Product> book = dao.findAllBook();
            for (Product product : book) {
                if (product.getSku().equals(id)) {
                    name = product.getName();
                    price = product.getPrice();
                }
            }

            //1.check data validation
            if (id == null) {
                return result;
            }
            if (id.trim().isEmpty()) {
                return result;
            }
            if (quantity <= 0) {
                return result;
            }
            //2.check existed items
            if (this.items == null) {
                this.items = new HashMap<>();
            }
            //3.check existed item
            if (this.items.containsKey(id)) {
                //4.increase quantity
                int currentQuantity = this.items.get(id).getQuantity();
                quantity = quantity + currentQuantity;
            }//end item has existed
            ProCart p = new ProCart(id, name, quantity, price);
            //5.update
//        this.items.get(id).setQuantity(quantity);
            this.items.put(id, p);
            result = true;

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (NamingException ex) {
            ex.printStackTrace();
        }
        return result; 

    }

    public boolean removeItemFromCart(String id, int quantity) {
        boolean result = false;
        String name = "";
        float price = 0;
        try {
            RegistrationDAO dao = new RegistrationDAO();
            ArrayList<Product> book = dao.findAllBook();
            for (Product product : book) {
                if (product.getSku().equals(id)) {
                    name = product.getName();
                    price = product.getPrice();
                }
            }
            //1.check data validation
            if (id == null) {
                return result;
            }
            if (id.trim().isEmpty()) {
                return result;
            }
            if (quantity <= 0) {
                return result;
            }
            //2.check existed items(ngan de do)
            //check ton tai nhung lai check nguoc lai ==null de cho ngan 
            if (this.items == null) {
                return result;
            }
            //3.check existe item(sp)
            if (!this.items.containsKey(id)) {
                return result;
            }
            //4.decrease quantity
            int currentQuantity = this.items.get(id).getQuantity();

            if (currentQuantity >= quantity) {
                quantity = currentQuantity - quantity;
            }//decrease  
            //5.update
            if (quantity == 0) {
                this.items.remove(id);
                if (this.items.isEmpty()) {
                    this.items = null;
                }
            } else {
                // this.items.get(id).setQuantity(quantity);
                ProCart p = new ProCart(id, name, quantity, price);
                this.items.put(id, p);
            }

            result = true;

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (NamingException ex) {
            ex.printStackTrace();
        }
        return result;
    }
    
    public float totalMoney(){
        float total = 0;
        for (Map.Entry<String, ProCart> entry : getItems().entrySet()) {
           total+= entry.getValue().getQuantity()*entry.getValue().getPrice();
        }
        return total;
    }
    
}
