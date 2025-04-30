<%-- 
    Document   : orderHistory
    Created on : Apr 29, 2025, 5:03:46 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
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
        .order-header {
            background-color: #e0e0e0;
            padding: 10px;
            font-weight: bold;
            border-radius: 5px;
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
        .total-line {
            text-align: right;
            margin-top: 10px;
            font-weight: bold;
        }
        
        .status-packaging { color: #30588C; }
.status-shipping { color: #6093BF; }
.status-delivered { color: #254559; }

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
%>
    <div style="margin-bottom: 40px; border: 1px solid #ccc; padding: 15px;">
        <strong>Order ID:</strong> <%= orderID %> |
        <strong>Date:</strong> <%= orderData.get("orderDate") %> |
        <strong>Payment:</strong> <%= orderData.get("paymentMethod") %> |
        <strong>Discount:</strong> MYR <%= orderData.get("discount") %><br/>
        <strong>Total:</strong> MYR <%= orderData.get("totalAmount") %>

        <table border="1" style="width: 100%; margin-top: 10px;">
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
            
            <!-- check order status  -->
             <c:forEach var="order" items="${orderList}">
        <tr>
            <td>${order.orderID}</td>
            <td>${order.date}</td>
            <td>RM ${order.total}</td>
            <td><span class="status">${order.status}</span></td>
        </tr>
    </c:forEach>
            
        </table>
    </div>
<% } %>


<br>
<a href="<%=request.getContextPath()%>/html/USER/home/home.jsp">Back to Home</a>

</body>
</html>
