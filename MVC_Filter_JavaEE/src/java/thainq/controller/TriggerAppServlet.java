/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thainq.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thainq.registration.RegistrationDAO;
import thainq.registration.RegistrationDTO;
import thainq.unit.MyAppConstants;

/**
 *
 * @author PC
 */
@WebServlet(name = "TriggerAppServlet", urlPatterns = {"/TriggerAppServlet"})
public class TriggerAppServlet extends HttpServlet {

//    private final String LOGIN_PAGE = "login.html";
//    private final String SEARCH_PAGE = "search.jsp";

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
        String url = MyAppConstants.Trigger.LOGIN_PAGE;
        try {
            //Read Cookie.
            //1.check cookies ton tai  ==> get all cookies
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                //2.get last cookie
                Cookie lastCookie = cookies[cookies.length - 1];
                //3.get username and password 
                String username = lastCookie.getName();
                String password = lastCookie.getValue();
                //4.call model 
                RegistrationDAO dao = new RegistrationDAO();
                RegistrationDTO result = dao.checkLogin(username, password);

                if (result != null) {
                    url = MyAppConstants.Trigger.SEARCH_PAGE;
                    HttpSession session = request.getSession();
                    session.setAttribute("USER", result);
                }//end user is authenticated.
            }//end cookies had existed

        } catch (SQLException ex) {
//            ex.printStackTrace();
            log("CheckOutItemServlet_SQL_" + ex.getMessage());
        } catch (NamingException ex) {
//            ex.printStackTrace();
            log("CheckOutItemServlet_Naming_" + ex.getMessage());
        } finally {
            //dung cai nao cung dc ==> cookie van ton tai o client
            //response.sendRedirect(url);
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
