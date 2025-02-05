<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ecommerce_assignment.dto.CategoryDTO" %>
<%@ page import="ecommerce_assignment.dto.ProductDTO" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Browsing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <style>
        /* General body styling */
        body {
            background-image: url("assets/@wallandiamin (26).jpg");
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5; /* Lighter background for contrast */
            color: #333; /* Darker text color */
            background-size: auto; /* Use original image size */
            background-position: top left; /* Aligns the image to the top left */
            background-repeat: repeat; /* Make the background repeat as a grid */
            height: 100%; /* Ensure it takes up full height */
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

        .product-title {
            font-size: 2rem;
            font-weight: bold;
            color: #ff9900;
            margin-top: 90px;
            margin-bottom: 30px;
        }

        /* Filter form */
        .filter-form {
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
        }

        .filter-form select, .filter-form button {
            border-radius: 8px;
            padding: 10px 15px;
            font-size: 1rem;
            border: 1px solid rgba(204, 204, 204, 0.9);
            background-color: rgba(255, 255, 255, 0.8);
            transition: all 0.3s ease;
        }

        .filter-form select:hover, .filter-form button:hover {
            background-color: #ff9900;
            border-color: #ff9900;
            color: white;
        }

        /* Cards Styling */
        .card {
            background-color: rgba(255, 255, 255, 0.8);
            border: 1px solid #ddd;
            border-radius: 12px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

        .card-body {
            padding: 15px;
        }

        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
        }

        .card-text {
            color: #888;
            font-size: 1rem;
            margin: 10px 0;
        }

        .btn-add-to-cart {
            background-color: #ff9900;
            border-color: #ff9900;
            color: white;
            padding: 10px 15px;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .btn-add-to-cart:hover {
            background-color: #e68a00;
            border-color: #e68a00;
        }

        /* Row styling */
        .row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px; /* Larger gap between items */
            justify-content: flex-start;
        }

        .col-md-3, .col-sm-4, .col-6 {
            flex: 1 1 calc(25% - 20px); /* Responsive column sizing */
            max-width: 25%;
        }

        /* Media query for smaller screens */
        @media (max-width: 768px) {
            .col-md-3 {
                flex: 1 1 calc(50% - 20px);
                max-width: 50%;
            }
        }

        @media (max-width: 480px) {
            .col-md-3 {
                flex: 1 1 100%;
                max-width: 100%;
            }
        }
    </style>
</head>
<body>

<%
    // Fetching categories and products from request scope
    List<CategoryDTO> categories = (List<CategoryDTO>) request.getAttribute("categories");
    List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
    String selectedCategory = request.getParameter("category");
    String sortOrder = request.getParameter("sort");
%>

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

<!-- Product Filtering Form -->
<div class="container mt-5">
    <h2 class="product-title">Browse Products</h2>
    <form method="get" action="products" class="filter-form">
        <select name="category">
            <option value="">All Categories</option>
            <% if (categories != null) {
                for (CategoryDTO category : categories) { %>
            <option value="<%= category.getId() %>"
                    <%= String.valueOf(category.getId()).equals(selectedCategory) ? "selected" : "" %>>
                <%= category.getName() %>
            </option>
            <% }
            } %>
        </select>
        <select name="sort">
            <option value="asc" <%= "asc".equals(sortOrder) ? "selected" : "" %>>Price: Low to High</option>
            <option value="desc" <%= "desc".equals(sortOrder) ? "selected" : "" %>>Price: High to Low</option>
        </select>
        <button type="submit" class="btn btn-primary">Apply Filters</button>
    </form>

    <!-- Product Cards -->
    <div class="row">
        <% if (products != null) {
            for (ProductDTO product : products) { %>
        <div class="col-md-3 col-sm-4 col-6">
            <div class="card">
                <% if (product.getPhotos() != null && !product.getPhotos().isEmpty()) { %>
                <img src="${pageContext.request.contextPath}/<%= product.getPhotos().get(0).getPhotoUrl() %>"
                     class="card-img-top"
                     alt="<%= product.getName() %>">
                <% } else { %>
                <img src="default-product.jpg" class="card-img-top" alt="<%= product.getName() %>">
                <% } %>
                <div class="card-body">
                    <h5 class="card-title"><%= product.getName() %></h5>
                    <p class="card-text">Rs.<%= product.getPrice() %></p>
                    <button class="btn-add-to-cart">Add to Cart</button>
                </div>
            </div>
        </div>
        <% }
        } %>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>