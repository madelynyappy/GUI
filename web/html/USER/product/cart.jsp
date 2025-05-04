<%-- 
    Document   : cart
    Created on : Apr 28, 2025, 8:00:33 PM
    Author     : Madelyn Yap
--%><%@page import="java.util.*, model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("customerID") == null) {
        response.sendRedirect(request.getContextPath() + "/html/USER/signInSignUp/signIn.jsp");
        return;
    }
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitHub | Your Cart</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #FDFDFD;
            margin: 0;
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
        .button-bar {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-bottom: 10px;
                margin-right: 58px;
        }
       
        .empty-cart-form {
    margin-left: 50px;
}

.empty-cart-button {
    background-color: #BF2F2F;
    color: white;
    font-weight: bold;
    padding: 10px 20px;
    border-radius: 6px;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.empty-cart-button:hover {
    background-color: #8C1F1F;
}

    </style>
</head>
<body>
<jsp:include page="../home/header.jsp" />

<h1>Your Cart</h1>

<% if (cart == null || cart.isEmpty()) { %>
    <p>Your cart is empty.</p>
    <a href="<%=request.getContextPath()%>/html/USER/product/productCart.jsp">Continue Shopping</a>
<% } else { %>

<div class="button-bar">
    <a href="<%=request.getContextPath()%>/html/USER/product/product.jsp">
        <button type="button">Continue Shopping</button>
    </a>
    <a href="<%=request.getContextPath()%>/html/USER/product/checkout.jsp">
        <button type="button">Proceed to Checkout</button>
    </a>
</div>

<form action="<%=request.getContextPath()%>/UpdateCartServlet" method="post" style="margin: 55px;    margin-bottom: 0px;">
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
        <% double grandTotal = 0.0;
           for (CartItem item : cart) {
               Product p = item.getProduct();
               double finalPrice = p.getProductPrice();
               int discount = p.getDiscount();
               double originalPrice = finalPrice;
               if (discount > 0) {
                   originalPrice = finalPrice / (1 - discount / 100.0);
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
                <a href="<%=request.getContextPath()%>/RemoveFromCartServlet?productID=<%=p.getProductID()%>" onclick="return confirm('Remove this item?');">Remove</a>
            </td>
        </tr>
        <% } %>
        <tr>
            <td colspan="5" align="right"><strong>Grand Total:</strong></td>
            <td colspan="2"><strong><%= String.format("%.2f", grandTotal) %></strong></td>
        </tr>
    </table>
    <br>
    <button type="submit">Update Cart ( To Update Total Pricing )</button>
    
   
</form>
        
         <form action="<%=request.getContextPath()%>/ClearCartServlet" method="post" style="display: inline-block;" class="empty-cart-form">
    <button type="submit" onclick="return confirm('Clear entire cart?');">Empty Cart</button>
</form>



<% } %>

<jsp:include page="../home/footer.jsp" />
</body>
</html>
