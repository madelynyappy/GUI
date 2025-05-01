<%-- 
    Document   : cart
    Created on : Apr 28, 2025, 8:00:33 PM
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
%>

<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Shopping Cart</title>
    <style>
        
         body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #FDFDFD;
        margin: 0;
        padding: 40px;
    }

    h1 {
        color: #30588C;
        text-align: center;
        margin-bottom: 30px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #C4C3D0;
    }

    th {
        background-color: #30588C;
        color: white;
        padding: 12px;
    }

    td {
        background-color: #FDFDFD;
        text-align: center;
        padding: 10px;
        border-bottom: 1px solid #6093BF;
    }

    tr:hover td {
        background-color: #E0E7F1;
    }

    .strike {
        text-decoration: line-through;
        color: #888;
    }

    input[type="number"] {
        width: 60px;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
        text-align: center;
    }

    a {
        color: #254559;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        color: #30588C;
        text-decoration: underline;
    }

    button {
        background-color: #30588C;
        color: white;
        border: none;
        padding: 10px 20px;
        margin: 10px 0;
        font-weight: bold;
        border-radius: 6px;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    button:hover {
        background-color: #254559;
    }

    form {
        margin-top: 20px;
    }

    strong {
        color: #254559;
    }
        
        .strike { text-decoration: line-through; color: #888; }
        
    </style>
</head>
<body>
    <h1>Your Cart</h1>

    <% if (cart == null || cart.isEmpty()) { %>
        <p>Your cart is empty.</p>
        <a href="<%=request.getContextPath()%>/html/USER/product/productCart.jsp">Continue Shopping</a>
    <% } else { %>

        <form action="<%=request.getContextPath()%>/UpdateCartServlet" method="post">
        <table border="1" cellpadding="8">
            <tr>
                <th>Product Name</th>
                <th>Original Price</th>
                <th>Discount (%)</th>
                <th>Final Price (MYR)</th>
                <th>Quantity</th>
                <th>Total (MYR)</th>
                <th>Action</th>
            </tr>

            <%
                double grandTotal = 0.0;
                for (CartItem item : cart) {
                    Product p = item.getProduct();
                    double finalPrice = p.getProductPrice(); // already discounted in AddToCartServlet
                    int discount = p.getDiscount();
                    double originalPrice = finalPrice;

                    if (discount > 0) {
                        originalPrice = finalPrice / (1 - discount / 100.0); // reverse calculation
                    }

                    double total = finalPrice * item.getQuantity();
                    grandTotal += total;
            %>
            <tr>
                <td><%= p.getProductName() %></td>
                <td>
                    <% if (discount > 0) { %>
                        <span class="strike"><%= String.format("%.2f", originalPrice) %></span>
                    <% } else { %>
                        <%= String.format("%.2f", finalPrice) %>
                    <% } %>
                </td>
                <td><%= discount %>%</td>
                <td><%= String.format("%.2f", finalPrice) %></td>
                <td>
                    <input type="number" name="quantity_<%=p.getProductID()%>" value="<%=item.getQuantity()%>" min="1" max="100" />
                </td>
                <td><%= String.format("%.2f", total) %></td>
                <td>
                    <a href="<%=request.getContextPath()%>/RemoveFromCartServlet?productID=<%=p.getProductID()%>" 
                       onclick="return confirm('Remove this item?');">Remove</a>
                </td>
            </tr>
            <% } %>
            <tr>
                <td colspan="5" align="right"><strong>Grand Total:</strong></td>
                <td colspan="2"><strong><%= String.format("%.2f", grandTotal) %></strong></td>
            </tr>
        </table>

        <br>
        <button type="submit">Update Cart</button>
        </form>

        <br>

        <form action="<%=request.getContextPath()%>/ClearCartServlet" method="post" style="display:inline;">
            <button type="submit" onclick="return confirm('Clear entire cart?');">Empty Cart</button>
        </form>

        <a href="<%=request.getContextPath()%>/html/USER/product/productCart.jsp" style="margin-left: 20px;">Continue Shopping</a>

        <br><br>

        <a href="<%=request.getContextPath()%>/html/USER/product/checkout.jsp">
            <button type="button">Proceed to Checkout</button>
        </a>

    <% } %>

</body>
</html>
