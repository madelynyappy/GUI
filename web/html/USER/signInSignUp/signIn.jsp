<%-- 
    Document   : signIn
    Created on : Apr 28, 2025, 11:56:58 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign In</title>
</head>
<body>
    <h1>Sign In to Your Account</h1>

    <form action="<%=request.getContextPath()%>/CustomerLoginServlet" method="post">
        <label>Username:</label><br>
        <input type="text" name="customerUserName" required><br><br>

        <label>Password:</label><br>
        <input type="password" name="customerPassword" required><br><br>

        <button type="submit">Sign In</button>
    </form>

    <br>
    <a href="<%=request.getContextPath()%>/html/USER/signInSignUp/signUp.jsp">Don't have an account? Sign Up</a>
</body>
</html>
