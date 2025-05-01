<%-- 
    Document   : staffRegister
    Created on : Apr 30, 2025, 4:46:22 PM
    Author     : Madelyn Yap
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FitHub | Staff Registration</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css"> <!-- optional stylesheet -->
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
    </head>
    <body>

        <h1>Create Staff Account</h1>

        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
        <% if (errorMessage != null) { %>
            <p style="color:red;"><%= errorMessage %></p>
        <% } %>

        <form name="signupForm" action="<%= request.getContextPath() %>/StaffRegisterServlet" method="post" onsubmit="return validateForm()">
            <label>Full Name:</label><br>
            <input type="text" name="staffName" required><br><br>

            <label>Contact Number:</label><br>
            <input type="text" name="staffContactNumber" required><br><br>

            <label>Email:</label><br>
            <input type="email" name="staffEmail" required><br><br>

            <label>Address:</label><br>
            <textarea name="staffAddress" rows="3" cols="40" required></textarea><br><br>

            <label>Username:</label><br>
            <input type="text" name="staffUserName" required><br><br>

            <label>Password:</label><br>
            <input type="password" name="staffPassword" required><br><br>

            <label>Role Title:</label><br>
            <input type="text" name="staffRoleTitle" required><br><br>

            <button type="submit">Sign Up</button>
        </form>

        <br>
        <a href="<%= request.getContextPath() %>/html/STAFF/signInSignUp/login.jsp">
            Already have an account? Sign In
        </a>

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
