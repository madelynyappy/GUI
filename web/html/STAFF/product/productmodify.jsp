<%-- 
    Document   : productmodify
    Created on : Apr 28, 2025, 7:15:18 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Product"%>
<%
    Product p = (Product) request.getAttribute("product");
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
        padding: 40px;
        margin: 0;
    }

    h1 {
        text-align: center;
        color: #30588C;
        margin-bottom: 30px;
    }

    form {
        max-width: 600px;
        margin: 0 auto;
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    label {
        font-weight: bold;
        color: #254559;
        display: block;
        margin-top: 15px;
    }

    input[type="text"],
    input[type="number"],
    input[type="file"] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 16px;
    }

    input[type="submit"] {
        width: 100%;
        background-color: #30588C;
        color: white;
        padding: 12px;
        border: none;
        border-radius: 6px;
        font-weight: bold;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #254559;
    }
</style>

</head>
<body>
    <h1>Modify Product</h1>
    <form action="<%=request.getContextPath()%>/ModifyProductServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="productID" value="<%= p.getProductID() %>">
        
        Product Name: <input type="text" name="productName" value="<%= p.getProductName() %>"><br><br>
        Description: <input type="text" name="productDescription" value="<%= p.getProductDescription() %>"><br><br>
        Price: <input type="number" name="productPrice" value="<%= p.getProductPrice() %>" step="0.01"><br><br>
        Category ID: <input type="text" name="categoryID" value="<%= p.getCategoryID() %>"><br><br>
        New Image Upload: <input type="file" name="productImage"><br><br>

        <input type="submit" value="Update Product">
    </form>
</body>
</html>
