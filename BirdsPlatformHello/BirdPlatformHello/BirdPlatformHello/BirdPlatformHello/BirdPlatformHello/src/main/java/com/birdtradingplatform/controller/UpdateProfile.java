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
import com.birdtradingplatform.model.UserGoogleDto;
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
import javax.servlet.http.HttpSession;
import javax.swing.text.html.parser.Entity;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateProfile", urlPatterns = {"/UpdateProfile"})
public class UpdateProfile extends HttpServlet {

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
        try {
            HttpSession session = request.getSession(false);
            Account userDTO = (Account) session.getAttribute("dto");
           
            
            AccountDAO userDAO = new AccountDAO();
            CustomerDAO cusDAO = new CustomerDAO();

            
            int ID = userDTO.getAccountID();
            Customer cusDTO = cusDAO.getCustomerByAccountID(ID);

            String img = request.getParameter("imageInput");
            if (img == "") {
                img = userDTO.getAvatar();
            }
            

            String phone = request.getParameter("PhoneNumber");
            if (phone == "") {
                phone = cusDTO.getPhonenumber();
            }

            String name = request.getParameter("Name");
            if (name == "" ) {
                name = userDTO.getUsername();
            }
            

            String gmail = request.getParameter("Gmail");
            if (gmail == "") {
                gmail = userDTO.getEmail();
            }
            String gmail_old = userDTO.getEmail();

            if (!name.equalsIgnoreCase(userDTO.getUsername())) {
                userDAO.Update(ID, name, "username");
            } else if (!gmail.equalsIgnoreCase(gmail_old)) {
                userDAO.Update(ID, gmail, "email");
                request.setAttribute("CHANGE_GMAIL", gmail);
            } else if (!phone.equalsIgnoreCase(cusDTO.getPhonenumber())) {
                cusDAO.UpdatePhoneNumber(ID, phone);
            } else if (!img.equalsIgnoreCase(userDTO.getAvatar())) {
                userDAO.Update(ID, img, "avatar");
            } else {
                request.setAttribute("UPDATE_ERROR", true);
            }

            session.setAttribute("dto", userDTO);
            

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateProfile.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateProfile.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(UpdateProfile.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher("GetDataForUserProfile");
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
