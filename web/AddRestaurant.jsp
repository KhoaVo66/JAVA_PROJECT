<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="includes/header.jsp" %>
    <meta charset="UTF-8">
    <title>Create Restaurant</title>
</head>
<body>
    <br>
    <br>
    <br>
    <br>
    <form id="restaurantForm" action="ManageRestaurantServlet" method="post" enctype="multipart/form-data">
        <div class="container">
            <h2>Create Restaurant</h2>
            <br>
            <div class="form-group">
                <label for="restaurantName">Restaurant Name:</label>
                <input type="text" id="restaurantName" name="restaurantName" class="form-control">
            </div>
            <br>
            <label for="location">Select a location:</label>
            <select id="location" name="locationId" required>
                <c:forEach var="location" items="${locations}">
                    <option value="${location.locationId}">${location.locationName}</option>
                </c:forEach>
            </select><br><br>
            <div class="form-group">
                <label for="address">Address:</label>
                <textarea id="address" name="address" class="form-control" rows="3"></textarea>
            </div>
            <br>
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" name="image" id="image">
            </div>

            <br>
            <br>
            <!-- Add Button -->
            <button type="submit" class="btn btn-primary">Add</button>

            <!-- Back Button -->
            <button type="button" onclick="history.back();" class="btn btn-secondary">Back</button>
        </div>
    </form>
    <!-- Success Modal -->
    <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">Success!</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Restaurant created successfully.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Show success modal after form submission
        document.getElementById("restaurantForm").addEventListener("submit", function(event) {
            event.preventDefault(); // Prevent default form submission
            $('#successModal').modal('show'); // Show success modal
            // Optional: You can submit the form after a delay if needed
             setTimeout(function() {
                 document.getElementById("restaurantForm").submit();
             }, 2000); // Submit after 2 seconds
        });
    </script>
</body>
</html>
