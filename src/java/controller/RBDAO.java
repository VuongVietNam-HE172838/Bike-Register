/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.RBBikes;
import models.RBUsers;

/**
 *
 * @author thant
 */
public class RBDAO extends DBContext{
    Connection cnn;//Ket noi DB
    PreparedStatement stm;// Thuc hien cac cau lenh sql
    ResultSet rs;//Luu tru va xu ly du lieu duoc lay tu db

    public RBDAO() {
        connect();
    }

    private void connect() {
        try {
            {
                cnn = connection;
                if (cnn != null) {
                    System.out.println("Connect sucess");
                } else {
                    System.out.println("Connect fail");
                }
            }
        } catch (Exception e) {
            System.out.println("Connect error :" + e.getMessage());
        }
    }

    
    
    //check Login method
    public String checkLogin(String userlogin, String password) {
        try {
            String strSQL = null;
            
                strSQL = "SELECT * FROM Users WHERE account = ? AND password = ?";
            PreparedStatement pstm = connection.prepareStatement(strSQL);
            pstm.setString(1, userlogin);
            pstm.setString(2, password);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                // Đăng nhập thành công
                return "Login successful!";
            } else {
                // Kiểm tra xem tên người dùng có tồn tại hay không
                    strSQL = "SELECT * FROM Users WHERE account = ?";
                pstm = connection.prepareStatement(strSQL);
                pstm.setString(1, userlogin);
                ResultSet userRs = pstm.executeQuery();

                if (userRs.next()) {
                    // Tên người dùng tồn tại, vì vậy mật khẩu không chính xác
                    System.out.println("pass issue");
                    return "Sai mật khẩu!";
                } else {
                    // Tên người dùng không tồn tại
                    System.out.println("acc issue");

                    return "Sai mã đăng nhập!";
                }
            }
        } catch (Exception e) {
            System.out.println("checkLogin: " + e.getMessage());
            return "An error occurred during login.";
        }
    }

    public RBUsers getUsers1(String userlogin, String password) {
        try {
            String strSQL = null;
                strSQL = "SELECT * FROM Users WHERE account = ? AND password = ?";
            PreparedStatement pstm = connection.prepareStatement(strSQL);
            pstm.setString(1, userlogin);
            pstm.setString(2, password);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                // Đăng nhập thành công
                RBUsers u = new RBUsers();
                u.setId(rs.getString(1));
                u.setAccount(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setEmail(rs.getString(4));
                u.setCccd(rs.getString(5));
                u.setName(rs.getString(6));
                u.setPhone(rs.getString(7));
                u.setDob(String.valueOf(rs.getDate(8)));
                u.setAddress(rs.getString(9));
                u.setImgFront(rs.getString(10));
                u.setImgBack(rs.getString(11));
                u.setVerify(rs.getString(12));
                u.setRole(rs.getString(13));
                return u;
            }
        } catch (Exception e) {
            System.out.println("getUsers1: " + e.getMessage());

        }
        return null;
    }

    void addBike(RBBikes b) {
        try {
            String strSql="insert into Bikes values (?,?,?,?,?,?,?,?)";
            stm=cnn.prepareStatement(strSql);
            stm.setString(1, b.getBrand());
            stm.setString(2, b.getName());
            stm.setString(3, b.getSokhung());
            stm.setString(4, b.getSomay());
//            stm.setDate(5, Date.valueOf(users.dob));
            stm.setString(5, b.getUid());
            stm.setDate(6, Date.valueOf(b.getNgaydk()));
            stm.setString(7, b.getPlate());
            stm.setBoolean(8, Boolean.parseBoolean(b.getVerify()));
            stm.execute();
            
        } catch (Exception e) {
            System.out.println("addBike: "+e.getMessage());
        }
    }

    ArrayList<RBBikes> getUserReg(String id) {
        ArrayList<RBBikes> data = new ArrayList<>();
        try {
            String strSql="select * from Bikes where uid=?";
            stm=cnn.prepareStatement(strSql);
            stm.setString(1, id);
            rs=stm.executeQuery();
            while (rs.next()) {       
                String brand = rs.getString(2);
                String name = rs.getString(3);
                String sokhung = rs.getString(4);
                String somay = rs.getString(5);
                String uid = rs.getString(6);
                String ngaydk = String.valueOf(rs.getDate(7));
                String plate = rs.getString(8);
                String verify = rs.getString(9);
                
                
                RBBikes b = new RBBikes(brand, name, sokhung, somay, uid, ngaydk, plate, verify);
                data.add(b);
            }
        } catch (Exception e) {
            System.out.println("getUserReg"+e.getMessage());
        }
        return data;
    }

    ArrayList<RBBikes> getAllUserReg() {
        ArrayList<RBBikes> data = new ArrayList<>();
        try {
            String strSql="select * from Bikes b, Users u "
                    + "where b.uid = u.id";
            stm=cnn.prepareStatement(strSql);
            rs=stm.executeQuery();
            while (rs.next()) {       
                String brand = rs.getString(2);
                String name = rs.getString(3);
                String sokhung = rs.getString(4);
                String somay = rs.getString(5);
                String uid = rs.getString(15);
                String ngaydk = String.valueOf(rs.getDate(7));
                String plate = rs.getString(8);
                String verify = rs.getString(9);
                
                
                RBBikes b = new RBBikes(brand, name, sokhung, somay, uid, ngaydk, plate, verify);
                data.add(b);
            }
        } catch (Exception e) {
            System.out.println("getAllUserReg"+e.getMessage());
        }
        return data;
    }

    ArrayList<RBUsers> getAllUserR() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    RBBikes getBikeBySokhung(String sokhung) {
        try {
            String strSql="select * from Bikes where sokhung=?";
            stm=cnn.prepareStatement(strSql);
            stm.setString(1, sokhung);
            rs=stm.executeQuery();
            while (rs.next()) {       
                String brand = rs.getString(2);
                String name = rs.getString(3);
                String sokhung1 = rs.getString(4);
                String somay = rs.getString(5);
                String uid = rs.getString(6);
                String ngaydk = String.valueOf(rs.getDate(7));
                String plate = rs.getString(8);
                String verify = rs.getString(9);
                
                
                RBBikes b = new RBBikes(brand, name, sokhung, somay, uid, ngaydk, plate, verify);
                return b;
            }
        } catch (Exception e) {
            System.out.println("getBikeBySokhung"+e.getMessage());
        }
        return null;
    }

    RBUsers getUserByUid(String uid) {
        try {
            String strSQL = null;
                strSQL = "SELECT * FROM Users WHERE id=?";
            PreparedStatement pstm = connection.prepareStatement(strSQL);
            pstm.setString(1, uid);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                RBUsers u = new RBUsers();
                u.setId(rs.getString(1));
                u.setAccount(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setEmail(rs.getString(4));
                u.setCccd(rs.getString(5));
                u.setName(rs.getString(6));
                u.setPhone(rs.getString(7));
                u.setDob(String.valueOf(rs.getDate(8)));
                u.setAddress(rs.getString(9));
                u.setImgFront(rs.getString(10));
                u.setImgBack(rs.getString(11));
                u.setVerify(rs.getString(12));
                u.setRole(rs.getString(13));
                return u;
            }
        } catch (Exception e) {
            System.out.println("getUserByUid: " + e.getMessage());

        }
        return null;
    }

   void updateStatus(String verify, String sokhung) {
        try {
            String strSql="update Bikes set verify=? where sokhung=?";
            stm=cnn.prepareStatement(strSql);
            stm.setBoolean(1, Boolean.parseBoolean(verify));
            stm.setString(2, sokhung);
            
            stm.execute();
            
        } catch (Exception e) {
            System.out.println("updateStatus: "+e.getMessage());
        }
    }
   
   void updateStatusAprove(String verify, String sokhung) {
        try {
            String strSql="update Bikes set verify=? where sokhung=?";
            stm=cnn.prepareStatement(strSql);
            stm.setBoolean(1, true);
            stm.setString(2, sokhung);
            
            stm.execute();
            
        } catch (Exception e) {
            System.out.println("updateStatus: "+e.getMessage());
        }
    }

    void addUser(RBUsers u) {
        try {
            System.out.println("addUser: "+u.getAccount());
            String strSql="insert into Users (account, password, email, cccd, name, phone, dob, address, imgFront, imgBack, verify, role) values (?,?,?,?,?,?,?,?,?,?,?,?)";
            stm=cnn.prepareStatement(strSql);
            stm.setString(1, u.getAccount());
            stm.setString(2, u.getPassword());
            stm.setString(3, u.getEmail());
            stm.setString(4, u.getCccd());
            stm.setString(5, u.getName());
            stm.setString(6, u.getPhone());
            stm.setDate(7, Date.valueOf(u.getDob()));
            stm.setString(8, u.getAddress());
            stm.setString(9, "");
            stm.setString(10, "");
            stm.setBoolean(11, Boolean.parseBoolean(u.getVerify()));
            stm.setString(12, u.getRole());
            stm.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("addUser: "+e.getMessage());
        }
    }

    boolean checkSokhung(String sokhung) {
        try {
            System.out.println("sokhung:" + sokhung);
            String strSql="select * from Bikes where sokhung=?";
            stm=cnn.prepareStatement(strSql);
            stm.setString(1, sokhung);
            rs=stm.executeQuery();
            while (rs.next()) {       
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkSokhung"+e.getMessage());
        }
        return false;
    }

    boolean checkSomay(String somay) {
        try {
            System.out.println("somay:" + somay);
            String strSql="select * from Bikes where somay=?";
            stm=cnn.prepareStatement(strSql);
            stm.setString(1, somay);
            rs=stm.executeQuery();
            while (rs.next()) {       
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkSomay"+e.getMessage());
        }
        return false;
    }

    boolean checkEmailExist(String email) {
        try {
            System.out.println("email:" + email);
            String strSql="select * from Users where email=?";
            stm=cnn.prepareStatement(strSql);
            stm.setString(1, email);
            rs=stm.executeQuery();
            while (rs.next()) {       
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkEmailExist"+e.getMessage());
        }
        return false;
    }

    boolean checkIdenExist(String iden) {
        try {
            System.out.println("email:" + iden);
            String strSql="select * from Users where cccd=?";
            stm=cnn.prepareStatement(strSql);
            stm.setString(1, iden);
            rs=stm.executeQuery();
            while (rs.next()) {       
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkIdenExist"+e.getMessage());
        }
        return false;
    }
}
