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
     <title>FitHub | Add Product</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/staffIcon.jpg">

    <style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #FDFDFD;
        margin: 0;
        padding: 40px;
    }

    h1 {
        text-align: center;
        color: #30588C;
        margin-bottom: 30px;
    }

    form {
        max-width: 600px;
        margin: 0 auto;
        padding: 30px;
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.05);
    }

    label, input, select {
        display: block;
        width: 100%;
        margin-top: 10px;
        font-size: 16px;
    }

    input[type="text"],
    input[type="number"],
    select {
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 6px;
    }

    input[type="file"] {
        margin-top: 5px;
        padding: 6px;
        background-color: #f8f8f8;
        border-radius: 6px;
        border: 1px solid #ccc;
    }

    input[type="submit"] {
        margin-top: 25px;
        background-color: #30588C;
        color: white;
        padding: 12px;
        border: none;
        border-radius: 6px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #254559;
    }
</style>

    
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

