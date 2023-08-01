/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.shop.controller;

import com.birdtradingplatform.dao.OrderDAO;
import com.birdtradingplatform.dao.ProductDAO;
import com.birdtradingplatform.model.Order;
import com.birdtradingplatform.model.Role;
import com.birdtradingplatform.utils.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Minh Quan
 */
@WebServlet(name = "shopSaveOrderController", urlPatterns = {"/shopSaveOrderController"})
public class shopSaveOrderController extends HttpServlet {

    private final String UPDATED_PAGE = "shopOrdersController";

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String url = UPDATED_PAGE;
        int row = 0;
         System.out.println("Shop save order controller" );
        try {
           String orderID = request.getParameter("orderID");
           int ID = Integer.parseInt(orderID);
           String status = request.getParameter("status");
           
            System.out.println("status" + status);
           
           if(status.equalsIgnoreCase("Confirmed")){
               ProductDAO productDAO = new ProductDAO();
               productDAO.GetDetailIDbyOrderID(ID);
               List<Role> changeQuantity = productDAO.GetDetailIDbyOrderID(ID);
              for(Role object : changeQuantity){
                  Boolean test =productDAO.ChangeQuantity_confirm(object);
                  
              }
               
               
              
           }
           
            
           OrderDAO orderDAO = new OrderDAO();
           Order dto_default = orderDAO.getOrderHistory(Integer.parseInt(orderID));
            int old = Utils.Status(dto_default.getStatus());
           
           Order dto = new Order(Integer.parseInt(orderID), null, 0, 0, null, status);
           int newStatus = Utils.Status(status);
           if(old ==4 || old ==3){
               
           }
           else if(newStatus >old){
               row = orderDAO.updateOrder(dto);
           }else{
               
           }
           
           
        
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(shopSaveOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(shopSaveOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
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