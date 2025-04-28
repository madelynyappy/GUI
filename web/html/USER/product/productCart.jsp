<%-- 
    Document   : productCart
    Created on : Apr 28, 2025, 7:46:54 PM
    Author     : Madelyn Yap
--%>

<%@page import="java.util.*, model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>

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
    <title>Our Products</title>
</head>
<body>
    <h1>Shop Now!</h1>
    <table border="1" cellpadding="8">
        <tr>
            <th>ProductName</th>
            <th>Price (MYR)</th>
            <th>Action</th>
        </tr>
        <%
            for (Product p : productList) {
        %>
        <tr>
            <td><%= p.getProductName() %></td>
            <td><%= String.format("%.2f", p.getProductPrice()) %></td>
            <td>
                <a href="<%=request.getContextPath()%>/AddToCartServlet?productID=<%=p.getProductID()%>">Add to Cart</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    
    <br><br>
<a href="<%=request.getContextPath()%>/html/USER/product/cart.jsp">
    View My Cart
</a>

</body>
</html>

