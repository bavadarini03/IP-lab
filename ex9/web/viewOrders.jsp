<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.shopping.model.Order" %>
<%@ page import="com.shopping.dao.OrderDAO" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>All Orders</title>

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
            width: 95%;
            margin: 30px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            overflow-x: auto;
        }

        .top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .btn {
            background: #2874f0;
            color: white;
            padding: 10px 18px;
            text-decoration: none;
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #2874f0;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 11px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f5f5f5;
        }

        .amount {
            font-weight: bold;
        }

    </style>

</head>

<body>

<div class="header">

    <h1>Online Shopping</h1>

</div>


<div class="container">

    <div class="top">

        <h2>All Orders</h2>

        <a
            class="btn"
            href="orderForm.jsp"
        >
            + New Order
        </a>

    </div>


    <table>

        <tr>

            <th>Order ID</th>
            <th>Customer</th>
            <th>Product</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total</th>
            <th>Date</th>
            <th>Address</th>

        </tr>


        <%

            OrderDAO dao = new OrderDAO();

            List<Order> orders =
                dao.getAllOrders();

            for (Order order : orders) {

        %>

        <tr>

            <td>
                <%= order.getOrderId() %>
            </td>

            <td>
                <%= order.getCustomerName() %>
            </td>

            <td>
                <%= order.getProductName() %>
            </td>

            <td>
                <%= order.getQuantity() %>
            </td>

            <td>
                ₹<%= order.getPrice() %>
            </td>

            <td class="amount">
                ₹<%= order.getTotalAmount() %>
            </td>

            <td>
                <%= order.getOrderDate() %>
            </td>

            <td>
                <%= order.getAddress() %>
            </td>

        </tr>

        <%

            }

        %>

    </table>

</div>

</body>

</html>