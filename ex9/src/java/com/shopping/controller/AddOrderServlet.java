package com.shopping.controller;

import com.shopping.dao.OrderDAO;
import com.shopping.model.Order;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
    name = "AddOrderServlet",
    urlPatterns = {"/AddOrderServlet"}
)
public class AddOrderServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String customerName =
                request.getParameter("customerName");

            String productName =
                request.getParameter("productName");

            int quantity =
                Integer.parseInt(
                    request.getParameter("quantity")
                );

            BigDecimal price =
                new BigDecimal(
                    request.getParameter("price")
                );

            Date orderDate =
                Date.valueOf(
                    request.getParameter("orderDate")
                );

            String address =
                request.getParameter("address");

            // Calculate total
            BigDecimal totalAmount =
                price.multiply(
                    BigDecimal.valueOf(quantity)
                );

            Order order =
                new Order(
                    customerName,
                    productName,
                    quantity,
                    price,
                    totalAmount,
                    orderDate,
                    address
                );

            OrderDAO dao = new OrderDAO();

            boolean success =
                dao.addOrder(order);

            if (success) {

                response.sendRedirect(
                    "viewOrders.jsp"
                );

            } else {

                request.setAttribute(
                    "errorMessage",
                    "Failed to place the order."
                );

                request.getRequestDispatcher(
                    "orderForm.jsp"
                ).forward(
                    request,
                    response
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                "errorMessage",
                "Invalid order details."
            );

            request.getRequestDispatcher(
                "orderForm.jsp"
            ).forward(
                request,
                response
            );
        }
    }
}