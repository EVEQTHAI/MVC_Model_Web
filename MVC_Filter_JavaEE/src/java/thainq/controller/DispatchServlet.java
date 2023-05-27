/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thainq.controller;

import java.io.IOException;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
@WebServlet(name = "DispatchServlet", urlPatterns = {"/DispatchServlet"})
public class DispatchServlet extends HttpServlet {
    //private final String LOGIN_PAGE="login.html";
    //private  final String LOGIN_CONTROLLER="LoginServlet";
    //private final String SEARCH_PAGE="SearchServlet";
//    private final String DELETE_ACCOUNT_CONTROLLER="DeletServlet";
//    private final String UPDATE_ACCOUNT_CONTROLLER="UpdateServlet";
//    private final String TRIGGER_APP_CONTROLLER="TriggerAppServlet";
//    private final String LOGOUT_CONTROLLER= "LogoutServlet";
//    private final String ADD_ITEM_TO_CART="AddItemToCart";
//    private final String DELET_ITEM_FROM_CART="RemoveItemServlet";
//    private final String CHECK_OUT_ITEM="CheckOutItemServlet";
//    private final String LINK_TO_CART="LinkToCartServlet";
//    private final String CREATE_NEW_ACC="CreateNewAccountServlet";
//    
//    private final String VIEW_CART="viewCart.jsp";
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
        
        
        ServletContext context = this.getServletContext();
        Properties siteMaps =(Properties)context.getAttribute("");
        
//        String url = "";
//        //which button did user Click?
//        String button = request.getParameter("btAction");
        
        
        try  {
//           if(button==null){//khong truyen parameter = ? nen gia tri null
               //transfer to login page 
//               url=TRIGGER_APP_CONTROLLER;
//           }else if(button.equals("")){
//               url=LOGIN_CONTROLLER;
//           }else if(button.equals("Search")){
//               url=SEARCH_PAGE;
//           }else if(button.equals("Delete")){
//               url=DELETE_ACCOUNT_CONTROLLER;
//           }else if(button.equals("Update")){
//               url=UPDATE_ACCOUNT_CONTROLLER;
//           }else if(button.equals("Logout")){
//               url=LOGOUT_CONTROLLER;
//           }else if(button.equals("Add book to cart")){
//               url=ADD_ITEM_TO_CART;
//           }else if(button.equals("View your cart")){
//               url=VIEW_CART;
//           }else if(button.equals("Remove Select Item")){
//               url=DELET_ITEM_FROM_CART;
//           }else if(button.equals("CheckOut")){
//               url=CHECK_OUT_ITEM;
////           }else if(button.equals("Link to cart")){
////               url=LINK_TO_CART;
//           }else if(button.equals("Create new Account")){
//               url =CREATE_NEW_ACC;
           
                   
           
        }finally{
//            RequestDispatcher rd = request.getRequestDispatcher(url);
//            rd.forward(request, response);
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
