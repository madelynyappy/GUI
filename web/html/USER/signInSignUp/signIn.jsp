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
    <title>FitHub | Customer Login</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f4;
            padding: 40px;
            margin: 0;
        }

        form {
            background-color: #ffffff;
            padding: 30px;
            width: 350px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
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
            background-color: #30588C; /* B'dazzled Blue */
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background-color: #254559; /* Japanese Indigo */
        }

        .signup-link {
            text-align: center;
            margin-top: 15px;
        }

        .signup-link a {
            color: #6093BF; /* Silver Lake Blue */
            text-decoration: none;
            font-weight: bold;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <form action="<%=request.getContextPath()%>/CustomerLoginServlet" method="post">
        <h1>Sign In to Your Account</h1>

        <label for="customerUserName">Username:</label>
        <input type="text" name="customerUserName" id="customerUserName" required>

        <label for="customerPassword">Password:</label>
        <input type="password" name="customerPassword" id="customerPassword" required>

        <button type="submit">Sign In</button>

        <div class="signup-link">
            <p>Don't have an account?
                <a href="<%=request.getContextPath()%>/html/USER/signInSignUp/signUp.jsp">Sign Up</a>
            </p>
        </div>
    </form>

</body>
</html>
