/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.Account;
import com.birdtradingplatform.model.Address;
import com.birdtradingplatform.model.Shop;
import com.birdtradingplatform.model.ShopAddress;
import com.birdtradingplatform.utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Minh Quan
 */
public class ShopDAO {
    public Map<Integer, Address> addressMap;

    public Map<Integer, Address> getAddressMap() {
        return addressMap;
    }
      public boolean updateShopInfor(Shop dto) throws ClassNotFoundException, SQLException{
        Connection con = null;
        int row = 0;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            String sql = "UPDATE Shop set shopName = ?, contact = ? "
                          + " WHERE shopID = ? ";
            stm = con.prepareStatement(sql);
            stm.setString(1, dto.getShopName());
            stm.setString(2, dto.getContact());
            stm.setInt(3, dto.getShopID());
            
            row = stm.executeUpdate();
            if (row > 0) {
                return true;
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
    public Shop getShopInforByShopID(Account shops) throws ClassNotFoundException, SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stm = null;
        Shop result = null;
        Address address = null;
        try {
            con = DBHelper.makeConnection();
            String sql = "SELECT S.[shopID],S.[shopName],S.[rate],S.[contact],S.[accountID],S.[addressID],S.[view] ,AD.detail, AD.district, AD.province"
                    + " FROM [BirdPlatform].[dbo].[Shop] S JOIN Address AD ON S.addressID = AD.addressID WHERE accountID = ?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, shops.getAccountID());
            rs = stm.executeQuery();

            while (rs.next()) {
                int shopId = rs.getInt("shopID");
                String shopName = rs.getString("shopName");
                double rate = rs.getDouble("rate");
                int accountID = rs.getInt("accountID");
                int addressID = rs.getInt("addressID");
                String contact = rs.getString("contact");
                String detail = rs.getString("detail");
                String district = rs.getString("district");
                String province = rs.getString("province");
                int view  = rs.getInt("view");
                result = new Shop(shopId, shopName, rate, contact, accountID, addressID, view);
                address = new Address(0 ,detail, district, province);
                if (this.addressMap == null) {
                    addressMap = new HashMap<>();
                  }
                addressMap.put(shopId, address);
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
 public List<Shop> getShopByID(String shopID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Shop shop = null;
        List<Shop> shops = new ArrayList<>();
        
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
                while (rs.next()) {
                    shop = new Shop(rs.getInt("shopID"), rs.getString("shopName"), rs.getDouble("rate"), rs.getString("contact"), rs.getInt("accountID"), rs.getInt("addressID"));
                    shops.add(shop);
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
        return shops;
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
    public Shop getShopInforByShopName(String name) throws ClassNotFoundException, SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stm = null;
        Shop result = null;
        try {
            con = DBHelper.makeConnection();
            String sql = "SELECT * "
                    + "FROM Shop, Account WHERE shopName like ? "
                    + "and Shop.accountID = account.accountID";
            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + name + "%");
            rs = stm.executeQuery();

            while (rs.next()) {
                int shopId = rs.getInt("shopID");
                String shopName = rs.getString("shopName");
                String avatar = rs.getString("avatar");//Nhi: account co avatar nen xoa avatar o table Shop, chi xoa o SQL
                double rate = rs.getDouble("rate");
                int accountID = rs.getInt("accountID");
                int addressID = rs.getInt("addressID");

                result = new Shop(shopId, shopName, rate, avatar, accountID, addressID);
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
 public int getTotalProduct(int shopID) throws ClassNotFoundException, SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBHelper.makeConnection();
            String sql = "select COUNT(productID) as num "
                    + " from Product where shopID = ? ";
            stm = con.prepareStatement(sql);
            stm.setInt(1, shopID);
            rs = stm.executeQuery();

            if (rs.next()) {
                result = rs.getInt("num");
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
  public String getShopAddressSearch(int shopID) throws ClassNotFoundException, SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stm = null;
        String result = null;
        try {
            con = DBHelper.makeConnection();
            String sql = "select province from [Address], shop "
                    + "where shop.addressID = [Address].addressID "
                    + "and shop.shopID = ? ";
            stm = con.prepareStatement(sql);
            stm.setInt(1, shopID);
            rs = stm.executeQuery();

            if (rs.next()) {
                result = rs.getString("province");
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
   public Boolean AddNewShop(Shop dto, String email) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement pstm = null;
        Boolean result = false;
        ResultSet rs = null;
        int ID = dto.getAccountID();
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select accountID from Account where email like ?";
                pstm = con.prepareStatement(sql);
                pstm.setString(1, email);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    ID = rs.getInt("accountID");
                }

                String sqlMore
                        = "insert into Shop values(?,0,?,?,?,0,0)";
                pstm = con.prepareStatement(sqlMore);
                pstm.setString(1, dto.getShopName());
                pstm.setString(2, dto.getContact());
                pstm.setInt(3, ID);
                pstm.setInt(4, dto.getAddressID());
                int row = pstm.executeUpdate();
                if (row > 0) {
                    result = true;
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
        return result;
    }
  
   
   public boolean UpdateView(int shopID) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        int row = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "update shop set [view] = [view] + 1 where shopID = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, shopID);
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
      public boolean UpdateShopViolation(int productID) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        int row = 0; 
        Boolean result = false;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "update shop set violation = violation +1 where shopID =  " +
"(select shopID from Product where productID = ?)";
                stm = con.prepareStatement(sql);
                stm.setInt(1, productID);
                row = stm.executeUpdate();
                if (row > 0) {
                    result = true;
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
      
      public boolean ReOpenShopAcc_UpdateViolation(int accountID) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        int row = 0; 
        Boolean result = false;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "update shop set violation = 0 where accountID = ? " ;
                stm = con.prepareStatement(sql);
                stm.setInt(1, accountID);
                row = stm.executeUpdate();
                if (row > 0) {
                    result = true;
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
      
      
      
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        AccountDAO accountDAO = new AccountDAO();
        Account acc1 = accountDAO.getAccountByUsername("bird");
        ShopDAO shopDAO = new ShopDAO();
        Shop s = shopDAO.getShopInforByShopID(acc1);
        Shop shop = shopDAO.getShopInforByShopID(acc1);
            Map<Integer, Address> address = shopDAO.getAddressMap();
            System.out.println(address.values());
    }
}
