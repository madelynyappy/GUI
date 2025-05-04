<%-- 
    Document   : search
    Created on : Apr 17, 2025, 1:20:00 AM
    Author     : Madelyn Yap
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.*, java.sql.*" %>
<%
    String keyword = request.getParameter("keyword");
    List<Product> resultList = new ArrayList<>();

    if (keyword != null && !keyword.trim().isEmpty()) {
        keyword = keyword.toLowerCase(); // ignore case

        try {
            Connection conn = DBConnector.getConnection();
            ProductDAO productDAO = new ProductDAO(conn);
            List<Product> allProducts = productDAO.getAllProducts();

            for (Product p : allProducts) {
                String id = p.getProductID().toLowerCase();
                String name = p.getProductName().toLowerCase();
                if (id.contains(keyword) || name.contains(keyword)) {
                    resultList.add(p);
                }
            }

            conn.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8">
    <title>FitHub | Search Product</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css">
</head>
<body>
    <jsp:include page="../home/header.jsp" />
<h1>Search Product</h1>
<!-- comment
<form method="get" action="search.jsp">
    <input type="text" name="keyword" placeholder="Search by Product ID or Name" value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
    <button type="submit">Search</button>
</form>-->

<% if (!resultList.isEmpty()) { %>
    <table border="1" cellpadding="8">
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Description</th>
            <th>Price (MYR)</th>
            <th>Category</th>
        </tr>
        <% for (Product p : resultList) { %>
        <tr>
            <td><%= p.getProductID() %></td>
            <td><%= p.getProductName() %></td>
            <td><%= p.getProductDescription() %></td>
            <td><%= String.format("%.2f", p.getProductPrice()) %></td>
            <td><%= p.getCategoryID() %></td>
        </tr>
        <% } %>
    </table>
<% } else if (keyword != null) { %>
    <p>No results found for "<%= keyword %>"</p>
<% } %>
<jsp:include page="../home/footer.jsp" />
</body>
</html>
