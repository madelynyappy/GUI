<%-- 
    Document   : promotionList 
    Created on : May 1, 2025, 2:19:53 AM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.*, java.sql.*" %>
<%
    List<Product> promoList = new ArrayList<>();
    try {
        Connection conn = DBConnector.getConnection();
        ProductDAO dao = new ProductDAO(conn);
        promoList = dao.getDiscountedProducts(); // you must implement this method
        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff - Discounted Products</title>
</head>
<body>
<h1>Discounted Products (Staff View)</h1>
<table border="1" cellpadding="8">
    <tr>
        <th>Product ID</th>
        <th>Name</th>
        <th>Original Price (MYR)</th>
        <th>Discount (%)</th>
        <th>Discounted Price (MYR)</th>
    </tr>
    <% for (Product p : promoList) {
        double discount = p.getDiscount();
        double price = p.getProductPrice();
        double finalPrice = price - (price * discount / 100);
    %>
    <tr>
        <td><%= p.getProductID() %></td>
        <td><%= p.getProductName() %></td>
        <td><%= String.format("%.2f", price) %></td>
        <td><%= (int)discount %>%</td>
        <td><%= String.format("%.2f", finalPrice) %></td>
    </tr>
    <% } %>
</table>
</body>
</html>
