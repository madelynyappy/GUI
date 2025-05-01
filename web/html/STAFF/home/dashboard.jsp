<%-- 
    Document   : dashboard
    Created on : May 1, 2025, 7:23:07 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitHub | Staff Dashboard</title>
</head>
<body>

    <%-- Include the sidebar --%>
    <jsp:include page="staffSidebar.jsp" />

    <%-- Main content next to sidebar --%>
    <div style="margin-left: 250px; padding: 20px; font-family: 'Segoe UI', sans-serif;">
        <h1>Welcome, <%= session.getAttribute("staffName") != null ? session.getAttribute("staffName") : "Staff" %>!</h1>
        <p>Use the sidebar to manage products, view customers, and handle orders.</p>
    </div>

</body>
</html>
