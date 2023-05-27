/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thainq.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thainq.cart.Cart;
import thainq.unit.MyAppConstants;

/**
 *
 * @author PC
 */
@WebServlet(name = "AddItemToCart", urlPatterns = {"/AddItemToCart"})
public class AddItemToCart extends HttpServlet {



    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = MyAppConstants.Shopping.VIEW_CART;

        try {
            //1.Customer gose to cart place
            HttpSession session = request.getSession(true);
            //2.Customer take cart
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
                cart = new Cart();
            }
            //3.Customer drop item into cart
            String item = request.getParameter("txtSku");
            int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
            //khong can check parameter == null
            cart.addItemToCart(item, quantity);
            //item van nam trong tay minh ==> 
//            if(result){
//            session.setAttribute("CART", cart);
//            }
            session.setAttribute("CART", cart);
            //4.Customer contribute gose shopping --> load lai trang shopping

        } finally {
            //sesion chua huy nen dung gi cung dc
//            String urlRewriting = "DispatchServlet"
//                    + "?btAction=Link to cart";
//            response.sendRedirect(urlRewriting);
            response.sendRedirect(url);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
