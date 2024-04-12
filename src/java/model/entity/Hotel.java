/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.entity;

/**
 *
 * @author ADMIN
 */

public class Hotel {
    private int hotelId;
    private String hotelName;
    private Location location;  // Foreign Key to Location
    private String imageUrl;
    private String address;

    public Hotel(int hotelId, String hotelName, Location location, String imageUrl, String address) {
        this.hotelId = hotelId;
        this.hotelName = hotelName;
        this.location = location;
        this.imageUrl = imageUrl;
        this.address = address;
    }

    public Hotel(String hotelName, Location location, String imageUrl, String address) {
        this.hotelName = hotelName;
        this.location = location;
        this.imageUrl = imageUrl;
        this.address = address;
    }

    public Hotel() {
    }

    
    // Getters and Setters

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
}

