/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.Shop;
import com.birdtradingplatform.model.ShopAddress;
import com.birdtradingplatform.utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Minh Quan
 */
public class ShopDAO {

    public Shop getShopInforByShopID(Account shops) throws ClassNotFoundException, SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stm = null;
        Shop result = null;
        try {
            con = DBHelper.makeConnection();
            String sql = "SELECT [shopID],[shopName],[rate],[contact],[accountID],[addressID]"
                    + "FROM [BirdPlatform].[dbo].[Shop] WHERE accountID = ?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, shops.getAccountID());
            rs = stm.executeQuery();

            while (rs.next()) {
                int shopId = rs.getInt("shopID");
                String shopName = rs.getString("shopName");
                double rate = rs.getDouble("rate");
                int accountID = rs.getInt("accountID");
                int addressID = rs.getInt("addressID");

                result = new Shop(shopId, shopName, rate, null, accountID, addressID);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public Shop getShop(String shopID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Shop shop = null;
        
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from Shop "
                        + "left join Account "
                        + "on [Shop].accountID = [Account].accountID "
                        + "where shopID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setString(1, shopID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    shop = new Shop(rs.getInt("shopID"), rs.getString("shopName"), rs.getDouble("rate"), rs.getString("contact"), rs.getInt("accountID"), rs.getInt("addressID"));
                }
                
                
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return shop;
    }

    public ShopAddress getShopAddress(int addressID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ShopAddress address = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from Address where addressID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, addressID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    address = new ShopAddress(rs.getInt("addressID"), rs.getString("detail"), rs.getString("district"), rs.getString("province"));
                    
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return address;
    }
    public Account getShopAccount(int shopID) throws SQLException{
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Account account = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from Account left join Shop on Account.accountID = Shop.accountID where shopID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, shopID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    account = new Account(rs.getInt("accountID"), rs.getString("username"), rs.getString("email"), "", 0, false, rs.getString("regisDate"), rs.getString("avatar"));
                    
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return account;
    }
 
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        AccountDAO accountDAO = new AccountDAO();
        Account acc1 = accountDAO.getAccountByUsername("bird");
        ShopDAO shopDAO = new ShopDAO();
        Shop s = shopDAO.getShopInforByShopID(acc1);
        System.out.println(s);
    }
}
