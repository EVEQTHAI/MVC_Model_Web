/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thainq.registration;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.naming.NamingException;
import thainq.cart.Cart;
import thainq.model.Item;
import thainq.model.ProCart;
import thainq.model.Product;
import thainq.unit.DBhelper;

/**
 *
 * @author PC
 */
public class RegistrationDAO implements Serializable {

//    public boolean checkLogin(String username, String password)
//            throws SQLException, NamingException {    
    public RegistrationDTO checkLogin(String username, String password)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        RegistrationDTO result = null;
        try {
            //1.connect DB
            con = DBhelper.makeConnection();
            if (con != null) {//check con tontai
                //2.write SQL
                String sql = "Select lastname, isAdmin "
                        + "From Account "
                        + "where username = ? and password = ?";
                //3.create statement obj
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4.Execute Stratement obj to get result.
                rs = stm.executeQuery();//29-40 chieu tu database
            }//5.process result--> set.
            if (rs.next()) {
                String fullName = rs.getString("lastname");
                boolean role = rs.getBoolean("isAdmin");

                result = new RegistrationDTO(username, null, fullName, role);
            }
            // note : khoi tao gia tri null va ket thuc can dong no lai.
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
        return result;//42-57 chieu tu database len model.ngoai tru finally: goi la setValue.
    }
    private List<RegistrationDTO> accoutList;

    public List<RegistrationDTO> getAccoutList() {
        return accoutList;
    }

    public void searchLastname(String keyword)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            //1.connect DB
            con = DBhelper.makeConnection();
            if (con != null) {//check con tontai
                //2.write SQL
                String sql = "Select username, password, lastname, isAdmin "
                        + "From Account "
                        + "where lastname Like ?";
                //3.create statement obj
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + keyword + "%");
                //4.Execute Stratement obj to get result.
                rs = stm.executeQuery();//29-40 chieu tu database
            }//5.process result--> set.
            while (rs.next()) {
                String usename = rs.getString("username");
                String password = rs.getString("password");
                String fulltname = rs.getString("lastname");
                boolean rule = rs.getBoolean("isAdmin");
                RegistrationDTO dto = new RegistrationDTO(usename, password, fulltname, rule);
                if (this.accoutList == null) {
                    this.accoutList = new ArrayList<>();
                }
                this.accoutList.add(dto);

            }
            // note : khoi tao gia tri null va ket thuc can dong no lai.
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
    }

    public boolean DeleteAccount(String pk)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            //1.connect DB
            con = DBhelper.makeConnection();
            //check con tontai
            //2.write SQL
            if (con != null) {
                String sql = "Delete "
                        + "From Account "
                        + "where username = ?";
                //3.create statement obj
                stm = con.prepareStatement(sql);
                stm.setString(1, pk);
                //4.Execute Stratement obj to get result.
                int effectrow = stm.executeUpdate();
                //5.process result--> set.
                if (effectrow > 0) {
                    result = true;
                }
            }
            // note : khoi tao gia tri null va ket thuc can dong no lai.
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public boolean UpdateAccount(String password, boolean isAdmin, String username)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            //1.connect DB
            con = DBhelper.makeConnection();
            //check con tontai
            //2.write SQL
            if (con != null) {
                String sql = "Update Account "
                        + "Set password = ? , "
                        + "isAdmin = ? "
                        + "Where username = ?";
                //3.create statement obj
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setBoolean(2, isAdmin);
                stm.setString(3, username);

                //4.Execute Stratement obj to get result.
                int effectrow = stm.executeUpdate();
                //5.process result--> set.
                if (effectrow > 0) {
                    result = true;
                }
            }
            // note : khoi tao gia tri null va ket thuc can dong no lai.
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;

    }

    public ArrayList<Product> findAllBook()
            throws SQLException, NamingException {
        ArrayList<Product> book = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1.conection DB
            con = DBhelper.makeConnection();
            if (con != null) {
                //2.write SQL statement
                String sql = "select sku,name,price,quantity,status from Product";
                //3.create obj stm
                stm = con.prepareStatement(sql);
                //4.resultset
                rs = stm.executeQuery();
                while (rs.next()) {
                    book.add(new Product(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getInt(4), rs.getBoolean(5)));
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
        return book;
    }

    public Product findABook(String id)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Product product = null;

        try {
            //1.conection DB
            con = DBhelper.makeConnection();
            if (con != null) {
                //2.write SQL statement
                String sql = "select sku,name,price,quantity,status from Product "
                        + "Where sku = ?";
                //3.create obj stm
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                //4.resultset
                rs = stm.executeQuery();
                if (rs.next()) {
                    String sku = rs.getString(1);
                    String name = rs.getString(2);
                    float price = rs.getFloat(3);
                    boolean status = rs.getBoolean(5);

                    product = (Product) new Product(sku, name, price, 0, status);

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
        //chưa biết cái Prodct có lưu dữ liệu hay k sợ nó đè lên data
        return product;
    }

    public void addOrder(Cart cart) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            //1.connect DB
            con = DBhelper.makeConnection();
            if (con != null) {
                //2.write SQL statement
                Map<String, ProCart> myMap = cart.getItems();
                String sql = "insert into [Order](date,total)"
                        + "values(?,?)";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setString(1, date);
                stm.setFloat(2, cart.totalMoney());

                stm.executeUpdate();

                //lay ID vua add vao
                String sqlID = "select top 1 id from [Order] "
                        + "order by id desc";
                PreparedStatement stm1 = con.prepareStatement(sqlID);
                rs = stm1.executeQuery();
                if (rs.next()) {
                    int orderId = rs.getInt("id");
//                    for (Item i : cart.getItemCart()) {
//                        String sqlAdd = "insert into orderDetail(skuDetail,orderID,price,quantity) "
//                                + "values(?,?,?,?)";
//                        PreparedStatement stm2 = con.prepareStatement(sqlAdd);
//                        stm2.setString(1, i.getProduct().getSku());
//                        stm2.setInt(2, orderId);
//                        stm2.setFloat(3, i.getProduct().getPrice());
//                        stm2.setInt(4, i.getProduct().getQuantity());
//                        stm2.executeUpdate();
//                    }

                    for (Map.Entry<String, ProCart> entry : myMap.entrySet()) {
                        String sqlAdd = "insert into orderDetail(skuDetail,orderID,price,quantity) "
                                + "values(?,?,?,?)";
                        PreparedStatement stm2 = con.prepareStatement(sqlAdd);
                        stm2.setString(1, entry.getValue().getSku());
                        stm2.setInt(2, orderId);
                        stm2.setFloat(3, entry.getValue().getPrice());
                        stm2.setInt(4, entry.getValue().getQuantity());
                        stm2.executeUpdate();

                    }
                    // update quantity in table Prodcut
                    String sqlUpdate = "Update Product set "
                            + "quantity = quantity - ? "
                            + "where sku = ?";
                    PreparedStatement stm3 = con.prepareStatement(sqlUpdate);
//                for (Item i : cart.getItemCart()) {
//                    stm3.setInt(1, i.getProduct().getQuantity());
//                    stm3.setString(2, i.getProduct().getSku());
//                    stm3.executeUpdate();
//                }
                    for (Map.Entry<String, ProCart> entry : myMap.entrySet()) {
                        stm3.setInt(1, entry.getValue().getQuantity());
                        stm3.setString(2, entry.getValue().getSku());
                        stm3.executeUpdate();
                    }

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
    }

    public boolean createAccount(RegistrationDTO dto)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            //1.connect DB
            con = DBhelper.makeConnection();
            if (con != null) {
                //2.write SQL statement
                String sql = "insert into Account("
                        + "username,password,lastname,isAdmin)"
                        + "values (?,?,?,?)";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setString(1, dto.getUsername());
                stm.setString(2, dto.getPassword());
                stm.setString(3, dto.getFullname());
                stm.setBoolean(4, dto.isRole());
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
