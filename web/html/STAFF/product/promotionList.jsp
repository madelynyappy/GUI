<%-- 
    Document   : promotionList 
    Created on : May 1, 2025, 2:19:53 AM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.*, java.sql.*" %>
<%
    List<Product> promotedProducts = new ArrayList<>();
    try {
        Connection conn = DBConnector.getConnection();
        ProductDAO productDAO = new ProductDAO(conn);
        for (Product p : productDAO.getAllProducts()) {
            if (p.isPromotionEnabled()) {
                promotedProducts.add(p);
            }
        }
        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitHub | Promotion List</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/staffIcon.jpg">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            background-color: #FDFDFD;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
        }

        h1 {
            color: #30588C;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #C4C3D0;
        }

        th {
            background-color: #30588C;
            color: white;
            padding: 10px;
        }

        td {
            background-color: #FDFDFD;
            padding: 10px;
            border-bottom: 1px solid #6093BF;
            text-align: center;
        }

        tr:hover {
            background-color: #E0E7F1;
        }
    </style>
</head>
<body>

<jsp:include page="../home/staffSidebar.jsp" />

<div class="content">
    <h1>Promotion List</h1>
    <table>
        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Discount (%)</th>
            <th>Category</th>
            <th>Description</th>
        </tr>
        <% for (Product p : promotedProducts) { %>
        <tr>
            <td><%= p.getProductID() %></td>
            <td><%= p.getProductName() %></td>
            <td><%= p.getDiscount() %>%</td>
            <td><%= p.getCategoryID() %></td>
            <td><%= p.getProductDescription() %></td>
        </tr>
        <% } %>
    </table>
</div>

</body>
</html>
