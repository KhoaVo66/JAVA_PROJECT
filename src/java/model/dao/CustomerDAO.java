/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.util.List;
import model.database.DatabaseConnector;
import model.entity.Customer;

/**
 *
 * @author ADMIN
 */
public class CustomerDAO {

    private Connection connection;

    public CustomerDAO(Connection connection) {
        this.connection = DatabaseConnector.getConnection();
    }

    public List<Customer> getCustomerByBookingId(int bookingId) throws SQLException {
        List<Customer> customers = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Kết nối database
            connection = DatabaseConnector.getConnection();
            // Truy vấn SQL để lấy thông tin khách hàng dựa trên id đặt phòng
            String query = "SELECT c.* FROM Customer c INNER JOIN Bookings b ON c.booking_id = b.booking_id WHERE b.booking_id = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, bookingId);
            resultSet = preparedStatement.executeQuery();

            // Lặp qua các kết quả và thêm vào danh sách khách hàng
            while (resultSet.next()) {
                int customerId = resultSet.getInt("customer_id");
                String name = resultSet.getString("name");
                String phone = resultSet.getString("phone");
                String idCard = resultSet.getString("id_card");

                // Tạo đối tượng khách hàng và thêm vào danh sách
                Customer customer = new Customer(customerId, name, phone, idCard, bookingId);
                customers.add(customer);
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ một cách thích hợp, ví dụ: ghi log
            e.printStackTrace();
            throw e; // Ném lại ngoại lệ để thông báo cho lớp gọi xử lý
        } finally {
            // Đóng các resource
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
        return customers;
    }

    public void createCustomer(Customer customer) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Kết nối database
            connection = DatabaseConnector.getConnection();
            // Truy vấn SQL để thêm khách hàng vào cơ sở dữ liệu
            String query = "INSERT INTO Customer (name, phone, id_card, booking_id) VALUES (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getPhone());
            preparedStatement.setString(3, customer.getIdCard());
            preparedStatement.setInt(4, customer.getBookingId());

            // Thực thi truy vấn
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            // Xử lý ngoại lệ một cách thích hợp, ví dụ: ghi log
            e.printStackTrace();
            throw e; // Ném lại ngoại lệ để thông báo cho lớp gọi xử lý
        } finally {
            // Đóng các resource
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }
    }
    
    public void deleteCustomer(int customerId) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        // Kết nối database
        connection = DatabaseConnector.getConnection();
        // Truy vấn SQL để xóa khách hàng khỏi cơ sở dữ liệu
        String query = "DELETE FROM Customer WHERE customer_id = ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, customerId);
        
        // Thực thi truy vấn
        preparedStatement.executeUpdate();
    } catch (SQLException e) {
        // Xử lý ngoại lệ một cách thích hợp, ví dụ: ghi log
        e.printStackTrace();
        throw e; // Ném lại ngoại lệ để thông báo cho lớp gọi xử lý
    } finally {
        // Đóng các resource
        if (preparedStatement != null) {
            preparedStatement.close();
        }
    }
}


}
