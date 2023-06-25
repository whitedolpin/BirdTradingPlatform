/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.controller;

import com.birdtradingplatform.dao.FeedbackDAO;
import com.birdtradingplatform.dao.StaffDAO;
import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.FeedbackDetail;
import com.birdtradingplatform.model.Staff;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author leyen
 */
@WebServlet(name = "FeedbackController", urlPatterns = {"/feedback"})
public class FeedbackController extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
//        if ("feedbackliststaff".equals(action)) {
//             FeedbackDAO feedbackDAO = new FeedbackDAO();
//             StaffDAO staffDAO = new StaffDAO();
//            int entryNum = Integer.parseInt(request.getParameter("entryNum"));
//            int page = Integer.parseInt(request.getParameter("page"));
//            String sortCol = request.getParameter("sortCol");
//            String trend = request.getParameter("trend");
//            HttpSession session = request.getSession();
//            Account account = (Account)session.getAttribute("staff");
//            Staff staff = staffDAO.getStaff(account.getAccountID());
//            int totalFeedback = feedbackDAO.getTotalFeedbackOfShop(staff.getShopID());
//            List<FeedbackDetail> list = feedbackDAO.
//                    getFeedbackListStaff(entryNum, page, sortCol, trend, staff.getShopID());
//           request.setAttribute("listfeedbackstaffview", list);
//           request.setAttribute("page", page);
//           request.setAttribute("totalpage", totalFeedback/entryNum);
//           request.getRequestDispatcher("feedbacklist-staff.jsp")
//                   .forward(request, response);
//            
//        }
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
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackController.class.getName()).log(Level.SEVERE, null, ex);
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