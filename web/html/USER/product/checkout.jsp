<%-- 
    Document   : checkout // payment 
    Created on : Apr 28, 2025, 10:59:29 PM
    Author     : Madelyn Yap
--%>

<%@page import="java.util.*, model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
</head>
<body>
    <h1>Checkout</h1>

    <% if (cart == null || cart.isEmpty()) { %>
        <p>Your cart is empty.</p>
        <a href="<%=request.getContextPath()%>/html/USER/product/productCart.jsp">Continue Shopping</a>
    <% } else { %>
        <h2>Order Summary</h2>
        <table border="1" cellpadding="8">
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Subtotal (MYR)</th>
            </tr>
            <%
                double grandTotal = 0.0;
                for (CartItem item : cart) {
                    double subtotal = item.getProduct().getProductPrice() * item.getQuantity();
                    grandTotal += subtotal;
            %>
            <tr>
                <td><%= item.getProduct().getProductName() %></td>
                <td><%= item.getQuantity() %></td>
                <td><%= String.format("%.2f", subtotal) %></td>
            </tr>
            <% } %>
        </table>

        <h3>Summary</h3>
        <p>Subtotal: <strong>MYR <%= String.format("%.2f", grandTotal) %></strong></p>
        <p>Shipping Fee (Fixed): <strong>MYR 10.00</strong></p>
        <p>Sales Tax (6%): <strong>MYR <%= String.format("%.2f", grandTotal * 0.06) %></strong></p>

        <h2>Total Payment:</h2>
        <h3><%= String.format("%.2f", grandTotal + 10 + (grandTotal * 0.06)) %> MYR</h3>

        <h2>Shipping & Payment Details</h2>
        <form action="<%=request.getContextPath()%>/CheckoutServlet" method="POST">
            <label>Full Name:</label><br>
            <input type="text" name="fullName" required><br><br>

            <label>Phone Number:</label><br>
            <input type="text" name="phoneNumber" required><br><br>

            <label>Address:</label><br>
            <textarea name="address" rows="4" cols="50" required></textarea><br><br>

            <label>Payment Method:</label><br>
            <select name="paymentMethod" required>
                <option value="Cash on Delivery">Cash on Delivery</option>
                <option value="Credit Card">Credit Card</option>
                <option value="Debit Card">Debit Card</option>
                <option value="E-Wallet">E-Wallet</option>
            </select><br><br>

            <button type="submit">Place Order</button>
        </form>
    <% } %>

</body>
</html>
