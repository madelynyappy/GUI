<%-- 
    Document   : managerSidebar
    Created on : May 1, 2025, 9:11:04 PM
    Author     : Madelyn Yap
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
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
            color: #fdfdfd;
            margin-bottom: 30px;
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
    <h2>Manager Panel</h2>
    <a href="${pageContext.request.contextPath}/CustomerListServlet">View Customers</a>
    <a href="${pageContext.request.contextPath}/html/STAFF/product/productListTest.jsp">Manage Products</a>
    <a href="${pageContext.request.contextPath}/html/STAFF/report/report.jsp">View Sales Reports</a>
    <a href="${pageContext.request.contextPath}/StaffListServlet">Manage Staff</a>

    <div class="logout-btn">
        <a href="${pageContext.request.contextPath}/html/STAFF/signInSignUp/managerLogout.jsp">Logout</a>
    </div>
</div>

</body>
</html>

