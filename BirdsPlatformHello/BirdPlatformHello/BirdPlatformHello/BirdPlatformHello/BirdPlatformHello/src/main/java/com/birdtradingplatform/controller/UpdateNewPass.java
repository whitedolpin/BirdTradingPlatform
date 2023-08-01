/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.controller;

import com.birdtradingplatform.dao.AccountDAO;
import com.birdtradingplatform.dao.CodeDAO;
import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.utils.Utils;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateNewPass", urlPatterns = {"/UpdateNewPass"})
public class UpdateNewPass extends HttpServlet {

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
        //response.setContentType("text/html;charset=UTF-8");
        boolean err= false;
         String url = "ChangePass.jsp";
         HttpSession sesion = request.getSession();
        try{
            int code =Integer.parseInt(request.getParameter("code"));
            String mail = (String) sesion.getAttribute("EMAILHAVECODE");
            String pass = request.getParameter("Newpass");
            String confirm = request.getParameter("Confirm");
           
            
            if(mail == null){
               err= true;
               request.setAttribute("MailERR", true);
           }
             if(pass == null){
               err= true;
               request.setAttribute("PassERR", true);
           }
            
            if(confirm == null){
               err= true;
               request.setAttribute("ConfirmERR", true);
           }
            
            if(!pass.equalsIgnoreCase(confirm)){
               err= true;
               request.setAttribute("MatchERR", true);
           }
             CodeDAO dao = new CodeDAO();
                int codeDB  = dao.SelectCodeByEmail(mail);
                if (code == codeDB){
                    pass = Utils.hashString(pass);
                    AccountDAO Accdao = new AccountDAO();
                    Accdao.updatePass(pass, mail);
                    
                }else{
                    err = true;
                    request.setAttribute("CodeERR", true);
                }
            if (err==false){
                request.setAttribute("ChangePassOK", true);
                url="Login.jsp";
                dao.DeleteCodeByEmail(mail);
           }
           } catch (ClassNotFoundException ex) {
            Logger.getLogger(ChangePassController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ChangePassController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ChangePassController.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
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
