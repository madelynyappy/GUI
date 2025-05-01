<%-- 
    Document   : staffList
    Created on : May 1, 2025, 3:22:32 PM
    Author     : Madelyn Yap
status removed for staff 
--%>

<%@ page import="java.util.*, model.Staff" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitHub | Staff List</title>
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
            background-color: #254559;
            color: white;
            padding: 10px;
        }
        td {
            background-color: #FDFDFD;
            padding: 10px;
            border-bottom: 1px solid #6093BF;
        }
        tr:hover {
            background-color: #E6EDF4;
        }
    </style>
</head>
<body>
    <h2>Staff List</h2>
    <table>
        <tr>
            <th>ID</th><th>Name</th><th>Contact</th><th>Email</th>
            <th>Address</th><th>Username</th><th>Role</th><%-- <th>Status</th> --%><th>Action</th>


        </tr>
        <%
            List<Staff> list = (List<Staff>) request.getAttribute("staffList");
            if (list != null && !list.isEmpty()) {
                for(Staff s : list){
        %>
        <tr>
            <td><%= s.getStaffID() %></td>
            <td><%= s.getStaffName() %></td>
            <td><%= s.getContactNumber() %></td>
            <td><%= s.getEmail() %></td>
            <td><%= s.getAddress() %></td>
            <td><%= s.getUsername() %></td>
            <td><%= s.getRoleTitle() %></td>
            
           <%-- <td><%= s.getStatus() %></td> --%>
           <td>
    <form action="${pageContext.request.contextPath}/DeleteStaffServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this staff?');">
        <input type="hidden" name="staffID" value="<%= s.getStaffID() %>">
        <button type="submit">Delete</button>
    </form>
</td>



        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="8" style="text-align:center;">No staff data available.</td></tr>
        <%
            }
        %>
    </table>
</body>
</html>
