<%-- 
    Document   : checkoutSucess
    Created on : Apr 28, 2025, 11:00:48 PM
    Author     : Madelyn Yap
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitHub | Order Success</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #FDFDFD;
            background-image: url('${pageContext.request.contextPath}/images/successcheckout.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .success-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }

        h1 {
            color: #30588C;
            margin-bottom: 20px;
        }

        p {
            color: #6093BF;
            font-size: 1.1em;
            margin-bottom: 30px;
        }

        .btn {
            display: inline-block;
            margin: 10px;
            padding: 12px 25px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            text-decoration: none;
            color: white;
        }

        .shop-btn {
            background-color: #30588C;
        }

        .shop-btn:hover {
            background-color: #6093BF;
        }

        .order-btn {
            background-color: #254559;
        }

        .order-btn:hover {
            background-color: #1b3341;
        }
    </style>
</head>
<body>

<div class="success-container">
    <h1>Thank You for Your Purchase!</h1>
    <p>Your order has been successfully placed. <br> We will deliver your items soon!</p>
    <a href="<%=request.getContextPath()%>/html/USER/product/product.jsp" class="btn shop-btn">Continue Shopping</a>
    <a href="<%=request.getContextPath()%>/OrderHistoryServlet" class="btn order-btn">View My Orders</a>
</div>

</body>
</html>

