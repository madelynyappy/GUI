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
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #FDFDFD;
            background-image: url('${pageContext.request.contextPath}/images/welcome.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .welcome-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }

        h1 {
            color: #30588C;
            margin-bottom: 20px;
        }

        p {
            color: #6093BF;
            font-size: 1.1em;
            margin-bottom: 30px;
        }

        .btn {
            display: inline-block;
            margin: 10px;
            padding: 12px 25px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            text-decoration: none;
            color: white;
        }

        .shop-btn {
            background-color: #30588C;
        }

        .shop-btn:hover {
            background-color: #6093BF;
        }

        .logout-btn {
            background-color: #a94442;
        }

        .logout-btn:hover {
            background-color: #922d2d;
        }
    </style>
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

<div class="welcome-container">
    <h1>Welcome, <%= customerName %>!</h1>
    <p>What would you like to do next?</p>
    <a href="<%=request.getContextPath()%>/html/USER/product/product.jsp" class="btn shop-btn">Continue Shopping</a>
    <a href="<%=request.getContextPath()%>/html/USER/signInSignUp/logout.jsp" class="btn logout-btn">Logout</a>
</div>

</body>
</html>
