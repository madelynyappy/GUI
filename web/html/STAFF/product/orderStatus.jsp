<%-- 
    Document   : orderStatus
    Created on : Apr 30, 2025, 10:43:43 AM
    Author     : Madelyn Yap
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitHub | Manage Order Status</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
        }

        h1 {
            color: #30588C;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #6093BF;
            color: white;
        }

        select {
            padding: 5px;
        }

        .submit-btn {
            padding: 5px 10px;
            background-color: #30588C;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #254559;
        }
    </style>
</head>
<body>

    <%-- Sidebar --%>
    <jsp:include page="../home/staffSidebar.jsp" />

    <div class="content">
        <h1>Staff - Update Order Status</h1>

        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>Payment Method</th>
                    <th>Status</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Map<String, Map<String, Object>> orders = (Map<String, Map<String, Object>>) request.getAttribute("orders");
                    if (orders != null && !orders.isEmpty()) {
                        for (Map.Entry<String, Map<String, Object>> entry : orders.entrySet()) {
                            String orderID = entry.getKey();
                            Map<String, Object> order = entry.getValue();
                %>
                <tr>
                    <form action="<%=request.getContextPath()%>/OrderStatusServlet" method="post">
                        <input type="hidden" name="orderID" value="<%= orderID %>">
                        <td><%= orderID %></td>
                        <td><%= order.get("orderDate") %></td>
                        <td><%= order.get("paymentMethod") %></td>
                        <td>
                            <select name="orderStatus">
                                <option value="Packaging" <%= "Packaging".equals(order.get("orderStatus")) ? "selected" : "" %>>Packaging</option>
                                <option value="Shipping" <%= "Shipping".equals(order.get("orderStatus")) ? "selected" : "" %>>Shipping</option>
                                <option value="Delivered" <%= "Delivered".equals(order.get("orderStatus")) ? "selected" : "" %>>Delivered</option>
                            </select>
                        </td>
                        <td><button class="submit-btn" type="submit">Update</button></td>
                    </form>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5">No orders found.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

</body>
</html>
