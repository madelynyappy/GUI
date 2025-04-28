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
    <title>Logout Confirmation</title>
</head>
<body>
    <h1>Are you sure you want to log out?</h1>

    <form action="<%=request.getContextPath()%>/CustomerLogoutServlet" method="post" style="display:inline;">
        <button type="submit">Yes, Log me out</button>
    </form>

    <a href="<%=request.getContextPath()%>/html/USER/welcome.jsp" style="margin-left: 20px;">Cancel</a>
</body>
</html>

