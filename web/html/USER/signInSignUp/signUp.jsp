<%-- 
    Document   : signUp
    Created on : Apr 28, 2025, 11:33:26 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
</head>
<body>
    <h1>Create Your Account</h1>

    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
<% if (errorMessage != null) { %>
    <p style="color:red;"><%= errorMessage %></p>
<% } %>

    
    <form name="signupForm" action="<%=request.getContextPath()%>/CustomerRegisterServlet" method="post" onsubmit="return validateForm()">

        <label>Full Name:</label><br>
        <input type="text" name="customerName" required><br><br>

        <label>Contact Number:</label><br>
        <input type="text" name="customerContactNumber" required><br><br>

        <label>Email:</label><br>
        <input type="email" name="customerEmail" required><br><br>

        <label>Billing Address:</label><br>
        <textarea name="customerBillingAddress" id="billingAddress" rows="3" cols="40" required></textarea>
        <br>
        <button type="button" onclick="copyAddress()">Same as Billing Address</button>
        <br><br>

        <label>Shipping Address:</label><br>
        <textarea name="customerShippingAddress" id="shippingAddress" rows="3" cols="40" required></textarea>

        <br><br>
        <label>Username:</label><br>
        <input type="text" name="customerUserName" required><br><br>

        <label>Password:</label><br>
        <input type="password" name="customerPassword" required><br><br>

        <button type="submit">Sign Up</button>
    </form>

    <br>
    <a href="<%=request.getContextPath()%>/html/USER/signInSignUp/signIn.jsp">Already have an account? Sign In</a>

</body>

<script>
    function copyAddress() {
        document.getElementById("shippingAddress").value = document.getElementById("billingAddress").value;
    }

    function validateForm() {
        const form = document.forms["signupForm"];
        const customerName = form["customerName"].value.trim();
        const contact = form["customerContactNumber"].value.trim();
        const email = form["customerEmail"].value.trim();
        const billingAddress = form["customerBillingAddress"].value.trim();
        const shippingAddress = form["customerShippingAddress"].value.trim();
        const username = form["customerUserName"].value.trim();
        const password = form["customerPassword"].value.trim();

        // Full Name validation
        const nameRegex = /^[a-zA-Z\s]{2,100}$/;
        if (!nameRegex.test(customerName)) {
            alert("Full Name must be 2-100 characters, letters and spaces only.");
            return false;
        }

        // Contact Number validation
        const phoneRegex = /^[0-9]{8,15}$/;
        if (!phoneRegex.test(contact)) {
            alert("Please enter a valid contact number (only numbers, 8-15 digits).");
            return false;
        }

        // Email validation
        const emailRegex = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
        if (!emailRegex.test(email)) {
            alert("Please enter a valid Gmail address (must end with @gmail.com).");
            return false;
        }

        // Billing Address validation
        if (billingAddress.length < 10) {
            alert("Billing Address must be at least 10 characters.");
            return false;
        }

        // Shipping Address validation
        if (shippingAddress.length < 10) {
            alert("Shipping Address must be at least 10 characters.");
            return false;
        }

        // Username validation
        const usernameRegex = /^[a-zA-Z0-9]{4,20}$/;
        if (!usernameRegex.test(username)) {
            alert("Username must be 4-20 characters, letters and numbers only (no spaces).");
            return false;
        }

        // Password validation
        if (password.length < 6 || !/\d/.test(password) || !/[a-zA-Z]/.test(password)) {
            alert("Password must be at least 6 characters and include both letters and numbers.");
            return false;
        }

        return true;
    }
</script>

</html>
