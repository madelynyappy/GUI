<%-- 
    Document   : customerList
    Created on : Apr 22, 2025, 3:58:57 PM
    Author     : Madelyn Yap
--%>

<%@ page import="java.util.*, model.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer List</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #FDFDFD;
            margin: 20px;
        }
        h2 {
            color: #30588C;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #C4C3D0;
        }
        th {
            background-color: #30588C;
            color: white;
            padding: 10px;
        }
        td {
            background-color: #FDFDFD;
            padding: 10px;
            border-bottom: 1px solid #6093BF;
        }
        tr:hover {
            background-color: #E0E7F1;
        }
    </style>
</head>
<body>
    <h2>Customer List</h2>
    <table>
        <tr>
            <th>ID</th><th>Name</th><th>Contact</th><th>Email</th><th>Billing Address</th>
            <th>Shipping Address</th><th>Username</th>
        </tr>
        <%
            List<Customer> list = (List<Customer>) request.getAttribute("customerList");
            for(Customer c : list){
        %>
        <tr>
            <td><%= c.getCustomerID() %></td>
            <td><%= c.getCustomerName() %></td>
            <td><%= c.getContactNumber() %></td>
            <td><%= c.getEmail() %></td>
            <td><%= c.getBillingAddress() %></td>
            <td><%= c.getShippingAddress() %></td>
            <td><%= c.getUsername() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
