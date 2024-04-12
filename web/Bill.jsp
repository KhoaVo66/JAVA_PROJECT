<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="css/newcss.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Pay</title>
    <%@include file="includes/header.jsp" %>
</head>
<body>
<br>
<br>
<br>
<div class="container">
    <div class="card w-50 mx-auto my-5">
        <div class="card-header text-center">Payment</div>
        <div class="card-body">
            <div class="payment-section">
                <form action="CreateBillServlet" method="POST" id="payment-form">
                    <input type="hidden" id="name" name="name" value="${param.name}" />
                    <input type="hidden" id="email" name="email" value="${param.email}" />
                    <input type="hidden" id="totalPrice" name="totalPrice" value="${param.totalPrice}" />
                    <input type="hidden" id="bookingId" name="bookingId" value="${param.bookingId}">
                    <div class="form-group">
                        <label for="totalPrice">Total Price</label>
                        <input type="text" id="totalPrice" name="totalPrice" value="${param.totalPrice}" readonly>
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="paymentDate">Payment Date</label>
                        <input type="date" id="paymentDate" name="paymentDate" required>
                    </div>
                    <br>
                    <label for="paymentMethod">Payment Method:</label>
                    <select id="paymentMethod" name="paymentMethod" required>
                        <option value="Cash">Cash</option>
                        <option value="Visa Card">Visa Card</option>
                    </select>
                    <br>
                    <br>
                    <div style="text-align: center;">
                        <!-- Add onclick event to call JavaScript function -->
                        <button type="button" class="btn btn-dark" onclick="confirmPayment()">Next</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>

<!-- jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Modal for confirmation -->
<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmModalLabel">Confirmation</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to proceed with cash payment? If you choose Confirm you can leave a review in tour detail page
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <!-- Change button type to submit -->
                <button type="submit" class="btn btn-dark" id="confirmPaymentBtn">Confirm Payment</button>
            </div>
        </div>
    </div>
</div>

<script>
    function confirmPayment() {
        var paymentMethod = document.getElementById('paymentMethod').value;
        if (paymentMethod === 'Cash') {
            // Display the modal if payment method is Cash
            $('#confirmModal').modal('show');
        } else {
            // If payment method is not Cash, submit the form directly
            document.getElementById('payment-form').submit();
        }
    }

    // Function to handle form submission after confirmation
    $(document).on('click', '#confirmPaymentBtn', function () {
        // Submit the form when Confirm button in the modal is clicked
        document.getElementById('payment-form').submit();
    });
</script>


</body>
</html>
