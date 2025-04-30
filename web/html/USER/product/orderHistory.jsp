<%-- 
    Document   : orderHistory
    Created on : Apr 29, 2025, 5:03:46 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order History</title>
    <style>
        .order-box {
            border: 1px solid #cccccc;
            padding: 20px;
            margin-bottom: 30px;
            background-color: #f9f9f9;
            border-radius: 8px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            border: 1px solid #cccccc;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f0f0f0;
        }
        .bar-container {
            display: flex;
            justify-content: space-between;
            max-width: 400px;
            margin-top: 5px;
        }
        .status-step {
            flex: 1;
            text-align: center;
            font-weight: bold;
        }
        .bar-fill {
            height: 8px;
            border-radius: 6px;
            margin-top: 4px;
            width: 100%;
            background: #ccc;
        }
    </style>
</head>
<body>

<h1>Your Order History - <%= request.getAttribute("customerName") %></h1>

<%
    Map<String, Map<String, Object>> orders = (Map<String, Map<String, Object>>) request.getAttribute("orders");
    for (Map.Entry<String, Map<String, Object>> entry : orders.entrySet()) {
        String orderID = entry.getKey();
        Map<String, Object> orderData = entry.getValue();
        List<Map<String, Object>> items = (List<Map<String, Object>>) orderData.get("items");
        String status = (String) orderData.get("orderStatus");
        if (status == null) status = "";
%>
    <div class="order-box">
        <strong>Order ID:</strong> <%= orderID %> |
        <strong>Date:</strong> <%= orderData.get("orderDate") %> |
        <strong>Payment:</strong> <%= orderData.get("paymentMethod") %> |
        <strong>Discount:</strong> MYR <%= orderData.get("discount") %><br/>
        <strong>Total:</strong> MYR <%= orderData.get("totalAmount") %><br/>
        <strong>Status:</strong> <%= (!status.isEmpty()) ? status : "Not yet assigned" %>

        <!-- VISUAL STATUS BAR -->
<div class="bar-container">
    <div class="status-step" style="color:<%= "Packaging".equals(status) ? "#E53935" : "#ccc" %>;">Packaging</div>
    <div class="status-step" style="color:<%= "Shipping".equals(status) ? "#FB8C00" : "#ccc" %>;">Shipping</div>
    <div class="status-step" style="color:<%= "Delivered".equals(status) ? "#43A047" : "#ccc" %>;">Delivered</div>
</div>
<div class="bar-fill" style="background: linear-gradient(to right,
    <%= "Packaging".equals(status) ? "#E53935" : "#ccc" %> 33%,
    <%= "Shipping".equals(status) ? "#FB8C00" : "#ccc" %> 66%,
    <%= "Delivered".equals(status) ? "#43A047" : "#ccc" %> 100%);">
</div>


        <table>
            <tr>
                <th>Product ID</th>
                <th>Quantity</th>
                <th>Unit Price (MYR)</th>
                <th>Subtotal (MYR)</th>
            </tr>
            <%
                for (Map<String, Object> item : items) {
                    double price = (Double) item.get("price");
                    int qty = (Integer) item.get("quantity");
                    double subtotal = price * qty;
            %>
                <tr>
                    <td><%= item.get("productID") %></td>
                    <td><%= qty %></td>
                    <td><%= String.format("%.2f", price) %></td>
                    <td><%= String.format("%.2f", subtotal) %></td>
                </tr>
            <% } %>
        </table>
    </div>
<% } %>

<br>
<a href="<%=request.getContextPath()%>/html/USER/home/home.jsp">Back to Home</a>

</body>
</html>
