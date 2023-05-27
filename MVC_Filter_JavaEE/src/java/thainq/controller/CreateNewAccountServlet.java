/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thainq.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import thainq.registration.RegistrationCreateError;
import thainq.registration.RegistrationDAO;
import thainq.registration.RegistrationDTO;
import thainq.unit.MyAppConstants;

/**
 *
 * @author PC
 */
@WebServlet(name = "CreateNewAccountServlet", urlPatterns = {"/CreateNewAccountServlet"})
public class CreateNewAccountServlet extends HttpServlet {



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
        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String confirm = request.getParameter("txtConfirm");
        String fullname = request.getParameter("txtFullname");

        boolean foundError = false;
        
                ServletContext context = this.getServletContext();
        Properties siteMaps =(Properties)context.getAttribute("SITE_MAP");
        
        RegistrationCreateError errors = new RegistrationCreateError();
        String url = siteMaps.getProperty(MyAppConstants.CreateNewAcc.ERROR_PAGE);
//          String url ="createNewAcc.jsp";

        try {
            //1.check all user Error
            if (username.trim().length() < 6
                    || username.trim().length() > 20) {
                foundError = true;
                errors.setUsernameLengthError("Username is required input from 6 to 20 characters");
            }
            if (password.trim().length() < 6
                    || password.trim().length() > 30) {
                foundError = true;
                errors.setPasswordLengthError("Password is required input from 6 to 30 characters");
            } else if (!confirm.trim().equals(password.trim())) {
                foundError = true;
                errors.setConfirmNotMatched("Password not macthed!!!");
            }
            if (fullname.trim().length() < 6
                    || fullname.trim().length() > 30) {
                foundError = true;
                errors.setFullnameLengthError("fullname is required input from 6 to 30 characters");
            }
            //2.process
            //2.1 if errors occur,system dipslay errors and log errors
            //2.2 otherwise, call Model -DAO
            if (foundError) {
                request.setAttribute("CREATE_ERROR",errors);
            } else {//no error
                RegistrationDAO dao = new RegistrationDAO();
                RegistrationDTO dto = new RegistrationDTO(username, password, fullname, false);
                boolean result = dao.createAccount(dto);
                if (result) {
                    url = MyAppConstants.CreateNewAcc.LOGIN_PAGE;
                }//create is succesfull
            }
        } catch (SQLException ex) {
            String msg = ex.getMessage();
            log("CreateNewAccountServlet_SQL_ " + msg);
            if (msg.contains("duplicate")) {
                errors.setUsernameIsExisted(username + "is existed");
                request.setAttribute("CREATE_ERROR", errors);
            }
        } catch (NamingException ex) {
            log("CreateNewAccountServlet_Naming_ " + ex.getMessage());
        } finally {
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
