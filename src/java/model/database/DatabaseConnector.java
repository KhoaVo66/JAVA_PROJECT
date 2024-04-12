/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=TravelManagementSystem; trustServerCertificate = true";
    private static final String USERNAME = "tk";
    private static final String PASSWORD = "123";

    public static Connection connection;

    public DatabaseConnector() {
        // Private constructor to prevent instantiation
        if (connection == null) {
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace(); // Handle the exception appropriately
            }
        }
    }

    public static Connection getConnection() {
        if (connection == null) {
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace(); // Handle the exception appropriately
            }
        }
        return connection;
    }

    public static void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Handle the exception appropriately
            }
        }
    }
    
    public static void main(String[] args) {
        try{
            new DatabaseConnector();
            System.out.println("ket not thanh cong");
        }catch(Exception ex){
             System.out.println("ket not that bat "+ ex.getMessage());
        }
    }
}

