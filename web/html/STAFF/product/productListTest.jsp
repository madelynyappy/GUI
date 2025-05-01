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
    <title>FitHub | Product List</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #FDFDFD;
            margin: 0;
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

        img {
            width: 100px;
            height: auto;
            margin: 5px;
        }

        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            text-decoration: none;
            color: white;
        }

        .btn-edit {
            background-color: #4CAF50;
        }

        .btn-edit:hover {
            background-color: #45a049;
        }

        .btn-delete {
            background-color: #D9534F;
        }

        .btn-delete:hover {
            background-color: #c9302c;
        }
        
        .btn {
    padding: 6px 12px;
    border: none;
    border-radius: 4px;
    font-weight: bold;
    text-decoration: none;
    color: white;
    display: inline-block;
    margin: 2px 6px;
}

    </style>
</head>
<body>

    <%-- Sidebar --%>
    <jsp:include page="../home/staffSidebar.jsp" />

    <div class="content">
        <h1>Product List</h1>
        <table>
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
                        <img src="<%=request.getContextPath()%>/images/noImage.png" alt="No product image available">
                    <% } else { %>
                        <% for (ProductImage pi : p.getProductImageList()) { %>
                            <img src="<%=request.getContextPath()%>/<%= pi.getPath() %>" alt="<%= pi.getDescription() %>">
                        <% } %>
                    <% } %>
                </td>
                <td><%= p.getProductName() %></td>
                <td><%= p.getProductDescription() %></td>
                <td><%= String.format("%.2f", p.getProductPrice()) %></td>
                <td><%= p.getCategoryID() %></td>
                <td>
                    <a class="btn btn-edit" href="<%=request.getContextPath()%>/EditProductServlet?productID=<%=p.getProductID()%>">Edit</a>
                    <a class="btn btn-delete" href="<%=request.getContextPath()%>/DeleteProductServlet?productID=<%=p.getProductID()%>" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </div>

</body>
</html>
