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
    <title>FitHub | Sign Up</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #F4F4F4;
            margin: 0;
            padding: 40px;
        }

        form {
            background-color: #ffffff;
            padding: 30px;
            width: 450px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }

        h1 {
            text-align: center;
            color: #30588C;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-top: 15px;
            color: #254559;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        textarea {
            resize: none;
        }

        button[type="submit"],
        button[type="button"] {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #30588C;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button[type="submit"]:hover,
        button[type="button"]:hover {
            background-color: #254559;
        }

        .error-message {
            color: red;
            text-align: center;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .link {
            text-align: center;
            margin-top: 20px;
        }

        .link a {
            color: #6093BF;
            text-decoration: none;
            font-weight: bold;
        }

        .link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <form name="signupForm" action="<%=request.getContextPath()%>/CustomerRegisterServlet" method="post" onsubmit="return validateForm()">
        <h1>Create Your Account</h1>

        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
        <% if (errorMessage != null) { %>
            <p class="error-message"><%= errorMessage %></p>
        <% } %>

        <label>Full Name:</label>
        <input type="text" name="customerName" required>

        <label>Contact Number:</label>
        <input type="text" name="customerContactNumber" required>

        <label>Email:</label>
        <input type="email" name="customerEmail" required>

        <label>Billing Address:</label>
        <textarea name="customerBillingAddress" id="billingAddress" rows="3" required></textarea>
        <button type="button" onclick="copyAddress()">Same as Billing Address</button>

        <label>Shipping Address:</label>
        <textarea name="customerShippingAddress" id="shippingAddress" rows="3" required></textarea>

        <label>Username:</label>
        <input type="text" name="customerUserName" required>

        <label>Password:</label>
        <input type="password" name="customerPassword" required>

        <button type="submit">Sign Up</button>

        <div class="link">
            <p>Already have an account?
                <a href="<%=request.getContextPath()%>/html/USER/signInSignUp/signIn.jsp">Sign In</a>
            </p>
        </div>
    </form>

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

        const nameRegex = /^[a-zA-Z\s]{2,100}$/;
        if (!nameRegex.test(customerName)) {
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

        if (billingAddress.length < 10) {
            alert("Billing Address must be at least 10 characters.");
            return false;
        }

        if (shippingAddress.length < 10) {
            alert("Shipping Address must be at least 10 characters.");
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

        return true;
    }
</script>

</body>
</html>
