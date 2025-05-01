<%-- 
    Document   : login
    Created on : Apr 30, 2025, 4:45:59 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FitHub | Staff Login</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
    </head>
    <body>
        <h2>Staff Login</h2>

        <form action="${pageContext.request.contextPath}/StaffLoginServlet" method="POST">
            <label for="staffUserName">Username:</label>
            <input type="text" id="staffUserName" name="staffUserName" required><br><br>

            <label for="staffPassword">Password:</label>
            <input type="password" id="staffPassword" name="staffPassword" required><br><br>

            <button type="submit">Login</button>

            <c:if test="${param.error == '1'}">
                <p style="color: red;">Invalid username or password. Please try again.</p>
            </c:if>
        </form>

        <p>Don't have an account?
            <a href="${pageContext.request.contextPath}/html/STAFF/signInSignUp/staffRegister.jsp">Register here</a>
        </p>
    </body>
</html>
