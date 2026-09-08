<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Online Shopping - Place Order</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6f8;
        }

        .header {
            background: #2874f0;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            width: 500px;
            max-width: 95%;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h2 {
            margin-top: 0;
            text-align: center;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input,
        textarea {
            width: 100%;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }

        textarea {
            resize: vertical;
        }

        .btn {
            width: 100%;
            margin-top: 25px;
            padding: 13px;
            border: none;
            border-radius: 5px;
            background: #2874f0;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background: #125bd1;
        }

        .view-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #2874f0;
        }

        .error {
            background: #ffe5e5;
            color: #c00;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
        }

    </style>

</head>

<body>

<div class="header">
    <h1>Online Shopping</h1>
</div>

<div class="container">

    <h2>Place Your Order</h2>

    <% 
        String errorMessage =
            (String) request.getAttribute("errorMessage");

        if (errorMessage != null) {
    %>

        <div class="error">
            <%= errorMessage %>
        </div>

    <%
        }
    %>

    <form
        action="AddOrderServlet"
        method="post"
    >

        <label>Customer Name</label>

        <input
            type="text"
            name="customerName"
            placeholder="Enter your name"
            required
        />


        <label>Product Name</label>

        <input
            type="text"
            name="productName"
            placeholder="Enter product name"
            required
        />


        <label>Quantity</label>

        <input
            type="number"
            name="quantity"
            min="1"
            value="1"
            required
        />


        <label>Price Per Unit</label>

        <input
            type="number"
            name="price"
            step="0.01"
            min="0"
            placeholder="Enter price"
            required
        />


        <label>Order Date</label>

        <input
            type="date"
            name="orderDate"
            required
        />


        <label>Delivery Address</label>

        <textarea
            name="address"
            rows="4"
            placeholder="Enter delivery address"
        ></textarea>


        <button
            type="submit"
            class="btn"
        >
            Place Order
        </button>

    </form>

    <a
        class="view-link"
        href="viewOrders.jsp"
    >
        View All Orders
    </a>

</div>

</body>

</html>