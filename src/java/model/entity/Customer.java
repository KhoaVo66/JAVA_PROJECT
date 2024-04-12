/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.entity;

/**
 *
 * @author ADMIN
 */
public class Customer {
    private int customerId;
    private String name;
    private String phone;
    private String idCard;
    private int bookingId; // Khóa ngoại từ bảng Bookings

    // Constructor
    public Customer(int customerId, String name, String phone, String idCard, int bookingId) {
        this.customerId = customerId;
        this.name = name;
        this.phone = phone;
        this.idCard = idCard;
        this.bookingId = bookingId;
    }

    public Customer(int customerId, String name, String phone, String idCard) {
        this.customerId = customerId;
        this.name = name;
        this.phone = phone;
        this.idCard = idCard;
    }

    public Customer(String name, String phone, String idCard, int bookingId) {
        this.name = name;
        this.phone = phone;
        this.idCard = idCard;
        this.bookingId = bookingId;
    }
    

    // Getters and setters
    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

}

