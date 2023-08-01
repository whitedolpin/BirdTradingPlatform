/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.birdtradingplatform.shop.controller;

import com.birdtradingplatform.controller.UpdateProduct;
import com.birdtradingplatform.dao.AccountDAO;
import com.birdtradingplatform.dao.AddressDAO;
import com.birdtradingplatform.dao.ShopDAO;
import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.Address;
import com.birdtradingplatform.model.Shop;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Minh Quan
 */
@WebServlet(name = "shopUpdateProfile", urlPatterns = {"/shopUpdateProfile"})
public class shopUpdateProfile extends HttpServlet {
    private final String PROFILE_PAGE = "shopGetDataForProfile";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        Boolean err = false;
        String url = PROFILE_PAGE;
        try {
            HttpSession session = request.getSession();
            String username = request.getParameter("txtUsername");
            String shopName = request.getParameter("txtShopName");
            String txtAddressDetail = request.getParameter("txtAddressDetail");
            String txtAddressDistrict = request.getParameter("txtAddressDistrict");
            String txtAddressProvice = request.getParameter("txtAddressProvice");
            String email = request.getParameter("txtEmail");
            String phoneNumber = request.getParameter("txtPhoneNumber");
            
            AccountDAO accountDAO = new AccountDAO();
            ShopDAO shopDAO = new ShopDAO();
            Account account = (Account) session.getAttribute("dto");
            
            Shop shop = (Shop) session.getAttribute("SHOPEDITPRODUCT");
            System.out.println("shop ne" + shop.getShopName());
            AddressDAO addressDAO = new AddressDAO();
            
            Address address = addressDAO.getAddress(shop.getAddressID());
            if (account != null && shop != null) {
                if (username != null && account.getUsername() != username) {
                    account.setUsername(username);
                }
                if (shopName != null && shopName != shop.getShopName()) {
                    shop.setShopName(shopName);
                }
                if (txtAddressDetail != null && txtAddressDistrict != null && txtAddressProvice != null) {
                    address.setDetail(txtAddressDetail);
                    address.setDistrict(txtAddressDistrict);
                    address.setProvice(txtAddressProvice);
                }
                if (email != null && email != account.getEmail()) {
                    account.setEmail(email);
                }
                if (phoneNumber != null && phoneNumber != shop.getContact()) {
                    shop.setContact(phoneNumber);
                }
                System.out.println("Account ne " + account.getEmail());
                System.out.println("shop ne " + shop.getShopName());
                System.out.println("addres ne " + address.getDetail());
                
                boolean updateAccount = accountDAO.updateAccount(account);
                boolean updateShop = shopDAO.updateShopInfor(shop);
                boolean updateAddress = addressDAO.updateAddress(address);
                
                System.out.println("Result ne " + updateAccount + updateShop + updateAddress);
                
                if (updateAccount && updateShop && updateAddress) {
                    url = "shopGetDataForProfile";
                }else{
                    log("Update profile controller can not get id");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(shopUpdateProfile.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(shopUpdateProfile.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(shopUpdateProfile.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(shopUpdateProfile.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(shopUpdateProfile.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(shopUpdateProfile.class.getName()).log(Level.SEVERE, null, ex);
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
