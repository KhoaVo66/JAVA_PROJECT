<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Customer List</title>
        <%@ include file="includes/header.jsp" %>
    </head>
    <body>
        <br>
        <br>
        <div class="container">
            <br>
            <br>
            <h2>Customer Information</h2>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Phone</th>
                        <th scope="col">ID Card</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="customer" items="${customerList}">
                        <tr>
                            <td>${customer.name}</td>
                            <td>${customer.phone}</td>
                            <td>${customer.idCard}</td>
                            <td>
                                <button onclick="confirmDelete(${customer.customerId}, ${bookingId}, '${name}', '${email}', ${totalPrice}, ${people})" type="button" class="btn btn-danger">Delete</button>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <br>
            <form action="AddCustomerServlet" method="post" onsubmit="return validateForm()">
                <h4>Add Customer Information</h4>
                <div style="padding: 20px; background-color: #ededed; display: flex; flex-wrap: wrap">
                    <input type="hidden" id="people" name="people" value="${people}" />
                    <input type="hidden" id="name" name="name" value="${name}" />
                    <input type="hidden" id="email" name="email" value="${email}" />
                    <input type="hidden" id="totalPrice" name="totalPrice" value="${totalPrice}" />
                    <input type="hidden" id="bookingId" name="bookingId" value="${bookingId}">
                    <div style="width: 50%; padding: 20px">
                        <label>Full Name</label><span style="color: red">*</span>
                        <input name="fullname" class="form-control"/>
                    </div>
                    <div style="width: 50%; padding: 20px">
                        <label>Phone</label><span style="color: red">*</span>
                        <input name="phone" id="phone" class="form-control"/>
                        <span id="phoneError" style="color: red; display: none;">Please enter a valid phone number.</span>
                    </div>
                    <div style="width: 50%; padding: 20px">
                        <label>ID Card</label>
                        <input id="idCard" name="idCard" class="form-control"/>
                        <span id="idCardError" style="color: red; display: none;">Please enter a valid ID card number.</span>
                    </div>
                </div>
                <br>
                <br>
                <input type="submit" id="submitBtn" value="Add Customer" />
            </form>
            <br>
            <br>
            <%--<a id="nextBtn" href="Bill.jsp?bookingId=${bookingId}&name=${name}&email=${email}&totalPrice=${totalPrice}" class="btn btn-secondary" disabled>Next</a>--%>
            <button id="nextBtn" onclick="nextStep()" class="btn btn-secondary" disabled>Next</button>
            <br>
            <br>
        </div>
        <%@ include file="includes/footer.jsp" %>
        <!-- Modal for confirming customer deletion -->
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
                        Are you sure you want to delete this customer?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger" id="confirmDeleteButton">Delete</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                var numberOfCustomers = ${customerList.size()}; // Số lượng khách hàng hiện có trong danh sách

                // Hàm để kiểm tra số lượng khách hàng và kích hoạt/disabled các nút tương ứng
                function checkCustomerCount() {
                    if (numberOfCustomers >= parseInt("${people}")) {
                        // Nếu số lượng khách hàng đã đủ, vô hiệu hóa nút "Add Customer" và kích hoạt nút "Next"
                        document.getElementById("submitBtn").disabled = true;
                        document.getElementById("nextBtn").disabled = false;
                    } else {
                        // Nếu số lượng khách hàng chưa đủ, kích hoạt nút "Add Customer" và vô hiệu hóa nút "Next"
                        document.getElementById("submitBtn").disabled = false;
                        document.getElementById("nextBtn").disabled = true;
                    }
                }

                // Gọi hàm kiểm tra số lượng khách hàng khi trang được tải
                checkCustomerCount();

                // Hàm để thêm một khách hàng mới
                function addCustomer() {
                    numberOfCustomers++; // Tăng số lượng khách hàng đã thêm
                    checkCustomerCount(); // Kiểm tra lại số lượng khách hàng
                }

                // Hàm để chuyển đến trang Bill.jsp
                function nextStep() {
                    var bookingId = "${bookingId}";
                    var name = "${name}";
                    var email = "${email}";
                    var totalPrice = "${totalPrice}";

                    // Tạo URL với các tham số bookingId, name, email, và totalPrice
                    var url = "Bill.jsp?bookingId=" + bookingId + "&name=" + name + "&email=" + email + "&totalPrice=" + totalPrice;

                    // Chuyển hướng đến trang Bill.jsp
                    window.location.href = url;
                }

                // Khai báo biến toàn cục cho customerIdToDelete và bookingIdToDelete
                var customerIdToDelete;
                var bookingIdToDelete;

                function confirmDelete(customerId, bookingId, name, email, totalPrice, people) {
                    customerIdToDelete = customerId;
                    bookingIdToDelete = bookingId;
                    $('#people').val(people);
                    $('#name').val(name);
                    $('#email').val(email);
                    $('#totalPrice').val(totalPrice);
                    $('#confirmDeleteModal').modal('show');
                }

                $(document).on('click', '#confirmDeleteButton', function () {
                    // Lấy giá trị của các tham số name, email, totalPrice từ các input hidden
                    var name = $('#name').val();
                    var email = $('#email').val();
                    var people = $('#people').val();
                    var totalPrice = $('#totalPrice').val();

                    // Thực hiện chuyển hướng đến servlet để xóa khách hàng
                    window.location.href = 'DeleteCustomerServlet?customerId=' + customerIdToDelete + '&bookingId=' + bookingIdToDelete + '&name=' + name + '&email=' + email + '&totalPrice=' + totalPrice + '&people=' + people;
                });
                function validateForm() {
                    var phone = document.getElementById("phone").value;
                    var idCard = document.getElementById("idCard").value;

                    // Validation for phone number
                    var phonePattern = /^\d{10}$/; // Change this pattern according to your phone number format
                    if (!phonePattern.test(phone)) {
                        document.getElementById("phoneError").style.display = "block";
                        return false;
                    } else {
                        document.getElementById("phoneError").style.display = "none";
                    }

                    // Validation for ID card
                    var idCardPattern = /^[0-9]{9,12}$/; // Change this pattern according to your ID card format
                    if (!idCardPattern.test(idCard)) {
                        document.getElementById("idCardError").style.display = "block";
                        return false;
                    } else {
                        document.getElementById("idCardError").style.display = "none";
                    }

                    return true;
                }
        </script>

    </body>
</html>
