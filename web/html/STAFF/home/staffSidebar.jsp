<%-- 
    Document   : staffSidebar
    Created on : May 1, 2025, 7:12:30 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitHub | Staff Panel</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/staffIcon.jpg">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            background-color: #254559;
            color: white;
            padding-top: 20px;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #fdfdfd; 
        }

        .sidebar a {
            display: block;
            padding: 12px 25px;
            text-decoration: none;
            color: #fdfdfd;
            transition: background 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #30588C; 
        }

        .logout-btn {
            position: absolute;
            bottom: 20px;
            width: 100%;
            text-align: center;
        }

        .logout-btn a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #6093BF; 
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s ease;
        }

        .logout-btn a:hover {
            background-color: #30588C;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <h2>Staff Panel</h2>
    <a href="${pageContext.request.contextPath}/CustomerListServlet">Customer Records</a>
    <a href="${pageContext.request.contextPath}/productadd.jsp">Add Products</a>
    <a href="${pageContext.request.contextPath}/html/STAFF/product/productListTest.jsp">Manage Products</a>
    <a href="${pageContext.request.contextPath}/OrderStatusServlet">Update Order Status</a>
    <a href="${pageContext.request.contextPath}/html/STAFF/product/promotionModify.jsp">Manage Promotion</a>

    <div class="logout-btn">
        <a href="${pageContext.request.contextPath}/html/STAFF/signInSignUp/staffLogout.jsp">Logout</a>
    </div>
</div>

</body>
</html>
