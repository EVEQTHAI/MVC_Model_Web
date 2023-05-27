/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thainq.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Map;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thainq.cart.Cart;
import thainq.model.ProCart;
import thainq.registration.RegistrationDAO;
import thainq.unit.MyAppConstants;

/**
 *
 * @author PC
 */
@WebServlet(name = "CheckOutItemServlet", urlPatterns = {"/CheckOutItemServlet"})
public class CheckOutItemServlet extends HttpServlet {

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
            throws ServletException, IOException, NullPointerException {
        response.setContentType("text/html;charset=UTF-8");

        String url = MyAppConstants.CheckOut.ERROR_PAGE;
        LocalDate date = LocalDate.now();
        String curDate = date.toString();
        try {
            //1.Customer gose to cart
            //check session ton tai 
            HttpSession session = request.getSession(false);
            if (session != null) {
                //2.Customer take a cart
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null) {
                    float total =cart.totalMoney();
                    request.setAttribute("TOTAL", total);
                    request.setAttribute("DATE", curDate);
                    RegistrationDAO dao = new RegistrationDAO();
                    dao.addOrder(cart);
                    url=MyAppConstants.CheckOut.CHECK_OUT_PAGE;
                }//end cart has exiteed
            }//session has existed
           // session.removeAttribute("CART");
        } catch (SQLException ex) {
//            ex.printStackTrace();
              log("CheckOutItemServlet_SQL_"+ex.getMessage());
        } catch (NamingException ex) {
//            ex.printStackTrace();
              log("CheckOutItemServlet_Naming_"+ex.getMessage());
        } finally {
//            response.sendRedirect(url);
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
