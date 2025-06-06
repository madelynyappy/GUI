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
    <title>FitHub | Customer List</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/staffIcon.jpg">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #FDFDFD;
            margin: 0;
        }
        
        h1{
            color: #30588C;
        }   

        h2 {
            color: #30588C;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
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
        
        form {
    display: flex;
    gap: 10px;
    align-items: center;
    padding: 10px 0;
}

input[type="text"] {
    padding: 6px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.btn-search {
    background-color: #30588C;
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

.btn-search:hover {
    background-color: #254559;
}


    </style>
</head>
<body>

    <%-- Sidebar --%>
   <%
    String role = (String) session.getAttribute("userRole");
    String sidebarPath = "../home/staffSidebar.jsp"; // default

    if ("manager".equalsIgnoreCase(role)) {
        sidebarPath = "../home/managerSidebar.jsp";
    }
%>
<jsp:include page="<%= sidebarPath %>" />


    <div class="content">
        <h1>Customer List</h1>
        
       <form method="get" action="${pageContext.request.contextPath}/CustomerListServlet" style="margin-bottom: 20px;">
    <label for="searchId">Customer ID:</label>
    <input type="text" name="searchId" id="searchId" placeholder="Enter ID">

    <label for="searchName">Customer Name:</label>
    <input type="text" name="searchName" id="searchName" placeholder="Enter Name">

    <input type="submit" value="Search" class="btn-search">
</form>


        
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Contact</th>
                <th>Email</th>
                <th>Billing Address</th>
                <th>Shipping Address</th>
                <th>Username</th>
            </tr>
            <%
                List<Customer> list = (List<Customer>) request.getAttribute("customerList");
                if (list != null && !list.isEmpty()) {
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
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="7" style="text-align:center;">No customer data available.</td>
            </tr>
            <%
                }
            %>
        </table>
    </div>

</body>
</html>
