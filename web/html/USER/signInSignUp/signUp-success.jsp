<%-- 
    Document   : signUp-succuess
    Created on : 21 Apr 2025, 12:37:37 AM
    Author     : Ong Yan Hong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registration Success</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/success.css">
    </head>
    <body>
        <div class="logo-container">
            <img src="logo.png" alt="FitHub Logo">
        </div>
        <div class="background">
            <div class="success-box">               
                <div class="success-card">
                    <img src="success.png" class="badge" alt="Success">
                    <h2>Congratulations</h2>
                    <p><strong>You have successfully created your account.</strong></p>
                    <a href="signIn.jsp" class="back-btn">Back To Login</a>
                </div>
            </div>
        </div>
    </body>
</html>

