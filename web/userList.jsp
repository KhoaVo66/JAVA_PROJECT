<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User List</title>
        <%@ include file="includes/header.jsp" %>
    </head>
    <body>
        <%@include file="includes/sidebar.jsp" %>
        <div class="container">
            <br>
            <br>
            <h2>User List</h2>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">User ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Address</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Role</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${userList}">
                        <tr>
                            <td>${user.userId}</td>
                            <td>${user.name}</td>
                            <td>${user.email}</td>
                            <td>${user.address}</td>
                            <td>${user.phone}</td>
                            <td>${user.role}</td>
                            <td style="color: ${user.status eq '0' ? 'green' : 'red'};">
                                <c:choose>
                                    <c:when test="${user.status eq '0'}">Good</c:when>
                                    <c:otherwise>Banned</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <button onclick="confirmBan(${user.userId})" type="button" class="btn btn-warning">Ban</button>
                                <button onclick="confirmUnBan(${user.userId})" type="button" class="btn btn-primary">Unban</button>
                                <!-- Delete button -->
                                <button onclick="confirmDelete(${user.userId})" type="button" class="btn btn-danger">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
            <br>
            <br>
            <a href="Home" class="btn btn-primary">Back to Homepage</a>
        </div>

        <!-- Modal for confirming user deletion -->
        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to delete this user?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger" id="confirmDeleteButton">Delete</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal for confirming user Ban -->
        <div class="modal fade" id="confirmBanModal" tabindex="-1" role="dialog" aria-labelledby="confirmBanModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmBanModalLabel">Confirm Ban</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to ban this user?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger" id="confirmBanButton">Ban</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal for confirming user Ban -->
        <div class="modal fade" id="confirmUnBanModal" tabindex="-1" role="dialog" aria-labelledby="confirmUnBanModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmUnBanModalLabel">Confirm Unban</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to Unban this user?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger" id="confirmUnBanButton">Unban</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                var userIdToDelete;

                function confirmDelete(userId) {
                    userIdToDelete = userId;
                    $('#confirmDeleteModal').modal('show');
                }

                // Xác nhận xóa khi người dùng nhấn nút "Delete" trong modal
                $(document).on('click', '#confirmDeleteButton', function () {
                    // Thực hiện chuyển hướng đến servlet để xóa người dùng
                    window.location.href = 'ManageUserServlet?userId=' + userIdToDelete + '&action=delete';
                });
                
                var userIdToBan;

                function confirmBan(userId) {
                    userIdToBan = userId;
                    $('#confirmBanModal').modal('show');
                }

                // Xác nhận xóa khi người dùng nhấn nút "Delete" trong modal
                $(document).on('click', '#confirmBanButton', function () {
                    // Thực hiện chuyển hướng đến servlet để xóa người dùng
                    window.location.href = 'ManageUserServlet?userId=' + userIdToBan + '&action=ban';
                });
                
                var userIdToUnBan;

                function confirmUnBan(userId) {
                    userIdToUnBan = userId;
                    $('#confirmUnBanModal').modal('show');
                }

                // Xác nhận xóa khi người dùng nhấn nút "Delete" trong modal
                $(document).on('click', '#confirmUnBanButton', function () {
                    // Thực hiện chuyển hướng đến servlet để xóa người dùng
                    window.location.href = 'ManageUserServlet?userId=' + userIdToUnBan + '&action=unban';
                });
        </script>
    </body>
</html>
