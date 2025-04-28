<%-- 
    Document   : welcome
    Created on : Apr 29, 2025, 12:58:03 AM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
</head>
<body>
    <%
        HttpSession sessionUser = request.getSession(false);
        if (sessionUser == null || sessionUser.getAttribute("customerName") == null) {
            // Not logged in, redirect to sign in
            response.sendRedirect(request.getContextPath() + "/html/USER/signInSignUp/signIn.jsp");
            return;
        }
        
        String customerName = (String) sessionUser.getAttribute("customerName");
    %>

    <h1>Welcome, <%= customerName %>!</h1>

    <br>
    <a href="<%=request.getContextPath()%>/html/USER/product/productCart.jsp">Continue Shopping</a> |
    <a href="<%=request.getContextPath()%>/html/USER/signInSignUp/logout.jsp">Logout</a>


</body>
</html>

