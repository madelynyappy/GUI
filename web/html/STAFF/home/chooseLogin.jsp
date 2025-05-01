<%-- 
    Document   : chooseLogin
    Created on : May 1, 2025, 8:27:38 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitHub | Choose Login</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #FDFDFD;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #30588C;
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

        .staff-btn {
            background-color: #6093BF;
        }

        .staff-btn:hover {
            background-color: #30588C;
        }

        .manager-btn {
            background-color: #254559;
        }

        .manager-btn:hover {
            background-color: #1b3341;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h1>Login as</h1>
    <a href="${pageContext.request.contextPath}/html/STAFF/signInSignUp/login.jsp" class="btn staff-btn">Staff</a>
    <a href="${pageContext.request.contextPath}/html/STAFF/signInSignUp/managerLogin.jsp" class="btn manager-btn">Manager</a>
</div>

</body>
</html>
