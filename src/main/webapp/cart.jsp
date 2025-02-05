<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-image: url("assets/@wallandiamin (26).jpg");
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            color: #ffffff;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
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

        .cart-container {
            width: 500px;
            background-color: rgba(0, 0, 0, 0.71);
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(255, 255, 255, 0.4);
        }

        .cart-title {
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            color: #ff9900;
        }

        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #f8f9fa;
            color: #333;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .cart-item img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .cart-item-info {
            flex: 1;
        }

        .cart-item input {
            width: 60px;
            text-align: center;
            border: 1px solid #6a7073;
            border-radius: 5px;
            background-color: #fff;
            color: #000;
        }

        .cart-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .btn-primary {
            background-color: #ff9900;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            padding: 10px 15px;
            width: 100%;
            margin-top: 10px;
        }
        .btn-danger {
            background-color: #ff0c0c !important;
            color: #fff !important;
            border: none !important;
            margin-left: 5px;
            padding: 6px 12px !important;
            font-size: 0.9rem !important;
        }

        .btn-danger:hover {
            background-color: #c82333 !important;
        }

        .btn-primary {
            background-color: #ff9900;
            border: none;
            border-radius: 5px;
        }

        .btn-primary:hover {
            background-color: #e68a00;
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

<div class="cart-container">
    <h2 class="cart-title">Shopping Cart</h2>
    <div id="cart-items">
        <div class="cart-item" data-id="1">
            <img src="assets/240_F_925103516_YSTdpexRqzJQTmpl91JrXq9oowBI0GzE.jpg" alt="Smartphone">
            <div class="cart-item-info">
                <strong>Smartphone
                </strong>
                <p> Rs.50000.0</p>
            </div>
            <input type="number" value="1" min="1" onchange="updateTotal()">
            <button class="btn btn-danger btn-sm" onclick="removeItem(this, 1)">Remove</button>
        </div>
        <div class="cart-item" data-id="2">
            <img src="assets/1000_F_124995042_djbALLU5Oqc5nFYcZOhichJvaDsaJ0Ln.jpg" alt="Volleyball">
            <div class="cart-item-info">
                <strong>Volleyball</strong>
                <p>Rs.2500.0</p>
            </div>
            <input type="number" value="2" min="1" onchange="updateTotal()">
            <button class="btn btn-danger btn-sm" onclick="removeItem(this, 2)">Remove</button>
        </div>
    </div>
    <div class="text-end mt-3">
        <strong>Total: Rs. <span id="total-price">55000.0</span></strong>
    </div>
    <div class="cart-actions">
        <button class="btn btn-primary" onclick="checkout()">Proceed to Checkout</button>
    </div>
</div>

<script>
    function updateTotal() {
        let total = 0;
        document.querySelectorAll(".cart-item").forEach(item => {
            let price = parseFloat(item.querySelector("p").innerText.replace('Rs.', '').trim());
            let quantity = parseInt(item.querySelector("input").value);
            total += price * quantity;
        });
        document.getElementById("total-price").innerText = total.toFixed(2);
    }

    function removeItem(button, id) {
        if (confirm("Are you sure you want to delete this item?")) {
            button.parentElement.remove();
            updateTotal();
        }
    }

    function checkout() {
        window.location.href = "order_placement.jsp";
    }
</script>

</body>
</html>