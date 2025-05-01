<%-- 
    Document   : dashboard
    Created on : May 1, 2025, 11:20:50 AM
    Author     : Madelyn Yap
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String managerName = (String) session.getAttribute("managerName");
    if (managerName == null) {
        response.sendRedirect(request.getContextPath() + "/html/STAFF/signInSignUp/managerLogin.jsp?error=1");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitHub | Manager Dashboard</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
</head>
<body>
    <h2>Welcome, <%= managerName %>!</h2>
    
    <ul>
        <li><a href="${pageContext.request.contextPath}/html/STAFF/customer/customerList.jsp">View Customers</a></li>
        <li><a href="${pageContext.request.contextPath}/html/STAFF/product/productListTest.jsp">Manage Products</a></li>
        <li><a href="${pageContext.request.contextPath}/html/STAFF/report/report.jsp">View Sales Reports</a></li>
        <li><a href="${pageContext.request.contextPath}/html/STAFF/home/staffList.jsp">Manage Staff</a></li>
        <li><a href="${pageContext.request.contextPath}/html/STAFF/signInSignUp/managerLogout.jsp">Logout</a></li>
    </ul>
</body>
</html>
