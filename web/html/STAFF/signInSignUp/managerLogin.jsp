<%-- 
    Document   : managerLogin
    Created on : Apr 30, 2025, 5:49:49 PM
    Author     : Madelyn Yap
--%>


<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>FitHub | Manager Login</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
    </head>
    <body>
        <h2>Manager Login</h2>

        <form action="${pageContext.request.contextPath}/ManagerLoginServlet" method="POST">
            <label for="managerUserName">Username:</label>
            <input type="text" id="managerUserName" name="managerUserName" required><br><br>

            <label for="managerPassword">Password:</label>
            <input type="password" id="managerPassword" name="managerPassword" required><br><br>

            <button type="submit">Login</button>

            <c:if test="${not empty param.error and param.error == '1'}">
                <p style="color: red;">Invalid username or password. Please try again.</p>
            </c:if>
        </form>
    </body>
</html>
