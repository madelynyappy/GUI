<%-- 
    Document   : logout
    Created on : Apr 29, 2025, 1:02:11 AM
    Author     : Madelyn Yap
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitHub | Logout Confirmation</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #FDFDFD;
            margin: 0;
            padding: 80px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        h1 {
            color: #30588C;
            margin-bottom: 30px;
        }

        form, .cancel-link {
            display: inline-block;
        }

        button {
            background-color: #30588C;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #254559;
        }

        .cancel-link a {
            margin-left: 20px;
            text-decoration: none;
            color: #6093BF;
            font-weight: bold;
            font-size: 16px;
        }

        .cancel-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <h1>Are you sure you want to log out?</h1>

    <form action="<%=request.getContextPath()%>/CustomerLogoutServlet" method="post">
        <button type="submit">Yes, Log me out</button>
    </form>

    <div class="cancel-link">
        <a href="<%=request.getContextPath()%>/html/USER/welcome.jsp">Cancel</a>
    </div>

</body>
</html>
