<%-- 
    Document   : orderHistory
    Created on : Apr 29, 2025, 5:03:46 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<html>
<head>
    <title>Order History</title>
</head>
<body>
    <h1>Your Order History</h1>

    <%
        List<Map<String, Object>> orders = (List<Map<String, Object>>) request.getAttribute("orderList");
        if (orders == null || orders.isEmpty()) {
    %>
        <p>You haven't placed any orders yet.</p>
    <% } else { 
        String lastOrderID = "";
    %>
        <table border="1" cellpadding="8">
            <tr>
                <th>Order ID</th>
                <th>Date</th>
                <th>Payment</th>
                <th>Discount</th>
                <th>Product ID</th>
                <th>Qty</th>
                <th>Price</th>
            </tr>
            <% for (Map<String, Object> order : orders) {
                String orderID = (String) order.get("orderID");
                if (!orderID.equals(lastOrderID)) {
            %>
                <tr style="background-color: #f0f0f0;">
                    <td><%= orderID %></td>
                    <td><%= order.get("orderDate") %></td>
                    <td><%= order.get("paymentMethod") %></td>
                    <td>MYR <%= String.format("%.2f", order.get("discount")) %></td>
                    <td colspan="3"></td>
                </tr>
            <% 
                lastOrderID = orderID;
                }
            %>
            <tr>
                <td></td><td></td><td></td><td></td>
                <td><%= order.get("productID") %></td>
                <td><%= order.get("quantity") %></td>
                <td>MYR <%= String.format("%.2f", order.get("price")) %></td>
            </tr>
            <% } %>
        </table>
    <% } %>

    <br>
    <a href="<%=request.getContextPath()%>/html/USER/home/home.jsp">Back to Home</a>
</body>
</html>

