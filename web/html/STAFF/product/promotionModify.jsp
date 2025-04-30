<%-- 
    Document   : promotionModify
    Created on : May 1, 2025, 2:40:31 AM
    Author     : Madelyn Yap
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.*, java.sql.*" %>
<%
    List<Product> productList = new ArrayList<>();
    try {
        Connection conn = DBConnector.getConnection();
        ProductDAO productDAO = new ProductDAO(conn);
        productList = productDAO.getAllProducts();
        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Promotion Discount Editor</title>
</head>
<body>
    <h1>Manage Promotions</h1>
    <form action="<%=request.getContextPath()%>/UpdatePromotionServlet" method="post">
    <table border="1" cellpadding="8">
        <tr>
            <th>Select</th>
            <th>Product ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Original Price (MYR)</th>
            <th>Category</th>
            <th>Discount (%)</th>
        </tr>
        <% for (Product p : productList) { %>
            <tr>
                <td><input type="checkbox" name="selectedProducts" value="<%= p.getProductID() %>"></td>
                <td><%= p.getProductID() %></td>
                <td><%= p.getProductName() %></td>
                <td><%= p.getProductDescription() %></td>
                <td><%= String.format("%.2f", p.getProductPrice()) %></td>
                <td><%= p.getCategoryID() %></td>
                <td>
                    <select name="discount_<%= p.getProductID() %>">
                        <option value="0">None</option>
                        <% for (int i = 10; i <= 90; i += 10) { %>
                            <option value="<%= i %>"><%= i %>%</option>
                        <% } %>
                    </select>
                </td>
            </tr>
        <% } %>
    </table>
    <br>
    <button type="submit">Update Discounts</button>
    </form>
</body>
</html>

