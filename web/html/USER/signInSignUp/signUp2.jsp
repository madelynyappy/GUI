<%-- 
    Document   : signUp2
    Created on : 20 Apr 2025, 7:50:29 PM
    Author     : Ong Yan Hong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Create Account</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signUp.css">
    </head>
    <body>
        <div class="logo-container">
            <img src="logo.png" alt="FitHub Logo">
        </div>
        <div class="container">
            <h2>Create Your FitHub Account</h2>
            <p>All fields are required</p>

            <form action="signUp-success.jsp" method="post">
                <input type="hidden" name="fName" value="<%= request.getParameter("fName") %>">
                <input type="hidden" name="lName" value="<%= request.getParameter("lName") %>">
                <input type="hidden" name="contact" value="<%= request.getParameter("contact") %>">
                <input type="hidden" name="email" value="<%= request.getParameter("email") %>">
                <input type="hidden" name="pwd" value="<%= request.getParameter("pwd") %>">
                <input type="hidden" name="pwdRe" value="<%= request.getParameter("pwdRe") %>">

                <p>
                    <label>Username</label>
                    <input type="text" name="username" placeholder="Username" required>
                </p>
                <p>
                    <label>Billing Address</label>
                </p>
                <p>
                    <input type="text" name="billStreet" placeholder="Street Address" required>
                </p>
                <div style="display: flex; gap: 10px;">
                    <input type="text" name="billCity" placeholder="City" required style="flex: 1;">
                    <input type="text" name="billState" placeholder="State/Province/Region" required style="flex: 1;">
                </div>
                <p>
                    <input type="text" name="billZip" placeholder="Postal/ZIP Code" required>
                </p>

                <p>
                    <label>Shipping Address</label>
                </p>
                <p>
                    <input type="text" name="shipStreet" placeholder="Street Address" required>
                </p>
                <div style="display: flex; gap: 10px;">
                    <input type="text" name="shipCity" placeholder="City" required style="flex: 1;">
                    <input type="text" name="shipState" placeholder="State/Province/Region" required style="flex: 1;">
                </div>
                <p>
                    <input type="text" name="shipZip" placeholder="Postal/ZIP Code" required>
                </p>

                <div class="button-row">
                    <button type="button" class="back-btn" onclick="window.location.href = 'signUp1.jsp'">← Go Back</button>
                    <button type="submit" class="submit-btn">Create Account</button>
                </div>                               
            </form>
        </div>
    </body>
</html>
