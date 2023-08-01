/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.shop.controller;

import com.birdtradingplatform.dao.FeedbackDAO;
import com.birdtradingplatform.model.Shop;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
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
 * @author Admin
 */
@WebServlet(name = "ShopFilterFeedbackController", urlPatterns = {"/ShopFilterFeedbackController"})
public class ShopFilterFeedbackController extends HttpServlet {

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
            HttpSession session = request.getSession();
            Shop shop = (Shop) session.getAttribute("SHOPEDITPRODUCT");
            ArrayList save = new ArrayList();
            FeedbackDAO dao = new FeedbackDAO();
            String all = request.getParameter("all");
            if (all != null) {
                if(all.equalsIgnoreCase("All comment")){
                    save = dao.getAllShopFeedback(shop.getShopID());
                }else{
                    save = dao.getAllShopFeedbackNotRespone(shop.getShopID());
                }
            }
            
            String star = request.getParameter("star");
            if (star != null) {
                String number = star.substring(0, 1);
                int starFilter = Integer.parseInt(number);
                save = dao.getAllShopFeedbackFilterbyStar(shop.getShopID(), starFilter);
            
            }
           
           Map reply = dao.LoadResponse(shop.getShopID());
           System.out.println("ResLIST" +reply);
           request.setAttribute("FBLIST", save);
           int ID = 34;
           if(reply.size() <1){
               
           }else{
               // reply.get(${})
           System.out.println("ReplyLIST" + reply.get(ID));
           request.setAttribute("ReplyLIST", reply);
           }
           
        } catch (ClassNotFoundException ex) {
            log("Shop filter controller " +ex.getMessage());
        } catch (SQLException ex) {
           log("Shop filter controller " +ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher("shopFeedback.jsp");
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
