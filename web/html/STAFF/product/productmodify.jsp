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
    <title>Modify Product</title>
</head>
<body>
    <h1>Modify Product</h1>
    <form action="<%=request.getContextPath()%>/ModifyProductServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="productID" value="<%= p.getProductID() %>">
        
        Product Name: <input type="text" name="productName" value="<%= p.getProductName() %>"><br><br>
        Description: <input type="text" name="productDescription" value="<%= p.getProductDescription() %>"><br><br>
        Price: <input type="number" name="productPrice" value="<%= p.getProductPrice() %>" step="0.01"><br><br>
        Category ID: <input type="text" name="categoryID" value="<%= p.getCategoryID() %>"><br><br>
        
        (Optional) New Image Upload: <input type="file" name="productImage"><br><br>

        <input type="submit" value="Update Product">
    </form>
</body>
</html>
