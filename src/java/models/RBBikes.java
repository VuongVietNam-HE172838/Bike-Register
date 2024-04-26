/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author thant
 */
public class RBBikes {
    String brand, name, sokhung, somay, uid, ngaydk, plate, verify;

    public RBBikes() {
    }

    public RBBikes(String brand, String name, String sokhung, String somay, String uid, String ngaydk, String plate, String verify) {
        this.brand = brand;
        this.name = name;
        this.sokhung = sokhung;
        this.somay = somay;
        this.uid = uid;
        this.ngaydk = ngaydk;
        this.plate = plate;
        this.verify = verify;
    }

    public String getBrand() {
        return brand;
    }

    public String getName() {
        return name;
    }

    public String getSokhung() {
        return sokhung;
    }

    public String getSomay() {
        return somay;
    }

    public String getUid() {
        return uid;
    }

    public String getNgaydk() {
        return ngaydk;
    }

    public String getPlate() {
        return plate;
    }

    public String getVerify() {
        return verify;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSokhung(String sokhung) {
        this.sokhung = sokhung;
    }

    public void setSomay(String somay) {
        this.somay = somay;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public void setNgaydk(String ngaydk) {
        this.ngaydk = ngaydk;
    }

    public void setPlate(String plate) {
        this.plate = plate;
    }

    public void setVerify(String verify) {
        this.verify = verify;
    }
    
    
}
