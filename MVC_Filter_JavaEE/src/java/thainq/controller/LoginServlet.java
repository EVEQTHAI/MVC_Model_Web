/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thainq.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
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
public class LoginServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        String url = MyAppConstants.LoginFeature.INVALID_PAGE;

        String username = request.getParameter("textUsername");
        String password = request.getParameter("txtPassword");
        String remember = request.getParameter("txtRemember");
        try {
            //2.create controller. 
            //40-55 controler search view return cotroller thong qua url.
            //3.call Model 
            //3.1. new obj model
            RegistrationDAO dao = new RegistrationDAO();
            //3.2.call method from obj
            RegistrationDTO result = dao.checkLogin(username, password);
            //4.send View
            if (result != null) {
                url = MyAppConstants.LoginFeature.SEARCH_ACTION;

                //SetAttribute on login user
                HttpSession session = request.getSession();
                session.setAttribute("USER", result);
                if (remember != null) {
                    //store cookie
                    Cookie cookie = new Cookie(username, password);
                    cookie.setMaxAge(60 * 3);
                    response.addCookie(cookie);
                }

            }//end user click Login button.

        } catch (SQLException ex) {
            log("LoginServlet _SQL_" + ex.getMessage());
        } catch (NamingException ex) {
            log("LoginServlet _NAMING_" + ex.getMessage());
        } finally {
            //5.set value cho response 
            /*
            đây là trang write cookie = response obj nên cần trả response obj về 
            không nên dùng cơ chế forward để ngăn chặn response trả về nếu không
            khi trang đầu tiên gọi lên là 1 mảng chỉ có các giá trị củ trong mảng cookie 
            dẫn đến lần đầu session không thể reading cookie và wellcome 
            nhưng lần 2 thì được vì kết thúc request login ==> response có thể trả về 
            ==> add cookie thành công
             */
            response.sendRedirect(url);
//            RequestDispatcher rd =request.getRequestDispatcher(url);
//            rd.forward(request, response);
            out.close();
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
