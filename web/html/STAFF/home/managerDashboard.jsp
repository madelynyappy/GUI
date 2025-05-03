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
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/staffIcon.jpg">
    <style>
        .content {
            margin-left: 250px;
            padding: 20px;
            font-family: 'Segoe UI', sans-serif;
        }

        h2 {
            color: #30588C;
        }
    </style>
</head>
<body>

    <%-- Include sidebar --%>
    <jsp:include page="managerSidebar.jsp" />

    <div class="content">
        <h2>Welcome, <%= managerName %>!</h2>
        <p>Use the sidebar to manage customers, staff, products, and reports.</p>
    </div>

</body>
</html>
