/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.birdtradingplatform.admin.controller;

import com.birdtradingplatform.dao.AccountDAO;
import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.dao.ReOpenDAO;
import com.birdtradingplatform.dao.ShopDAO;
import com.sun.org.apache.bcel.internal.generic.AALOAD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name="AdminReOpenAccount", urlPatterns={"/AdminReOpenAccount"})
public class AdminReOpenAccount extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       try{
        String  DeclineAcc = request.getParameter("DeclineAcc");
        String AccID = request.getParameter("AccID");
        
        ReOpenDAO dao = new ReOpenDAO();
        dao.DeclineAcc(AccID);
        
        if (DeclineAcc!= null){
            // Decline Suggest
            request.setAttribute("DeclineStatus", true);
        }else{
            AccountDAO account = new AccountDAO();
            account.ReOpen(AccID);
            
            Account dto = account.getAccountByCustomerID(Integer.parseInt(AccID));
            if (dto!= null){
                if (dto.getRole() == 3){
                    // This accounr ReOpen is a shop, update violation to 0 
                    
                    ShopDAO shopDAO = new ShopDAO();
                    shopDAO.ReOpenShopAcc_UpdateViolation(Integer.parseInt(AccID));
                }
            }
            
            request.setAttribute("ReOpenStatus", true);
        }
       } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminReOpenAccount.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AdminReOpenAccount.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
           RequestDispatcher rd = request.getRequestDispatcher("LoadReOpenController");
           rd.forward(request, response);
       }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
