<%-- 
    Document   : promotionProduct
    Created on : May 1, 2025, 2:28:33 AM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.*, java.sql.*" %>
<%
    List<Product> promoList = new ArrayList<>();
    try {
        Connection conn = DBConnector.getConnection();
        ProductDAO dao = new ProductDAO(conn);
        promoList = dao.getDiscountedProducts();
        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Promotions | FitHub</title>
</head>
<body>
<h1>🔥 Special Promotions 🔥</h1>
<table border="1" cellpadding="8">
    <tr>
        <th>Product</th>
        <th>Original Price (MYR)</th>
        <th>Discount (%)</th>
        <th>Now Only (MYR)</th>
    </tr>
    <% for (Product p : promoList) {
        double discount = p.getDiscount();
        double price = p.getProductPrice();
        double finalPrice = price - (price * discount / 100);
    %>
    <tr>
        <td><%= p.getProductName() %></td>
        <td><%= String.format("%.2f", price) %></td>
        <td><%= (int)discount %>%</td>
        <td><b><%= String.format("%.2f", finalPrice) %></b></td>
    </tr>
    <% } %>
</table>
<a href="<%=request.getContextPath()%>/html/USER/home/home.jsp">⬅ Back to Home</a>
</body>
</html>

