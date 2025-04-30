<%-- 
    Document   : managerLogin
    Created on : Apr 30, 2025, 5:49:49 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Login</title>
    </head>
    <body>
    <h2>Manager Login</h2>
    <form action="${pageContext.request.contextPath}/ManagerLoginServlet" method="POST">
        <label for="managerUserName">Username:</label>
        <input type="text" id="managerUserName" name="managerUserName" required><br><br>

        <label for="managerPassword">Password:</label>
        <input type="password" id="managerPassword" name="managerPassword" required><br><br>

        <button type="submit">Login</button>

        <c:if test="${param.error == '1'}">
            <p style="color: red;">Invalid username or password. Please try again.</p>
        </c:if>
    </form>

    </body>
</html>
