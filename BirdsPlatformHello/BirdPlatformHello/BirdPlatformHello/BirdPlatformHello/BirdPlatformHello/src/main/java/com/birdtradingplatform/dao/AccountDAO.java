/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.dao;

import com.birdtradingplatform.model.Account;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import com.birdtradingplatform.utils.DBHelper;

/**
 *
 * @author Minh Quan
 */
public class AccountDAO {
       private List<Account> accountList;

        public List<Account> getAccountList() {
              return accountList;
              
    }
        
        
        public boolean updatePass(String pass, String gmail) throws ClassNotFoundException, SQLException{
         Connection con = null;
        PreparedStatement stm = null;
        int row  = 0;
        Account result = null;
        try {
              con = DBHelper.makeConnection();
              String sql = "UPDATE ACCOUNT SET password = ?"
                            + " WHERE email like ?";
              stm = con.prepareStatement(sql);
              stm.setString(1, pass);
              stm.setString(2, gmail);
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
        
        
        
         public boolean updateAccount(Account dto) throws ClassNotFoundException, SQLException{
         Connection con = null;
        PreparedStatement stm = null;
        int row  = 0;
        Account result = null;
        try {
              con = DBHelper.makeConnection();
              String sql = "UPDATE ACCOUNT SET username = ?, email = ?, avatar = ?"
                            + " WHERE accountID = ?";
              stm = con.prepareStatement(sql);
              stm.setString(1, dto.getUsername());
              stm.setString(2, dto.getEmail());
              stm.setString(3, dto.getAvatar());
              stm.setInt(4, dto.getAccountID());
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
    public Account getAccountByCustomerID(int id) throws ClassNotFoundException, SQLException{
         Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Account result = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM Account WHERE accountID = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                
                while (rs.next()) {    
                    int accountID = rs.getInt("accountID");
                    String username = rs.getString("username");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    int role = rs.getInt("role");
                    boolean isDeleted = rs.getBoolean("isDeleted");
                    String regisDate = rs.getString("regisDate");
                    String avatar = rs.getString("avatar");
                    
                    result = new Account(accountID, username, email, password, role, isDeleted, regisDate, avatar);
                }
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
        
    public ArrayList<Account> getUserList() throws ClassNotFoundException, SQLException{
        ArrayList<Account> userList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM Account where isDeleted = 0 order by accountID desc ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                
                while (rs.next()) {    
                    int accountID = rs.getInt("accountID");
                    String username = rs.getString("username");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    int role = rs.getInt("role");
                    boolean isDeleted = rs.getBoolean("isDeleted");
                    String regisDate = rs.getString("regisDate");
                    String avatar = rs.getString("avatar");
                    
                  Account result = new Account(accountID, username, email, password, role, isDeleted, regisDate, avatar);
                    userList.add(result);
                }
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
           return userList;
    }
    public boolean deleteUser(Account user) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        int row = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE Account "
                        + "SET isDeleted = true"
                        + "WHERE email = ?;";
                stm = con.prepareStatement(sql);
                stm.setString(1, user.getEmail());
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
    
    public boolean ReOpen(String accountID) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        int row = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE Account "
                        + "SET isDeleted = 0 "
                        + "WHERE accountID like ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, accountID);
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
    
    public Account CheckLoginbyGmail(String gmail)
            throws ClassNotFoundException, SQLException, NamingException {
        Account dto = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "select accountID, username, email, password,role,isDeleted,regisDate,avatar "
                        + "from Account "
                        + "where email like ? ";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setString(1, "%"+ gmail+"%");
                
                //4.excute stm
                rs = stm.executeQuery();
                //5.process result 
                if (rs.next()) {
                    int accountID = rs.getInt("accountID");
                    String username = rs.getString("username");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    int role = rs.getInt("role");
                    
                    boolean isDeleted = rs.getBoolean("isDeleted");
                    String regisDate = rs.getString("regisDate");
                    String avatar = rs.getString("avatar");
                    
                   dto = new Account(accountID, username, email, password, role, isDeleted, regisDate, avatar);
                }
            } else {

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
        return dto;
    }

    public Account CheckLoginbyUserName(String username, String password)
            throws ClassNotFoundException, SQLException, NamingException {
        Account dto = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "select accountID, username, email, password,Role.role,roleName,isDeleted,regisDate,avatar "
                        + "from Account,Role "
                        + "where username=? and password=? and Role.role = Account.role";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4.excute stm
                rs = stm.executeQuery();
                //5.process result 
                if (rs.next()) {
                    int accountID = rs.getInt("accountID");
                    String email = rs.getString("email");
                    int role = rs.getInt("role");
                    
                    boolean isDeleted = rs.getBoolean("isDeleted");
                    String regisDate = rs.getString("regisDate");
                    String avatar = rs.getString("avatar");
                    
                   dto = new Account(accountID, username, email, password, role, isDeleted, email, avatar);
                    System.out.print(dto.getEmail());
                }
            } else {

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
        return dto;
    }

    public Boolean SaveUser(Account dto)
            throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        Boolean result = false;
        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "insert into Account values(?,?,?, ?,?,?,?)";
                //3. create stm
                stm = con.prepareStatement(sql);
                // stm.setInt(1,1);
                stm.setString(1, dto.getUsername());
                stm.setString(2, dto.getEmail());
                stm.setString(3, dto.getPassword());
                stm.setInt(4,dto.getRole());
                stm.setBoolean(5, dto.getIsDeleted());
                stm.setString(6, dto.getRegisDate());
                stm.setString(7, dto.getAvatar());

                //4.excute stm
                int row = stm.executeUpdate();
                //5.process result 
                if (row != 0) {
                    result = true;
                }
            } else {

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

  public Boolean DeleteUser(int ID)
            throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        Boolean result = false;
        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "update  Account set isDeleted = 1 where accountID like ?";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setInt(1, ID);

                //4.excute stm
                int row = stm.executeUpdate();
                //5.process result 
                if (row > 0) {
                    result = true;
                }
            } else {

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

  public Boolean DeleteUserByGmail(String gmail)
            throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        Boolean result = false;
        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "delete from Account where email = ?";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setString(1, gmail);

                //4.excute stm
                int row = stm.executeUpdate();
                //5.process result 
                if (row != 0) {
                    result = true;
                }
            } else {

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

    public Boolean Update(int ID, String newValue, String Column)
            throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        Boolean result = false;
        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = 
                
                "update Account set "+ Column+ " = ? where accountID = ?";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setString(1, newValue);
                stm.setInt(2, ID);

                //4.excute stm
                int row = stm.executeUpdate();
                //5.process result 
                if (row != 0) {
                    result = true;
                }
            } else {

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

    public int GetIDByEmail(String gmail)
            throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int result = 0;
        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "select accountID  from Account where email = ?";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setString(1, gmail);

                //4.excute stm
                rs = stm.executeQuery();
                //5.process result 
                if (rs.next()) {
                    result = rs.getInt("accountID");
                }
            } else {

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

    public ArrayList GetPoint_PhoneNum(String gmail)
            throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        Boolean result = false;
        ResultSet rs = null;
        ArrayList returnValue = new ArrayList<>();

        try {
            //1. connect BD
            con = DBHelper.makeConnection();
            //2. write sql 
            if (con != null) {
                String sql = "select phoneNumber,point " +
                    "from Account, Customer " +
                    "where Account.accountID = Customer.accountID "
                    + "and email = ?";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setString(1, gmail);

                //4.excute stm
                rs = stm.executeQuery();
                //5.process result 
                if (rs.next()) {
                    returnValue.add(rs.getString("PhoneNumber"));
                    returnValue.add(rs.getInt("Point"));

                   
                } else {
                }
            } else {

            }

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return returnValue;
    }
    /*
    
     */
    public int updateAccountByAdmin(Account acc) throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        int result = 0;
        try {
            con = DBHelper.makeConnection();
            String sql = "UPDATE Account SET role = ? WHERE email = ?";
            
            stm = con.prepareStatement(sql);
            stm.setInt(1, acc.getRole());
            stm.setString(2, acc.getEmail());
            
            result = stm.executeUpdate();
            
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
  public Account getAccountByUsername(String name) throws ClassNotFoundException, SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stm = null;
        Account result = null;
         
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM Account WHERE username like ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + name + "%");
                rs = stm.executeQuery();
                
                if (rs.next()) {
                   int accountID = rs.getInt("accountID");
                    String username = rs.getString("username");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    int role = rs.getInt("role");
                    boolean isDeleted = rs.getBoolean("isDeleted");
                    String regisDate = rs.getString("regisDate");
                    String avatar = rs.getString("avatar");
                    result = new Account(accountID, username, email, password, role, isDeleted, regisDate, avatar);
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
 public List<Account> getListAccountByUsername(String name) throws ClassNotFoundException, SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stm = null;
        Account result = null;
        List<Account> accounts = new ArrayList<>();
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM Account WHERE username like ? and isDeleted =0";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + name + "%");
                rs = stm.executeQuery();
                
                if (rs.next()) {
                   int accountID = rs.getInt("accountID");
                    String username = rs.getString("username");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    int role = rs.getInt("role");
                    boolean isDeleted = rs.getBoolean("isDeleted");
                    String regisDate = rs.getString("regisDate");
                    String avatar = rs.getString("avatar");
                    result = new Account(accountID, username, email, password, role, isDeleted, regisDate, avatar);
                    accounts.add(result);
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
        return accounts;
    }
 
 public ArrayList<Account> getDeletedList() throws ClassNotFoundException, SQLException{
        ArrayList<Account> userList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from account left join  ReOpen on " +
"account.accountID = reOpen.accountID " +
"where  isDeleted = 1 order by account.accountID desc";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                
                while (rs.next()) {    
                    int accountID = rs.getInt("accountID");
                    String username = rs.getString("username");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    int role = rs.getInt("role");
                    boolean isDeleted = rs.getBoolean("isDeleted");
                    String regisDate = rs.getString("ReasonBlock");
                    String avatar = rs.getString("ReasonOpen");
                    
                  Account result = new Account(accountID, username, email, password, role, isDeleted, regisDate, avatar);
                    userList.add(result);
                }
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
           return userList;
    }
 
 
 public ArrayList<Account> SearchDeletedListByname(String inputUsername) throws ClassNotFoundException, SQLException{
        ArrayList<Account> userList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select * from account left join  ReOpen on " +
"account.accountID = reOpen.accountID " +
"where  isDeleted = 1  and username like ? order by account.accountID desc ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + inputUsername +"%");
                rs = stm.executeQuery();
                
                while (rs.next()) {    
                    int accountID = rs.getInt("accountID");
                    String username = rs.getString("username");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    int role = rs.getInt("role");
                    boolean isDeleted = rs.getBoolean("isDeleted");
                    String regisDate = rs.getString("ReasonBlock");
                    String avatar = rs.getString("ReasonOpen");
                    
                  Account result = new Account(accountID, username, email, password, role, isDeleted, regisDate, avatar);
                    userList.add(result);
                }
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
           return userList;
    }
 
 
 
    public static void main(String[] args) throws ClassNotFoundException, SQLException, NamingException {
        AccountDAO dao = new AccountDAO();
        Account a =  dao.CheckLoginbyGmail("quanhm642003@gmail.com");
       
    }
}
