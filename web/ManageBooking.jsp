<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Bookings</title>
    <%@ include file="includes/header.jsp" %>
</head>
<body>
    
    <%@include file="includes/sidebar.jsp" %>
    <div class="container">
        <br>
        <br>
        <h2>List of Bookings</h2>
    <table class="table table-light">
        <thead>
            <tr>
                <th scope="col">Booking ID</th>
                <th scope="col">Tour Name</th>
                <th scope="col">User Name</th>
                <th scope="col">Phone</th>
                <th scope="col">Booking Date</th>
                <th scope="col">Number of People</th>
                <th scope="col">Total Price</th>
                <th scope="col">Action</th> 
            </tr>
        </thead>
        <tbody>
            <c:forEach var="booking" items="${bookings}">
                <tr>
                    <td>${booking.bookingId}</td>
                    <td>${booking.tour.tourName}</td>
                    <td>${booking.user.name}</td>
                    <td>${booking.user.phone}</td>
                    <td>${booking.bookingDate}</td>
                    <td>${booking.numberOfPeople}</td>
                    <td>${booking.totalPrice}</td>
                    <td>
    <form action="BookingApprovalServlet" method="post"> <!-- Form cho nút Approve -->
        <input type="hidden" name="bookingId" value="${booking.bookingId}">
        <button type="submit" class="btn btn-primary">Approve</button>
    </form>
    <form action="BookingRejectionServlet" method="post"> <!-- Form cho nút Reject -->
        <input type="hidden" name="bookingId" value="${booking.bookingId}">
        <button type="submit" class="btn btn-danger">Reject</button>
    </form>
</td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
</body>
</html>
