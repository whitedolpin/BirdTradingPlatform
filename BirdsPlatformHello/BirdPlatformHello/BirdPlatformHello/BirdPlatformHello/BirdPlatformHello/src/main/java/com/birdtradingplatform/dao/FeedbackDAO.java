/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.Product;
import com.birdtradingplatform.model.Feedback;
import com.birdtradingplatform.model.FeedbackDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.birdtradingplatform.utils.DBHelper;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author leyen
 */
public class FeedbackDAO {
    public Boolean saveReply (int ID, String detail) throws ClassNotFoundException, SQLException{
        ArrayList list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        int row = 0;
        Boolean result = false;
        
        con = DBHelper.makeConnection();
        if (con != null) {
            try {
                String sql = "insert into FeedbackResponse values(?,?)";
                stm = con.prepareStatement(sql);
                stm.setInt(1, ID);
                stm.setString(2,detail);
                row = stm.executeUpdate();
                if (row >0){
                    result = true;
                }
                
            } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            } 
            }
        }
        return result;        
    }
    
    public ArrayList getShopFeedbackInBox(int shopID, String field, String value) throws ClassNotFoundException, SQLException{
        ArrayList list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Product result = null;
        
        con = DBHelper.makeConnection();
        if (con != null) {
            try {
                String sql = "select *  " +
                    "from Feedback,Product where Feedback.productID in " +
                    " (select productID from Product where shopID like ?) "
                        + " and Feedback.productID = Product.productID and "
                        + field+ " like ? " ;
                stm = con.prepareStatement(sql);
                stm.setInt(1, shopID);
                stm.setString(2,"%"+  value +"%");
                rs = stm.executeQuery();
                while (rs.next()) {                    
                    int ID = rs.getInt("feedbackID");
                    String img = rs.getString("img");
                    int star = rs.getInt("star");
                    String detail = rs.getString("detail");
                    int productID = rs.getInt("productID");
                    int accountID = rs.getInt("accID");
                    String date = rs.getString("productName");
                    Feedback save = new Feedback(productID, img, star, detail, productID, ID, date);
                    list.add(save);    
                   
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
        }
        return list;        
    }
    
    public ArrayList getAllShopFeedbackFilterbyStar(int shopID, int star) throws ClassNotFoundException, SQLException{
        ArrayList list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Product result = null;
        
        con = DBHelper.makeConnection();
        if (con != null) {
            try {
                String sql = "select *  " +
                    "from Feedback,Product where Feedback.productID in " +
                    " (select productID from Product where shopID like ? ) "
                        + " and Feedback.productID= Product.productID  and feedback.star = ?" ;
                stm = con.prepareStatement(sql);
                stm.setInt(1, shopID);
                stm.setInt(2, star);
                rs = stm.executeQuery();
                while (rs.next()) {                    
                    int ID = rs.getInt("feedbackID");
                    String img = rs.getString("img");
                    String detail = rs.getString("detail");
                    int productID = rs.getInt("productID");
                    int accountID = rs.getInt("accID");
                    String date = rs.getString("productName");
                    Feedback save = new Feedback(productID, img, star, detail, productID, ID, date);
                    list.add(save);    
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
        }
        return list;        
    }
    
    
    
    
    public ArrayList getAllShopFeedbackNotRespone(int shopID) throws ClassNotFoundException, SQLException{
        ArrayList list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Product result = null;
        
        con = DBHelper.makeConnection();
        if (con != null) {
            try {
                String sql = "select *  " +
                    "from Feedback,Product where feedbackID not in " +
                    "(select feedbackID from FeedbackResponse) " +
                    "and Feedback.productID in " +
                    " (select productID from Product where shopID like ?) "
                        + " and Feedback.productID= Product.productID " ;
                stm = con.prepareStatement(sql);
                stm.setInt(1, shopID);
                rs = stm.executeQuery();
                while (rs.next()) {                    
                    int ID = rs.getInt("feedbackID");
                    String img = rs.getString("img");
                    int star = rs.getInt("star");
                    String detail = rs.getString("detail");
                    int productID = rs.getInt("productID");
                    int accountID = rs.getInt("accID");
                    String date = rs.getString("productName");
                    Feedback save = new Feedback(productID, img, star, detail, productID, ID, date);
                    list.add(save);    
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
        }
        return list;        
    }
    
     public ArrayList getAllShopFeedback(int shopID) throws ClassNotFoundException, SQLException{
        ArrayList list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Product result = null;
        
        con = DBHelper.makeConnection();
        if (con != null) {
            try {
                String sql = "select *  " +
                    "from Feedback,Product where Feedback.productID in " +
                    " (select productID from Product where shopID like ?) "
                        + " and Feedback.productID= Product.productID " ;
                stm = con.prepareStatement(sql);
                stm.setInt(1, shopID);
                rs = stm.executeQuery();
                while (rs.next()) {                    
                    int ID = rs.getInt("feedbackID");
                    String img = rs.getString("img");
                    int star = rs.getInt("star");
                    String detail = rs.getString("detail");
                    int productID = rs.getInt("productID");
                    int accountID = rs.getInt("accID");
                    String date = rs.getString("productName");
                    Feedback save = new Feedback(ID, img, star, detail, productID, ID, date);
                    list.add(save);    
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
        }
        return list;        
    }


    public int getFeedbackCountOfShop(int shopID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select count(feedbackID) as total "
                        + "from [Feedback] left join [Product] "
                        + "on [Feedback].productID = [Product].productID "
                        + "left join [Shop] "
                        + "on [Product].shopID=[Shop].shopID "
                        + "where [Shop].shopID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, shopID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("total");
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
        return count;
    }

    public int getFeedbackCountConditon(int productID, String colCondition, String valueCondition) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select count(feedbackID) as total from [Feedback] where productID = ? and " + colCondition + " " + valueCondition;
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, productID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("total");
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
        return count;
    }

    public int getFeedbackCount(int productID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select count(feedbackID) as total from [Feedback] where productID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, productID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("total");
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
        return count;
    }

    public double getFeedbackStar(int productID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        double star = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select rating as staravg from Product where productID =  ?";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, productID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    star = rs.getDouble("staravg");
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
        return star;
    }

    public double getRatingOfShop(int shopID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        double star = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select avg(star) as rating "
                        + "from [Feedback] "
                        + "left join [Product] "
                        + "on [Feedback].productID = [Product].productID "
                        + "left join [Shop] "
                        + "on [Product].shopID=[Shop].shopID "
                        + "where [Shop].shopID = ?";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, shopID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    star = rs.getDouble("rating");
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
        return star;
    }

    public List<FeedbackDetail> getFeedbackDetailListPaging(int productID, int curPag, int limit) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<FeedbackDetail> list = new ArrayList<>();
        int offset = (curPag - 1) * limit;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from [Feedback] "
                        + " left join [Account] "
                        + " on [Feedback].accID=[Account].accountID"
                        + " where productID = ? order by publishedDate "
                        + " offset ? rows"
                        + " fetch next ? rows only";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, productID);
                pstm.setInt(2, offset);
                pstm.setInt(3, limit);
                rs = pstm.executeQuery();

                while (rs.next()) {
                    list.add(new FeedbackDetail(new Account(rs.getInt("accountID"),
                            rs.getString("username"),
                            rs.getString("email"),
                            "", 0, false, rs.getString("regisDate"),
                            rs.getString("avatar")),
                            rs.getInt("feedbackID"),
                            rs.getString("img"),
                            rs.getInt("star"),
                            rs.getString("detail"),
                            rs.getInt("productID"),
                            rs.getInt("accID"),
                            rs.getString("publishedDate")));
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
        return list;
    }

    public int createFeedback(String img, int star, String detail, String productID, int accountID, String orderDetailID) throws SQLException {
        
        Connection con = null;
        PreparedStatement pstm = null;
        int row = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "insert into [Feedback](img, star, detail, productID, accID, orderDetailID) values (?,?,?,?,?,?)";
                pstm = con.prepareStatement(sql);
                pstm.setString(1, img);
                pstm.setInt(2, star);
                pstm.setString(3, detail);
                pstm.setString(4, productID);
                pstm.setInt(5, accountID);
                pstm.setString(6, orderDetailID);
                row = pstm.executeUpdate();
            }
        } catch (Exception e) {
        } finally {

            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return row;
    }

    public boolean hasFeedbacked(int accountID, int productID, int orderDetailID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from [Feedback] where orderDetailID= ? and ([productID] = ? and [accID] = ?)";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, orderDetailID);
                pstm.setInt(2, productID);
                pstm.setInt(3, accountID);
               rs = pstm.executeQuery();
                if(rs.next()){
                    check = true;
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
        return check;
    }

    public Map LoadResponse(int shopID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Map check = new HashMap();
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select feedback.feedbackID, FeedbackResponse.detail"
                        + " from Feedback, FeedbackResponse "
                        + "where feedback.productID in ( "
                        + "select productID from Product where ShopID like ? )"
                        + "and Feedback.feedbackID = FeedbackResponse.feedbackID ";
                pstm = con.prepareStatement(sql);
                pstm.setInt(1, shopID);
               rs = pstm.executeQuery();
                while (rs.next()){
                    check.put(rs.getInt("feedbackID"), rs.getString("detail"));
                }
            }
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
        return check;
    }
    
}
