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
    <meta charset="UTF-8">
    <title>FitHub | Staff Login</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/staffIcon.jpg">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f4;
            padding: 40px;
        }

        form {
            background-color: white;
            padding: 30px;
            width: 350px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            color: #30588C;
        }

        label {
            display: block;
            margin-top: 15px;
            color: #254559;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #30588C;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background-color: #254559;
        }

        .register-link {
            text-align: center;
            margin-top: 15px;
        }

        .register-link a {
            color: #6093BF;
            text-decoration: none;
        }

        .error-msg {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>

    <form action="${pageContext.request.contextPath}/StaffLoginServlet" method="POST">
        <h2>Staff Login</h2>

        <label for="staffUserName">Username:</label>
        <input type="text" id="staffUserName" name="staffUserName" required>

        <label for="staffPassword">Password:</label>
        <input type="password" id="staffPassword" name="staffPassword" required>

        <button type="submit">Login</button>

        <c:if test="${param.error == '1'}">
            <p class="error-msg">Invalid username or password. Please try again.</p>
        </c:if>

    </form>

</body>
</html>
