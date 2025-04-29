<%-- 
    Document   : checkoutSucess
    Created on : Apr 28, 2025, 11:00:48 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Success</title>
</head>
<body>
    <h1>Thank You for Your Purchase!</h1>
    <p>Your order has been successfully placed. We will deliver your items soon!</p>

    <a href="<%=request.getContextPath()%>/html/USER/product/productCart.jsp">Continue Shopping</a>
    <a href="<%=request.getContextPath()%>/OrderHistoryServlet">View My Orders</a>

</body>
</html>

