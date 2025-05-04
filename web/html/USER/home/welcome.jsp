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
    <title>FitHub | Checkout Cart</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
</head>
<body>
    <%
        HttpSession sessionUser = request.getSession(false);
        if (sessionUser == null || sessionUser.getAttribute("customerName") == null) {
            response.sendRedirect(request.getContextPath() + "/html/USER/signInSignUp/signIn.jsp");
            return;
        }
        
        String customerName = (String) sessionUser.getAttribute("customerName");
    %>

    <div class="checkout-card">
        <h1> Welcome back, <%= customerName %>!</h1>
        <p>Ready to complete your purchase or keep exploring?</p>

        <div class="button-group">
            <a class="btn" href="<%=request.getContextPath()%>/html/USER/product/productCart.jsp"> Continue Shopping</a>
            <a class="btn logout" href="<%=request.getContextPath()%>/html/USER/signInSignUp/logout.jsp"> Logout</a>
        </div>
    </div>

    <div class="progress-bar">
        <div class="progress" style="width: 40%;"></div>
    </div>
</body>
</html>
