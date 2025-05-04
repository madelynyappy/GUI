<%-- 
    Document   : checkout // payment 
    Created on : Apr 28, 2025, 10:59:29 PM
    Author     : Madelyn Yap
--%>
<%@page import="java.util.*, model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("customerID") == null) {
        response.sendRedirect(request.getContextPath() + "/html/USER/signInSignUp/signIn.jsp");
        return;
    }

    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

    String customerName = (String) session.getAttribute("customerName");
    String customerContact = (String) session.getAttribute("customerContactNumber");
    String customerShipping = (String) session.getAttribute("customerShippingAddress");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css">
     <title>FitHub | Checkout Cart</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
    <script>
        function useRegisteredDetails() {
            document.getElementById("fullName").value = "<%= customerName %>";
            document.getElementById("phoneNumber").value = "<%= customerContact %>";
            document.getElementById("address").value = "<%= customerShipping %>";
        }
    </script>
</head>
<body>
<%@ include file="../home/header.jsp" %>
    
    <h1>Checkout</h1>

    <% if (cart == null || cart.isEmpty()) { %>
        <p>Your cart is empty.</p>
        <a href="<%=request.getContextPath()%>/html/USER/product/productCart.jsp">Continue Shopping</a>
    <% } else { %>
        <h2>Order Summary</h2>
        <table border="1" cellpadding="8">
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Subtotal (MYR)</th>
            </tr>
            <%
                double grandTotal = 0.0;
                for (CartItem item : cart) {
                    double subtotal = item.getProduct().getProductPrice() * item.getQuantity();
                    grandTotal += subtotal;
            %>
            <tr>
                <td><%= item.getProduct().getProductName() %></td>
                <td><%= item.getQuantity() %></td>
                <td><%= String.format("%.2f", subtotal) %></td>
            </tr>
            <% } 

                double discount = 0.0;
                if (grandTotal > 688.0) {
                    discount = 68.0;
                } else if (grandTotal > 388.0) {
                    discount = 30.0;
                }

                double shippingFee = 10.0;
                double salesTax = grandTotal * 0.06;
                double totalPayment = grandTotal - discount + shippingFee + salesTax;
            %>
        </table>

        <h3>Summary</h3>
        <p>Subtotal: <strong>MYR <%= String.format("%.2f", grandTotal) %></strong></p>
        <% if (discount > 0) { %>
            <p style="color:green;">Discount Applied: <strong>-MYR <%= String.format("%.2f", discount) %></strong></p>
        <% } %>
        <p>Shipping Fee (Fixed): <strong>MYR <%= String.format("%.2f", shippingFee) %></strong></p>
        <p>Sales Tax (6%): <strong>MYR <%= String.format("%.2f", salesTax) %></strong></p>

        <h2>Total Payment:</h2>
        <h3><%= String.format("%.2f", totalPayment) %> MYR</h3>

        <h2>Shipping & Payment Details</h2>
        <form action="<%=request.getContextPath()%>/CheckoutServlet" method="POST">
            <label>Full Name:</label><br>
            <input type="text" id="fullName" name="fullName" required><br><br>

            <label>Phone Number:</label><br>
            <input type="text" id="phoneNumber" name="phoneNumber" required><br><br>

            <label>Address:</label><br>
            <textarea id="address" name="address" rows="4" cols="50" required></textarea><br><br>

            <button type="button" onclick="useRegisteredDetails()">Use Registered Details</button><br><br>

            <label>Payment Method:</label><br>
            <select name="paymentMethod" required>
                <option value="Cash on Delivery">Cash on Delivery</option>
                <option value="Credit Card">Credit Card</option>
                <option value="Debit Card">Debit Card</option>
                <option value="E-Wallet">E-Wallet</option>
            </select><br><br>

            <!-- Hidden fields to pass discount and total -->
            <input type="hidden" name="discountAmount" value="<%= String.format("%.2f", discount) %>">
            <input type="hidden" name="totalAmount" value="<%= String.format("%.2f", totalPayment) %>">

            <button type="submit">Place Order</button>
        </form>
    <% } %>
    
<%@ include file="../home/footer.jsp" %>    
</body>
</html>
