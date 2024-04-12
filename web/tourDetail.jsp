<%-- 
    Document   : tourDetail
    Created on : 16 thg 2, 2024, 23:51:01
    Author     : TATSU
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="includes/header.jsp" %>
        <script src="https://kit.fontawesome.com/5a5f994da7.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style_rating.css">
   
    </head>
    <style>
  /* Active (filled) star */
  .fa-star{
      color: gold; 
  }
.review-container {
    position: relative;
}

.more-options {
    position: absolute;
    top: 10px;
    right: 10px;
}

.options-dropdown {
    display: none;
    position: absolute;
    top: 100%;
    right: 0;
    background-color: white;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    z-index: 1;
}

.review-container:hover .options-dropdown {
    display: block;
}

.edit-btn,
.delete-btn {
    width: 100%;
    margin-bottom: 5px;
    text-align: center;
    border: 1px solid transparent;
    background-color: transparent;
    color: #808B8D;
}

</style>
    <body>
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

        <!-- Topbar Start -->
        <div class="container-fluid bg-dark px-5 d-none d-lg-block">
            <div class="row gx-0">
                <div class="col-lg-8 text-center text-lg-start mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center" style="height: 45px;">
                        <small class="me-3 text-light"><i class="fa fa-map-marker-alt me-2"></i> 286 Nguyen Van Linh Street, Da Nang, Viet Nam</small>
                        <small class="me-3 text-light"><i class="fa fa-phone-alt me-2"></i>091-756-5960</small>
                        <small class="text-light"><i class="fa fa-envelope-open me-2"></i>C4T@gmail.com</small>
                    </div>
                </div>
                <div class="col-lg-4 text-center text-lg-end">
                    <div class="d-inline-flex align-items-center" style="height: 45px;">
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-twitter fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-facebook-f fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-linkedin-in fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-instagram fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle" href=""><i class="fab fa-youtube fw-normal"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->
        
        <!-- Navbar & Hero Start -->
        <div class="container-fluid position-relative p-0">
            <%@include file="includes/navbar.jsp" %>


        </div>
        <!-- Navbar & Hero End -->

        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div style="display: flex; align-items: center; padding-top: 50px; font-size: 200%; font-weight: bold">
                    <div style="width: 50%">
                        <div>${tour.tourName} - ${tour.startLocation}</div>
                    </div>
                    <div style="width: 50%; display: flex; align-items: center">
                        <div style="width: 50%;font-size: 70%; text-align: right; padding-right: 10px; color: red">$ ${tour.tourPrice}/guest</div>
                        <div style="width: 50%;font-size: 50%">
                            <a href="OrderDetailServlet?id=${id}" style="display: inline-block; text-align: center; border:solid 1px; padding: 10px; margin-bottom: 5px; width: 300px; background-color: red; color:white; border-radius: 3%"><i class="fa-solid fa-cart-shopping"></i> Book Now</a>
                        </div>                        
                    </div>
                        
                </div>
                      <div style="display: flex; align-items: center; padding-top: 50px; font-size: 200%; font-weight: bold">
                          <div style="width: 50%"></div>
                    <div style="width: 50%; display: flex; align-items: center">
                        <div style="width: 50%;font-size: 70%; text-align: right; padding-right: 10px; color: red">$ ${fullPrice}</div>
                        <div style="width: 50%;font-size: 50%">
                            <a href="BookingFullServlet?id=${id}&people=${tour.maxCapacity}&totalPrice=${fullPrice}" style="display: inline-block; text-align: center; border:solid 1px; padding: 10px; margin-bottom: 5px; width: 300px; background-color: red; color:white; border-radius: 3%"><i class="fa-solid fa-cart-shopping"></i> Book Full Tour</a>
                        </div>
                        </div>
                        </div>

                <img alt="tour image" src="images/${tour.imageUrl}" style="width: 100%; margin-top: 50px;"/>
            </div>
            <div style="display: flex; margin-top: 40px;">
                <div style="border: 1px solid; border-color: #e0e0de; padding: 20px; width: 40%; margin-right: 40px">
                    <h4><span style="font-weight: 100">Start date:</span> ${tour.startDate}</h4>
                    <h4><span style="font-weight: 100">Day(s):</span> ${days}</h4>
                    <h4><span style="font-weight: 100">Start location:</span> ${tour.startLocation}</h4>
                    <h4><span style="font-weight: 100">Capacity:</span> ${tour.maxCapacity}</h4>
                    <h4><span style="font-weight: 100">Current:</span> ${tour.current}</h4>
                </div>
                <div style="width: 60%; display: flex; justify-content: space-around; flex-wrap: wrap">
                    <div>
                        <i class="fa-regular fa-flag"></i>
                        <h5>Time</h5>
                        <div>${days} day(s)</div>
                    </div>
                    <div><i class="fa-solid fa-car"></i>
                        <h5>Transportation</h5>
                        <div><c:forEach items="${transports}" var="t">
                                ${t.transportationName}, 
                            </c:forEach></div>
                    </div>
                    <div><i class="fa-solid fa-hotel"></i>
                        <h5>Hotel</h5>
                        <div><c:forEach items="${hotels}" var="h">
                                ${h.hotelName},
                            </c:forEach></div>
                    </div>
                    <div><i class="fa-solid fa-utensils"></i>
                        <h5>Restaurant</h5>
                        <div><c:forEach items="${restaurants}" var="r">
                                ${r.restaurantName},
                            </c:forEach></div>
                    </div>

                    <hr style="width: 100%; margin-top: 30px" />
                </div>
            </div>

            <div style="display: flex; margin-top: 40px">
                <div  style="border: 1px solid; border-color: #e0e0de; width:60%; padding: 20px;">
                    <h3>Tour Guide Information</h3>
                    <div style="padding: 10px; color: #d1d1d1; border: 1px solid;">
                        <div>Company Tour Guide</div>
                        <h3>${tour.employee.fullName}</h3>
                        <div>${tour.employee.email}</div>
                    </div>
                    <br>
                    <h3>Transportation</h3>
                    <div style="padding: 10px; color: #d1d1d1; border: 1px solid;">
                        <div><c:forEach items="${transports}" var="t">
                                <h3>${t.transportationName}</h3>
                                <img alt="transportation image" src="images/${t.imageUrl}" style="width: 50%; margin-top: 10px; margin-bottom: 10px;" />
                            </c:forEach></div>
                        </div>
                    <br>
                    <h3>Hotel</h3>
                    <div style="padding: 10px; color: #d1d1d1; border: 1px solid;">
                         <div><c:forEach items="${hotels}" var="h">
                                <h3>${h.hotelName}</h3>
                                <div>Address: ${h.address}</div>
                                <img alt="Hotel image" src="images/${h.imageUrl}" style="width: 50%; margin-top: 10px; margin-bottom: 10px;" />
                            </c:forEach></div>
                        </div>
                    <br>
                    <h3>Restaurant</h3>
                    <div style="padding: 10px; color: #d1d1d1; border: 1px solid;">
                         <div><c:forEach items="${restaurants}" var="r">
                                <h3>${r.restaurantName}</h3>
                                <div>Address: ${r.address}</div>
                                <img alt="Restaurant image" src="images/${r.imageUrl}" style="width: 50%; margin-top: 10px; margin-bottom: 10px;" />
                            </c:forEach></div>
                        </div>
                    <br>
                </div>
                <div style="width: 40%;margin-left: 40px">
                    <h5 style="text-align: center; ">Schedule</h5>
                    <c:forEach items="${activities}" var="a">
                        <div style="display: flex; align-items: center">
                            <div>Day</div>
                            <h5 style="padding-left: 7px; padding-right: 7px; background-color: #cf2604; color: white; margin-right: 10px; margin-left: 5px; border: 1px solid; border-radius: 100%"> ${a.dayNumber}</h5>
                            <div>
                                <div>${a.startTime.toString()} - ${a.endTime.toString()}</div>
                                <h6>${a.activityName} - ${a.location}</h6>
                                <div>${a.description}</div>
                                <br>
                                <br>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- About End -->
            
            

<!-- View User Reviews -->
<br>
<div class="card mx-auto" style="max-width: 900px; border: 1px solid #ccc; border-radius: 12px; padding: 20px;">
    <div>
        <div id="customerReviews" class="text-center">
            Total Reviews: <span id="totalReviews">0</span><br>
            Average Rating: <span id="averageRating">0.0</span>
            <span class="fa fa-star star-active ml-3"></span>                  
            <br><br>
            <div class="row d-flex justify-content-center">
                <div class="d-flex flex-column user-reviews">
                    <c:forEach var="review" items="${reviews}">
                        <div class="review-container">
                            <div class="review" style="border: 1px solid #ccc; border-radius: 8px; padding: 20px; margin-bottom: 20px; position: relative;">
                                <h4>${review.booking.tour.tourName} ${review.booking.tour.startLocation}</h4>
                                <h5 class="mt-2 mb-0">User: ${review.booking.user.name}</h5>
                                <div class="row text-left">
                                    <p class="content">Comment: ${review.content}</p>
                                </div>
                                <div>
                                    <p class="text-left">
                                        Rating: <span class="text-muted">${review.rating}</span>
                                        <span class="fa fa-star star-active ml-3"></span>
                                    </p>
                                </div>
                                <br>
                            </div>
                            <!-- Three dots icon for more options -->
                            <c:if test="${not empty auth.userId && auth.userId == review.booking.user.userId}">
                            <div class="more-options">
                                <span class="fa fa-ellipsis-h"></span>
                                <div class="options-dropdown">
                                    <button onclick="location.href='UpdateReviewServlet?action=update&reviewId=${review.reviewId}&id=${id}&action=update'" class="edit-btn">Edit</button>
                                    <button onclick="if(confirm('Are you sure you want to delete this review?')) location.href='UpdateReviewServlet?action=delete&reviewId=${review.reviewId}&id=${id}&action=delete'" type="button" class="delete-btn">Delete</button>    
                                </div>
                            </div>
                                </c:if>
                        </div>
                    </c:forEach>
                </div>   
            </div>
        </div>
    </div>
</div>
<!-- END -->


<!-- Create Review -->
<c:if test="${not empty auth.userId and not empty bookingIds}">
    <br>
    <div class="container">
        <h2>Review</h2>
        <br>
        <form id="commentForm" action="CreateReviewServlet" method="post" onsubmit="return validateRating();">
            <input type="hidden" value="${auth.userId}" name="userId">
            <input type="hidden" value="${id}" name="id">
            <c:forEach var="bookingId" items="${bookingIds}">
                <input type="hidden" value="${bookingId}" name="bookingId">
            </c:forEach>
            <div class="border rounded p-3 mb-4" style="box-shadow: 12px 10px 10px rgba(0, 0, 0, 0.1);">
                <div class="form-group">
                    <label for="comment">Your Comment:</label>
                    <textarea class="form-control" id="content" name="content" rows="4" required></textarea>
                </div>
                <div class="form-group">
                    <br>
                    <label for="rating">Your Rating:</label>
                    <div class="feedback">
                        <div class="rating">
                            <input type="radio" name="rating" id="rating-5" value="5">
                            <label for="rating-5"></label>
                            <input type="radio" name="rating" id="rating-4" value="4">
                            <label for="rating-4"></label>
                            <input type="radio" name="rating" id="rating-3" value="3">
                            <label for="rating-3"></label>
                            <input type="radio" name="rating" id="rating-2" value="2">
                            <label for="rating-2"></label>
                            <input type="radio" name="rating" id="rating-1" value="1">
                            <label for="rating-1"></label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </form>
    </div>
</c:if>
<!-- END -->


            <!-- Process Start -->
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center pb-4 wow fadeInUp" data-wow-delay="0.1s">
                        <h6 class="section-title bg-white text-center text-primary px-3">Process</h6>
                        <h1 class="mb-5">3 Easy Steps</h1>
                    </div>
                    <div class="row gy-5 gx-4 justify-content-center">
                        <div class="col-lg-4 col-sm-6 text-center pt-4 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="position-relative border border-primary pt-5 pb-4 px-4">
                                <div class="d-inline-flex align-items-center justify-content-center bg-primary rounded-circle position-absolute top-0 start-50 translate-middle shadow" style="width: 100px; height: 100px;">
                                    <i class="fa fa-globe fa-3x text-white"></i>
                                </div>
                                <h5 class="mt-4">Choose A Destination</h5>
                                <hr class="w-25 mx-auto bg-primary mb-1">
                                <hr class="w-50 mx-auto bg-primary mt-0">
                                <p class="mb-0">Tempor erat elitr rebum clita dolor diam ipsum sit diam amet diam eos erat ipsum et lorem et sit sed stet lorem sit</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6 text-center pt-4 wow fadeInUp" data-wow-delay="0.3s">
                            <div class="position-relative border border-primary pt-5 pb-4 px-4">
                                <div class="d-inline-flex align-items-center justify-content-center bg-primary rounded-circle position-absolute top-0 start-50 translate-middle shadow" style="width: 100px; height: 100px;">
                                    <i class="fa fa-dollar-sign fa-3x text-white"></i>
                                </div>
                                <h5 class="mt-4">Pay Online</h5>
                                <hr class="w-25 mx-auto bg-primary mb-1">
                                <hr class="w-50 mx-auto bg-primary mt-0">
                                <p class="mb-0">Tempor erat elitr rebum clita dolor diam ipsum sit diam amet diam eos erat ipsum et lorem et sit sed stet lorem sit</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6 text-center pt-4 wow fadeInUp" data-wow-delay="0.5s">
                            <div class="position-relative border border-primary pt-5 pb-4 px-4">
                                <div class="d-inline-flex align-items-center justify-content-center bg-primary rounded-circle position-absolute top-0 start-50 translate-middle shadow" style="width: 100px; height: 100px;">
                                    <i class="fa fa-plane fa-3x text-white"></i>
                                </div>
                                <h5 class="mt-4">Fly Today</h5>
                                <hr class="w-25 mx-auto bg-primary mb-1">
                                <hr class="w-50 mx-auto bg-primary mt-0">
                                <p class="mb-0">Tempor erat elitr rebum clita dolor diam ipsum sit diam amet diam eos erat ipsum et lorem et sit sed stet lorem sit</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Process Start -->

            <a href="Home" class="btn btn-primary">Back to Homepage</a>
            <%@include file="/includes/footer.jsp"%>


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="lib/wow/wow.min.js"></script>
            <script src="lib/easing/easing.min.js"></script>
            <script src="lib/waypoints/waypoints.min.js"></script>
            <script src="lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="lib/tempusdominus/js/moment.min.js"></script>
            <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
            <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

            <!-- Template Javascript -->
            <script src="js/main.js"></script>
            <script>
                // Function to display customer reviews
                function displayCustomerReviews() {
                    let totalReviews = document.querySelectorAll('.user-reviews .review').length;
                    let totalRating = 0;

                    // Loop through each review
                    document.querySelectorAll('.user-reviews .review').forEach(review => {
                        let rating = parseInt(review.querySelector('.text-muted').textContent);
                        totalRating += rating;
                    });

                    // Calculate average rating
                    let averageRating = totalReviews > 0 ? totalRating / totalReviews : 0;

                    // Update total reviews and average rating
                    document.getElementById('totalReviews').innerText = totalReviews;
                    document.getElementById('averageRating').innerText = averageRating.toFixed(1); // Round to 1 decimal place
                }
                
                // Call displayCustomerReviews function when the page is loaded
                window.addEventListener('load', function () {
                    displayCustomerReviews();
                });
                
                
                //--------------------------------------------------
                
                document.addEventListener("DOMContentLoaded", function() {
                    const moreOptionsIcons = document.querySelectorAll(".more-options");

                    // Function to close dropdowns when clicking outside
                    function closeDropdowns() {
                        moreOptionsIcons.forEach(function(icon) {
                            icon.querySelector(".options-dropdown").style.display = "none";
                        });
                    }

                    moreOptionsIcons.forEach(function(icon) {
                        icon.addEventListener("click", function(event) {
                            // Toggle options dropdown
                            const dropdown = icon.querySelector(".options-dropdown");
                            dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";

                            // Close other dropdowns if any
                            moreOptionsIcons.forEach(function(otherIcon) {
                                if (otherIcon !== icon) {
                                    otherIcon.querySelector(".options-dropdown").style.display = "none";
                                }
                            });

                            event.stopPropagation(); // Prevent bubbling to document
                        });
                    });
                   

                    // Close dropdowns when clicking outside
                    document.addEventListener("click", function(event) {
                        // Check if the click target is not inside the options dropdown
                        if (!event.target.closest('.options-dropdown')) {
                            closeDropdowns();
                        }
                    });
 });
                    //--------------------------


   
    function validateRating() {
    // Get all radio buttons with name="rating"
    var ratingButtons = document.querySelectorAll('input[name="rating"]');

    // Check if any radio button is checked
    var isChecked = Array.from(ratingButtons).some(function(button) {
        return button.checked;
    });

    // If no radio button is checked, display a warning message
    if (!isChecked) {
        alert("Please select a rating before submitting.");
        return false; // Prevent form submission
    }
    return true; // Allow form submission
}

            </script>
    </body>
</html>
