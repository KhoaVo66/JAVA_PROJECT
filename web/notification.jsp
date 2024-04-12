<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Notification</title>
    <%@include file="includes/header.jsp" %>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }

        .container {
            max-width: 700px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1, h2 {
            color: black;
            margin-top: 0;
        }

        .btn-primary {
            background-color: black;
            color: #fff;
            border: none;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <br>
    <br>
<div class="container">
    <h1>Thanks For Booking Full Tour</h1>
    <br>
    <h2>We Will Contact You Soon</h2>
    <br>
    <a href="Home" class="btn btn-primary">Back to Homepage</a>
</div>
</body>
</html>
