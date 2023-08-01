/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.controller;


import com.birdtradingplatform.dao.AccountDAO;
import com.birdtradingplatform.dao.CustomerDAO;
import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.Customer;
import com.birdtradingplatform.utils.Utils;
import java.io.IOException;
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
@WebServlet(name = "SignUP", urlPatterns = {"/SignUP"})
public class SignUP extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "SignUpErr.jsp";
        Boolean err = false;
        System.out.println("sing up controkker");
        try  {
           String userName = request.getParameter("name");
           String email = request.getParameter("email");
           String pass = request.getParameter("pass");
           String confirm = request.getParameter("re_pass");
           String role = request.getParameter("roleRegist");
           String phone = request.getParameter("phoneNumber");
           int roleSave = 1;
           
           if(userName== null){
               err= true;
               request.setAttribute("NameERR", true);
           }
           
           if(email== null){
               err= true;
               request.setAttribute("EmailERR", true);
           }
           
           if(pass== null){
               err= true;
               request.setAttribute("PassERR", true);
           }
       
           if(confirm== null){
               err= true;
               request.setAttribute("ConfirmERR", true);
           }
           
           if(!pass.equalsIgnoreCase(confirm)){
               err= true;
               request.setAttribute("MatchERR", true);
           }
           
            AccountDAO dao = new AccountDAO();
            Account checkEmail = dao.CheckLoginbyGmail(email);
           
           
           if(checkEmail != null){
               err= true;
               request.setAttribute("DuplicatedERR", true);
           }
           if(role!=null){
               roleSave=3;
               System.out.println("Sign up an Shop account");
           }
           int ID =0;
           
           if (err==false){
               
               pass = Utils.hashString(pass);
               Account save = new Account (1, userName, email, pass, roleSave, false,"",
                       "https://i.pinimg.com/564x/2f/e6/a5/2fe6a575ad7b7baabf6dd536b1496a50.jpg");
               
               
               
               dao.SaveUser(save);
               
                ID = dao.GetIDByEmail(email);
               
              
               
               url = "Login.jsp";
           }
           
           if(roleSave ==3 && err == false){
               request.setAttribute("GMAIL", email);
               url= "ShopInfo.jsp";
           } else{
                CustomerDAO cusDAO = new CustomerDAO();
                Customer cus = new Customer(ID, phone, 0, ID);
                cusDAO.Insert_new_into_Customer(cus);
           }
           
           
        } finally{
            request.setAttribute("ERR", err);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SignUP.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SignUP.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(SignUP.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SignUP.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SignUP.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(SignUP.class.getName()).log(Level.SEVERE, null, ex);
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
