/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.utils.DBHelper;
import com.birdtradingplatform.model.ReOpen;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class ReOpenDAO {

    public boolean AddNewSuggest(ReOpen dto) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int row = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "insert into ReOpen values ( ? , ? , ? )";
                stm = con.prepareStatement(sql);
                stm.setInt(1, dto.getAccountID());
                stm.setString(2, dto.getBlock());
                stm.setString(3, dto.getOpen());
                row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public int GetAccoutnIDFromReOpenByGmail(String gmail) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        ResultSet rs = null;
        int row = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select AccountID from ReOpen where  AccountID = ( "
                        + "select accountID from Account where email like  ? )";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + gmail + "%");
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("AccountID");
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public boolean DeclineAcc(String accID) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int row = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Delete from  ReOpen where accountID like ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, accID);
                row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
}
