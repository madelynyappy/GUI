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
    <title>FitHub | Manage Promotions</title>
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

        form.filter-form {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        input[type="text"], select {
            padding: 6px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            text-decoration: none;
            color: white;
            cursor: pointer;
        }

        .btn-search {
            background-color: #30588C;
        }

        .btn-navigate {
            background-color: #254559;
        }

        .btn:hover {
            opacity: 0.9;
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

        .enable-checkbox {
            width: 20px;
            height: 20px;
        }

        .discount-select {
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        tr:hover {
            background-color: #E0E7F1;
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
                if (response.status === 200) {
                    window.location.reload();
                } else {
                    throw new Error('Server returned status: ' + response.status);
                }
            }).catch(error => {
                console.error('Error:', error);
                alert('Error updating promotion. Please try again.');
            });
        }
    </script>
</head>
<body>

<jsp:include page="../home/staffSidebar.jsp" />

<div class="content">
    <h1>Manage Promotions</h1>

    <form method="get" class="filter-form">
        <input type="text" name="search" placeholder="Search by Product ID or Name"
               value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
        <select name="category">
            <option value="">All Categories</option>
            <option value="C100" <%= "C100".equals(request.getParameter("category")) ? "selected" : "" %>>Weights</option>
            <option value="C101" <%= "C101".equals(request.getParameter("category")) ? "selected" : "" %>>Yoga</option>
            <option value="C102" <%= "C102".equals(request.getParameter("category")) ? "selected" : "" %>>Cardio</option>
            <option value="C103" <%= "C103".equals(request.getParameter("category")) ? "selected" : "" %>>Accessories</option>
            <option value="C104" <%= "C104".equals(request.getParameter("category")) ? "selected" : "" %>>Recovery</option>
        </select>
        <button type="submit" class="btn btn-search">Filter</button>
        <a href="${pageContext.request.contextPath}/html/STAFF/product/promotionList.jsp" class="btn btn-navigate">Go to Promotion List</a>
    </form>

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
        <%
            String search = request.getParameter("search");
            String categoryFilter = request.getParameter("category");

            for (Product p : productList) {
                boolean match = true;

                if (search != null && !search.trim().isEmpty()) {
                    String s = search.trim().toLowerCase();
                    match &= p.getProductID().toLowerCase().contains(s) || p.getProductName().toLowerCase().contains(s);
                }

                if (categoryFilter != null && !categoryFilter.isEmpty()) {
                    match &= categoryFilter.equals(p.getCategoryID());
                }

                if (!match) continue;
        %>
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
</div>

</body>
</html>
