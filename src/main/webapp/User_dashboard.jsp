<%--
  Created by IntelliJ IDEA.
  User: sadar
  Date: 1/26/2025
  Time: 12:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PrimePicks</title>

    <style>
        body {
            background-image: url("assets/@wallandiamin (26).jpg");
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #ffffff; /* Fallback background color */
            color: #ffffff; /* Text color */
            background-size: cover; /* Make the background image cover the entire screen */
            background-position: center; /* Center the background image */
            background-repeat: no-repeat; /* Prevent the image from repeating */
            height: 100vh; /* Ensure the body takes the full viewport height */
            overflow-x: hidden; /* Prevent horizontal scrolling */
        }

        /* Navbar */
        .navbar {
            background: rgba(255, 90, 0, 0.8);
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .navbar h1 {
            margin: 0;
        }

        .navbar ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
        }

        .navbar ul li {
            padding: 10px 15px;
        }

        .navbar ul li a {
            text-decoration: none;
            color: black;
            font-weight: bold;
        }

        .navbar ul li:hover {
            background-color: #ffb600;
        }

        h1 a {
            text-decoration: none;
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<div class="navbar">
    <h1><a href="User_dashboard.jsp">PrimePicks</a></h1>
    <ul>
        <li><a href="products">Product List</a></li>
        <li><a href="cart.jsp">Cart</a></li>
        <li><a href="order_placement.jsp">Order Placement</a></li>
        <li><a href="profile_manage.jsp">Profile Manage</a></li>
        <li><a href="index.jsp">Logout</a></li>
    </ul>
</div>
</body>
</html>
