/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thainq.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import thainq.registration.RegistrationDAO;

/**
 *
 * @author PC
 */
@WebServlet(name = "DeletServlet", urlPatterns = {"/DeletServlet"})
public class DeleteServlet extends HttpServlet {

//    private final String ERROR_PAGE = "errors.html";
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
        String urlRewriting = "";
        String username = request.getParameter("pk");
        String searchValue = request.getParameter("lastSearchValue");
        try {
            //call model
            RegistrationDAO dao = new RegistrationDAO();
            boolean result = dao.DeleteAccount(username);

            if (result) {
                //call again option by using url-rewriting
                urlRewriting = "searchAction"
                        + "?btAction=Search"
                        + "&SearchValue=" + searchValue;
            }
        } catch (SQLException ex) {
//            ex.printStackTrace();
            log("CheckOutItemServlet_SQL_" + ex.getMessage());
        } catch (NamingException ex) {
//            ex.printStackTrace();
            log("CheckOutItemServlet_Naming_" + ex.getMessage());
        } finally {
            //vi btAction trung nhau nen k biet chay cai nao truoc nen 
            //bat buoc phai dung 
            response.sendRedirect(urlRewriting);
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
