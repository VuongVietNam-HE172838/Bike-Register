/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author thant
 */
public class RBUsers {
    String id, account, password, email, cccd, name, phone, dob, address,
            imgFront, imgBack, verify, role;

    public RBUsers() {
    }

    public RBUsers(String id, String account, String password, String email, String cccd, String name, String phone, String dob, String address, String imgFront, String imgBack, String verify, String role) {
        this.id = id;
        this.account = account;
        this.password = password;
        this.email = email;
        this.cccd = cccd;
        this.name = name;
        this.phone = phone;
        this.dob = dob;
        this.address = address;
        this.imgFront = imgFront;
        this.imgBack = imgBack;
        this.verify = verify;
        this.role = role;
    }

    public String getId() {
        return id;
    }

    public String getAccount() {
        return account;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getCccd() {
        return cccd;
    }

    public String getName() {
        return name;
    }

    public String getPhone() {
        return phone;
    }

    public String getDob() {
        return dob;
    }

    public String getAddress() {
        return address;
    }

    public String getImgFront() {
        return imgFront;
    }

    public String getImgBack() {
        return imgBack;
    }

    public String getVerify() {
        return verify;
    }

    public String getRole() {
        return role;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setCccd(String cccd) {
        this.cccd = cccd;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setImgFront(String imgFront) {
        this.imgFront = imgFront;
    }

    public void setImgBack(String imgBack) {
        this.imgBack = imgBack;
    }

    public void setVerify(String verify) {
        this.verify = verify;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    
}
