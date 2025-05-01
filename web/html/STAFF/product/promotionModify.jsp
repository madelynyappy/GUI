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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .enable-checkbox {
            width: 20px;
            height: 20px;
        }
        .discount-select {
            padding: 5px;
            width: 100px;
        }
    </style>
    <script>
        function updatePromotion(productID, action, value) {
            const formData = new FormData();
            formData.append('action', action);
            formData.append('productID', productID);
            
            if (action === 'updateDiscount') {
                formData.append('discount', value);
            } else if (action === 'togglePromotion') {
                formData.append('enabled', value);
            }
            
            fetch('<%=request.getContextPath()%>/UpdatePromotionServlet', {
                method: 'POST',
                body: formData
            }).then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            }).catch(error => {
                console.error('Error:', error);
                alert('Error updating promotion. Please try again.');
            });
        }
    </script>
</head>
<body>
    <h1>Manage Promotions</h1>
    <table>
        <tr>
            <th>Enable</th>
            <th>Product ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Original Price (MYR)</th>
            <th>Category</th>
            <th>Discount (%)</th>
        </tr>
        <% for (Product p : productList) { %>
            <tr>
                <td>
                    <input type="checkbox" 
                           class="enable-checkbox" 
                           onchange="updatePromotion('<%= p.getProductID() %>', 'togglePromotion', this.checked)"
                           <%= p.isPromotionEnabled() ? "checked" : "" %>>
                </td>
                <td><%= p.getProductID() %></td>
                <td><%= p.getProductName() %></td>
                <td><%= p.getProductDescription() %></td>
                <td><%= String.format("%.2f", p.getProductPrice()) %></td>
                <td><%= p.getCategoryID() %></td>
                <td>
                    <select class="discount-select" 
                            onchange="updatePromotion('<%= p.getProductID() %>', 'updateDiscount', this.value)">
                        <option value="0" <%= p.getDiscount() == 0 ? "selected" : "" %>>None</option>
                        <% for (int i = 10; i <= 90; i += 10) { %>
                            <option value="<%= i %>" <%= p.getDiscount() == i ? "selected" : "" %>><%= i %>%</option>
                        <% } %>
                    </select>
                </td>
            </tr>
        <% } %>
    </table>
</body>
</html>