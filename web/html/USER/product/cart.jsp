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
                <th>Price (MYR)</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Action</th> <!-- Keep delete button here -->
            </tr>

            <%
                double grandTotal = 0.0;
                for (CartItem item : cart) {
                    double total = item.getProduct().getProductPrice() * item.getQuantity();
                    grandTotal += total;
            %>
            <tr>
                <td><%= item.getProduct().getProductName() %></td>
                <td><%= String.format("%.2f", item.getProduct().getProductPrice()) %></td>
                <td>
                    <input type="number" name="quantity_<%=item.getProduct().getProductID()%>" value="<%=item.getQuantity()%>" min="1" max="100" />
                </td>
                <td><%= String.format("%.2f", total) %></td>
                <td>
                    <a href="<%=request.getContextPath()%>/RemoveFromCartServlet?productID=<%=item.getProduct().getProductID()%>" 
                       onclick="return confirm('Remove this item?');">Remove</a>
                </td>
            </tr>
            <% } %>
            <tr>
                <td colspan="3" align="right"><strong>Grand Total:</strong></td>
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
