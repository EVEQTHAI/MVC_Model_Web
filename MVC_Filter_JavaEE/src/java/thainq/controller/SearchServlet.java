/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thainq.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
@WebServlet(name = "SearchServlet", urlPatterns = {"/SearchServlet"})
public class SearchServlet extends HttpServlet {

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
        response.setHeader("Cache-Control", "no-cache, no-store");
//        ServletContext context = request.getServletContext();
//        Properties siteMap = (Properties) context.getAttribute("SITE_MAP");
//        String url = (String)siteMap.get(MyAppConstants.SearchAccountFeatures.SEARCH_PAGE);
//        
        String url = MyAppConstants.SearchAccountFeatures.SEARCH_PAGE;
        try {

//            Cookie[] cookies = request.getCookies();
//            if (cookies != null) {
//                for (Cookie cookie : cookies) {
//                    if (cookie.getName().equals("password")) {
//                        String password = cookie.getValue();
//                        // Use the password to log the user in automatically
//                        // ...
//                        break;
//                    }
//                }
//            }

            HttpSession session = request.getSession(false);
            if (session != null) {
                if (session.getAttribute("USER") != null) {
                    String searchValue = request.getParameter("SearchValue");
                    //! 7 trieu
                    if (!searchValue.trim().isEmpty()) {
                        //4.call DAO
                        //4.1 new DAO
                        RegistrationDAO dao = new RegistrationDAO();
                        //4.2 call
                        dao.searchLastname(searchValue);
                        //4.3 store result to Scope(if any)
                        List<RegistrationDTO> result = dao.getAccoutList();
                        request.setAttribute("SEARCH_RESULT", result);

                    }//end search Value has valid value
                } else {
                    url = MyAppConstants.LogoutFeature.LOGIN_PAGE;
                }
            }

        } catch (SQLException ex) {
            log("SearchServlet  _SQL_ " + ex.getMessage());
        } catch (NamingException ex) {
            log("SearchServlet  Naming " + ex.getMessage());
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
