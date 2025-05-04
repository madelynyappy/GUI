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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css">
     <title>FitHub | Checkout Cart</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
   
</head>
<body>
<jsp:include page="../home/header.jsp" />
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
<jsp:include page="../home/footer.jsp" />
</body>
</html>
