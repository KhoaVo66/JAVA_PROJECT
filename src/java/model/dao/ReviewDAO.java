/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

/**
 *
 * @author ADMIN
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.entity.Booking;
import model.entity.Review;
import model.entity.Tour;
import model.entity.User;

public class ReviewDAO {

    private Connection connection;

    public ReviewDAO(Connection connection) {
        this.connection = connection;
    }

    public List<Review> getAllReviews() throws SQLException {
        List<Review> reviewList = new ArrayList<>();
        String sql = "SELECT r.review_id, r.booking_id, r.content, r.rating, "
                + "b.booking_date, b.number_of_people, b.total_price, "
                + "b.tour_id, t.tour_name "
                + "FROM Reviews r "
                + "JOIN Bookings b ON r.booking_id = b.booking_id "
                + "JOIN Tours t ON b.tour_id = t.tour_id";
        
        try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Review review = new Review();
                review.setReviewId(resultSet.getInt("review_id"));
                review.setContent(resultSet.getString("content"));
                review.setRating(resultSet.getInt("rating"));

                Booking booking = new Booking();
                booking.setBookingId(resultSet.getInt("booking_id"));
                booking.setBookingDate(resultSet.getDate("booking_date"));
                booking.setNumberOfPeople(resultSet.getInt("number_of_people"));
                booking.setTotalPrice(resultSet.getBigDecimal("total_price"));

                Tour tour = new Tour();
                tour.setTourId(resultSet.getInt("tour_id"));
                tour.setTourName(resultSet.getString("tour_name"));

                booking.setTour(tour);
                review.setBooking(booking);

                reviewList.add(review);
            }
        }
        return reviewList;
    }

    public void deleteReview(int reviewId) throws SQLException {
        String deleteQuery = "DELETE FROM Reviews WHERE review_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(deleteQuery)) {
            statement.setInt(1, reviewId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý ngoại lệ một cách thích hợp
        }
    }
    
   public Review getReviewById(int reviewId) throws SQLException {
    String query = "SELECT r.review_id, r.content, r.rating, r.booking_id, b.tour_id, t.tour_name " +
                   "FROM reviews r " +
                   "JOIN bookings b ON r.booking_id = b.booking_id " +
                   "JOIN tours t ON b.tour_id = t.tour_id " +
                   "WHERE r.review_id = ?";
    try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        preparedStatement.setInt(1, reviewId);
        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            if (resultSet.next()) {
                Review review = new Review();
                review.setReviewId(resultSet.getInt("review_id"));
                review.setRating(resultSet.getInt("rating"));
                review.setContent(resultSet.getString("content"));
                
                // Create a Booking object
                Booking booking = new Booking();
                booking.setBookingId(resultSet.getInt("booking_id"));
                
                // Create a Tour object and set its name
                Tour tour = new Tour();
                tour.setTourId(resultSet.getInt("tour_id"));
                tour.setTourName(resultSet.getString("tour_name"));
                
                // Set the Tour object in the Booking
                booking.setTour(tour);
                
                // Set the Booking object in the Review
                review.setBooking(booking);
                
                return review;
            }
        }
    }
    return null;
}
   
   public List<Review> getReviewsByUserId(int userId) throws SQLException {
        List<Review> reviews = new ArrayList<>();
        String query = "SELECT r.review_id, r.content, r.rating, b.booking_id, t.tour_id, t.tour_name " +
                       "FROM reviews r " +
                       "JOIN bookings b ON r.booking_id = b.booking_id " +
                       "JOIN tours t ON b.tour_id = t.tour_id " +
                       "WHERE b.user_id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Review review = new Review();
                    review.setReviewId(resultSet.getInt("review_id"));
                    review.setContent(resultSet.getString("content"));
                    review.setRating(resultSet.getInt("rating"));
                    
                    // Assuming you have appropriate setters in the Review class for booking and tour
                    Booking booking = new Booking();
                    booking.setBookingId(resultSet.getInt("booking_id"));
                    Tour tour = new Tour();
                    tour.setTourId(resultSet.getInt("tour_id"));
                    tour.setTourName(resultSet.getString("tour_name"));
                    
                    booking.setTour(tour);
                    
                    review.setBooking(booking);
                    
                    reviews.add(review);
                }
            }
        }
        return reviews;
    }

public List<Review> getAllReviewsByTourId(int tourId) throws SQLException {
    List<Review> reviews = new ArrayList<>();
    String sql = "SELECT TOP 4 r.review_id, u.user_id, u.name, r.content, r.rating, b.booking_id, b.tour_id " +
                 "FROM users u " +
                 "JOIN bookings b ON u.user_id = b.user_id " +
                 "JOIN reviews r ON r.booking_id = b.booking_id " +
                 "WHERE b.tour_id = ? " +
                 "ORDER BY r.review_id DESC";

    
    try (PreparedStatement statement = connection.prepareStatement(sql)) {
        statement.setInt(1, tourId);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            Review review = new Review();
            review.setReviewId(resultSet.getInt("review_id"));
            review.setRating(resultSet.getInt("rating"));
            review.setContent(resultSet.getString("content"));
            
            // Create a Booking object
            Booking booking = new Booking();
            booking.setBookingId(resultSet.getInt("booking_id"));
            
            // Create a Tour object and set its ID
            Tour tour = new Tour();
            tour.setTourId(resultSet.getInt("tour_id"));
            
            // Create a User object and set its name
            User user = new User();
            user.setUserId(resultSet.getInt("user_id"));
            user.setName(resultSet.getString("name"));
            
            // Set the Tour object in the Booking
            booking.setTour(tour);
            
            // Set the User object in the Review
            booking.setUser(user);
            
            // Set the Booking object in the Review
            review.setBooking(booking);
            
            reviews.add(review);
        }
    }

    return reviews;
}

public boolean createReview(int userId, int bookingId, String content, int rating) {
    String query = "INSERT INTO Reviews (booking_id, content, rating) VALUES (?, ?, ?)";
    try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        preparedStatement.setInt(1, bookingId);
        preparedStatement.setString(2, content);
        preparedStatement.setInt(3, rating);
        int rowsAffected = preparedStatement.executeUpdate();
        return rowsAffected > 0; // Trả về true nếu có ít nhất một dòng bị ảnh hưởng
    } catch (SQLException e) {
        e.printStackTrace();
        return false; // Trả về false nếu xảy ra lỗi
    }
}





    
    public boolean updateReview(Review review) {
    String sql = "UPDATE Reviews SET content = ?, rating = ? WHERE review_id = ?";
    try (PreparedStatement statement = connection.prepareStatement(sql)) {
        statement.setString(1, review.getContent());
        statement.setInt(2, review.getRating());
        statement.setInt(3, review.getReviewId()); // Use review_id to identify the review
        int rowsUpdated = statement.executeUpdate();
        return rowsUpdated > 0;
    } catch (SQLException e) {
        e.printStackTrace(); // Handle the exception appropriately
        return false;
    }
}

        public boolean checkReviewsByUserStatus(String status) throws SQLException {
        String query = "SELECT COUNT(*) FROM Reviews r " +
                       "JOIN Bookings b ON r.booking_id = b.booking_id " +
                       "JOIN Users u ON b.user_id = u.user_id " +
                       "WHERE u.status = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, status);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        }
        return false;
    }
    
public List<Review> getAllReviewsWithStatusZero(int tourId) throws SQLException {
    List<Review> reviews = new ArrayList<>();
    String query = "SELECT TOP 4 r.review_id, u.user_id, u.name, r.content, r.rating, b.booking_id, b.tour_id " +
                   "FROM Reviews r " +
                   "JOIN Bookings b ON r.booking_id = b.booking_id " +
                   "JOIN Users u ON b.user_id = u.user_id " +
                   "WHERE u.status = '0' AND b.tour_id = ? " +
                   "ORDER BY r.review_id DESC";
    try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        preparedStatement.setInt(1, tourId);
        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Review review = new Review();
                review.setReviewId(resultSet.getInt("review_id"));
                review.setRating(resultSet.getInt("rating"));
                review.setContent(resultSet.getString("content"));
                
                // Create a Booking object
                Booking booking = new Booking();
                booking.setBookingId(resultSet.getInt("booking_id"));
                
                // Create a Tour object and set its ID
                Tour tour = new Tour();
                tour.setTourId(resultSet.getInt("tour_id"));
                
                // Create a User object and set its ID and name
                User user = new User();
                user.setUserId(resultSet.getInt("user_id"));
                user.setName(resultSet.getString("name"));
               
                
                // Set the Tour object in the Booking
                booking.setTour(tour);
                
                // Set the User object in the Review
                booking.setUser(user);
                
                // Set the Booking object in the Review
                review.setBooking(booking);
                
                reviews.add(review);
            }
        }
    }
    return reviews;
}
    
    
}
