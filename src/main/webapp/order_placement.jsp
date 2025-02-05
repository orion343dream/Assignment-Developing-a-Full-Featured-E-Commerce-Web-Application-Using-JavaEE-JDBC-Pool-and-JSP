<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Placement</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-image: url("assets/@wallandiamin (26).jpg");
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            overflow-x: hidden;
            color: #ffffff;
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

        /* Order Summary Card Styling */
        .order-container {
            width: 700px;
            max-width: 800px;
            background: linear-gradient(145deg, rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.5));
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.5);
            text-align: left;
            color: #ffffff;
            transition: all 0.3s ease-in-out;
        }

        .order-title {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 20px;
            color: #ff9900;
            text-align: center;
        }

        .order-items {
            margin-bottom: 20px;
            border-bottom: 1px solid #444;
        }

        .order-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #444;
            font-size: 1rem;
        }

        .order-item:last-child {
            border-bottom: none;
        }

        .order-item span {
            color: #ff9900;
        }

        .order-total {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            font-size: 1.2rem;
            border-top: 1px solid #444;
            margin-top: 20px;
        }

        .order-total strong {
            color: #ff9900;
        }

        .btn-primary {
            width: 100%;
            background-color: #ff9900;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-size: 1.2rem;
            transition: background-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #e68a00;
        }

        /* Payment Popup Modal */
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            justify-content: center;
            align-items: center;
            z-index: 2000;
        }

        .modal-content {
            background: #1c1c1c;
            padding: 20px;
            border-radius: 10px;
            width: 350px;
            box-shadow: 0 4px 15px rgba(255, 255, 255, 0.3);
            text-align: center;
            color: white;
            animation: fadeIn 0.3s ease-in-out;
        }

        .modal-content h2 {
            color: #ff9900;
            margin-bottom: 15px;
        }

        .modal-content input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            background: #2c2c2c;
            color: white;
        }

        .modal-content button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
        }

        .proceed-btn {
            background-color: #ff9900;
            color: white;
        }

        .proceed-btn:hover {
            background-color: #e68a00;
        }

        .close-btn {
            background: #ff3333;
            color: white;
        }

        .close-btn:hover {
            background: #cc0000;
        }

        /* Fade-in animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
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

<!-- Order Container -->
<div class="order-container">
    <h2 class="order-title">Order Summary</h2>
    <form id="orderForm">
        <div class="order-items">
            <div class="order-item">
                <span>Smartphone</span>
                <span>Rs. 50000.0 x 1</span>
            </div>
            <div class="order-item">
                <span>Volleyball</span>
                <span>Rs 2500 x 2</span>
            </div>
        </div>
        <div class="order-total">
            <span>Total:</span>
            <strong>Rs 55000.0</strong>
        </div>
        <div class="text-end mt-3">
            <button type="button" class="btn btn-primary" onclick="openPaymentPopup()">Place Order</button>
        </div>
    </form>
</div>

<!-- Payment Popup Modal -->
<div class="modal-overlay" id="paymentModal">
    <div class="modal-content">
        <h2>Payment Details</h2>
        <input type="text" id="cardNumber" placeholder="Card Number" maxlength="16">
        <input type="text" id="expiryDate" placeholder="MM/YY">
        <input type="text" id="cvv" placeholder="CVV" maxlength="3">
        <button class="proceed-btn" onclick="processPayment()">Proceed</button>
        <button class="close-btn" onclick="closePaymentPopup()">Cancel</button>
    </div>
</div>

<script>
    function openPaymentPopup() {
        document.getElementById("paymentModal").style.display = "flex";
    }

    function closePaymentPopup() {
        document.getElementById("paymentModal").style.display = "none";
    }

    function processPayment() {
        let cardNumber = document.getElementById("cardNumber").value;
        let expiryDate = document.getElementById("expiryDate").value;
        let cvv = document.getElementById("cvv").value;

        if (cardNumber.length !== 16 || expiryDate.length !== 5 || cvv.length !== 3) {
            alert("Invalid payment details! Please check and try again.");
            return;
        }

        closePaymentPopup();
        setTimeout(() => {
            alert("Order successfully placed!");
        }, 500);
    }
</script>

</body>
</html>