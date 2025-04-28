<%-- 
    Document   : product
    Created on : Apr 16, 2025, 11:39:34 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.*" %>
<%@ page import="java.sql.*" %>
<%
    List<Category> categoryList = new ArrayList<>();
    try {
        Connection conn = DBConnector.getConnection();
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Category");
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Category c = new Category();
            c.setCategoryID(rs.getString("CategoryID"));
            c.setCategoryName(rs.getString("CategoryName"));
            categoryList.add(c);
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
    <title>Add New Product</title>
</head>
<body>
    <h1>Add New Product</h1>

    <form action="${pageContext.request.contextPath}/AddProductServlet" method="post" enctype="multipart/form-data">
        Product Name: <input type="text" name="productName" required><br><br>
        
        Product Description: <input type="text" name="productDescription" required><br><br>
        
        Product Price: <input type="number" name="productPrice" step="0.01" required><br><br>
        
        Category:
        <select name="categoryID" required>
            <option value="">--Select Category--</option>
            <% for (Category c : categoryList) { %>
                <option value="<%= c.getCategoryID() %>"><%= c.getCategoryName() %></option>
            <% } %>
        </select><br><br>
        
        Product Image: <input type="file" name="productImage" accept="image/png, image/jpeg" required><br><br>
        
        <input type="submit" value="Add Product">
    </form>
</body>
</html>

