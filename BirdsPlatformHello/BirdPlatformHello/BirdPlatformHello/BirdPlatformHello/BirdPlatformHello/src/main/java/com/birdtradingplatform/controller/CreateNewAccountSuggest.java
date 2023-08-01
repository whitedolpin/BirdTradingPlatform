/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.birdtradingplatform.controller;

import com.birdtradingplatform.dao.AccountDAO;
import com.birdtradingplatform.model.ReOpen;
import com.birdtradingplatform.dao.ReOpenDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
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
@WebServlet(name="CreateNewAccountSuggest", urlPatterns={"/CreateNewAccountSuggest"})
public class CreateNewAccountSuggest extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String gmail = request.getParameter("UserGmail");
        String block = request.getParameter("DoUserKnow");
        String open = request.getParameter("ReaseonToReopen");
        try{
        AccountDAO accountDAO = new AccountDAO();
        int ID = accountDAO.GetIDByEmail(gmail);
        
        
       
        ReOpen  dto = new ReOpen(ID, block, open);
        ReOpenDAO dao = new ReOpenDAO();
        
         int GmailRe = dao.GetAccoutnIDFromReOpenByGmail(gmail);
         if(GmailRe == 0){
            request.setAttribute("SuggesstOK", true);
            dao.AddNewSuggest(dto);
         }else{
            request.setAttribute("SPAMCHECK", true);
         }
       
        
        
        
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateNewAccountSuggest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CreateNewAccountSuggest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CreateNewAccountSuggest.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            
            RequestDispatcher rd = request.getRequestDispatcher("Customer_Suggest_ReOpen_Account.jsp");
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
