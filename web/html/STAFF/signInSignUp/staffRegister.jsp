<%-- 
    Document   : staffRegister
    Created on : Apr 30, 2025, 4:46:22 PM
    Author     : Madelyn Yap
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitHub | Register Staff</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/staffIcon.jpg">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css"> 
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #F5F7FA;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar class wrapper */
        .sidebar {
            width: 250px;
            background-color: #1f3a5f;
        }

        .form-container {
            flex: 1;
            padding: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-box {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        h1 {
            color: #30588C;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            background-color: #30588C;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 12px;
            margin-top: 20px;
            font-size: 16px;
            width: 100%;
            cursor: pointer;
        }

        button:hover {
            background-color: #254559;
        }

        .error-message {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="sidebar">
        <jsp:include page="../home/managerSidebar.jsp" />
    </div>

    <div class="form-container">
        <div class="form-box">
            <h1>Register New Staff</h1>

            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
            <% if (errorMessage != null) { %>
                <p class="error-message"><%= errorMessage %></p>
            <% } %>

            <form name="signupForm" action="<%= request.getContextPath() %>/StaffRegisterServlet" method="post" onsubmit="return validateForm()">
                <label>Full Name:</label>
                <input type="text" name="staffName" required>

                <label>Contact Number:</label>
                <input type="text" name="staffContactNumber" required>

                <label>Email (Gmail only):</label>
                <input type="email" name="staffEmail" required>

                <label>Address:</label>
                <textarea name="staffAddress" rows="3" required></textarea>

                <label>Username:</label>
                <input type="text" name="staffUserName" required>

                <label>Password:</label>
                <input type="password" name="staffPassword" required>

                <label>Role Title:</label>
                <input type="text" name="staffRoleTitle" required>

                <button type="submit">Create Staff Account</button>
            </form>
        </div>
    </div>
</div>

<script>
    function validateForm() {
        const form = document.forms["signupForm"];
        const staffName = form["staffName"].value.trim();
        const contact = form["staffContactNumber"].value.trim();
        const email = form["staffEmail"].value.trim();
        const address = form["staffAddress"].value.trim();
        const username = form["staffUserName"].value.trim();
        const password = form["staffPassword"].value.trim();
        const roleTitle = form["staffRoleTitle"].value.trim();

        const nameRegex = /^[a-zA-Z\s]{2,100}$/;
        if (!nameRegex.test(staffName)) {
            alert("Full Name must be 2-100 characters, letters and spaces only.");
            return false;
        }

        const phoneRegex = /^[0-9]{8,15}$/;
        if (!phoneRegex.test(contact)) {
            alert("Please enter a valid contact number (only numbers, 8-15 digits).");
            return false;
        }

        const emailRegex = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
        if (!emailRegex.test(email)) {
            alert("Please enter a valid Gmail address (must end with @gmail.com).");
            return false;
        }

        if (address.length < 10) {
            alert("Address must be at least 10 characters.");
            return false;
        }

        const usernameRegex = /^[a-zA-Z0-9]{4,20}$/;
        if (!usernameRegex.test(username)) {
            alert("Username must be 4-20 characters, letters and numbers only (no spaces).");
            return false;
        }

        if (password.length < 6 || !/\d/.test(password) || !/[a-zA-Z]/.test(password)) {
            alert("Password must be at least 6 characters and include both letters and numbers.");
            return false;
        }

        const roleTitleRegex = /^[a-zA-Z\s]{3,100}$/;
        if (!roleTitleRegex.test(roleTitle)) {
            alert("Role Title must be 3-100 characters, letters and spaces only.");
            return false;
        }

        return true;
    }
</script>

</body>
</html>
