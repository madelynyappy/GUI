<%-- 
    Document   : productListTest
    Created on : Apr 28, 2025, 5:05:48 PM
    Author     : Madelyn Yap
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.*" %>
<%@ page import="java.sql.*" %>

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
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productList.css">
    <title>Product List Test</title>
</head>
<body>
    <h1>Product List</h1>
    <table border="1" cellpadding="8">
        <tr>
            <th>Product ID</th>
             <th>Product Image</th>
            <th>Product Name</th>
            <th>Description</th>
            <th>Price (MYR)</th>
            <th>Category ID</th>
             <th>Action</th>
        </tr>
        <%
            for (Product p : productList) {
        %>
        <tr>
            <td><%= p.getProductID() %></td>
            <td>
                <% if (p.getProductImageList() == null || p.getProductImageList().isEmpty()) { %>
                    <img src="<%=request.getContextPath()%>/images/noImage.png" alt="No product image available" style="width:100px; height:auto;">
                <% } else { %>
                    <% for (ProductImage pi : p.getProductImageList()) { %>
                        <img src="<%=request.getContextPath()%>/<%= pi.getPath() %>" alt="<%= pi.getDescription() %>" style="width:100px; height:auto;">
                    <% } %>
                <% } %>
            </td>
            <td><%= p.getProductName() %></td>
            <td><%= p.getProductDescription() %></td>
            <td><%= String.format("%.2f", p.getProductPrice()) %></td>
            <td><%= p.getCategoryID() %></td>
             <td>
        <a href="<%=request.getContextPath()%>/EditProductServlet?productID=<%=p.getProductID()%>">Edit</a>
    <a href="<%=request.getContextPath()%>/DeleteProductServlet?productID=<%=p.getProductID()%>" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>

             </td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>