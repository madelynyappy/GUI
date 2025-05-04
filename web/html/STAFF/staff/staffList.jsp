<%-- 
    Document   : staffList
    Created on : May 1, 2025, 3:22:32 PM
    Author     : Madelyn Yap
    Note       : Status removed for staff
--%>
<%@ page import="java.util.*, model.Staff" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FitHub | Staff List</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/staffIcon.jpg">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #F5F7FA;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        .content {
            flex-grow: 1;
            padding: 40px;
            box-sizing: border-box;
            padding-left: 290PX;
        }

        h2 {
            color: #30588C;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        th {
            background-color: #254559;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #d2dbe8;
        }

        tr:hover {
            background-color: #f1f5fb;
        }

        button {
            background-color: #D9534F;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #c9302c;
        }

        .centered {
            text-align: center;
            padding: 20px;
            color: #666;
        }

        form {
            margin: 0;
        }
    </style>
</head>
<body>
      <%-- No extra .sidebar wrapper needed --%>
        <jsp:include page="../home/managerSidebar.jsp" />
    <div class="container">
      

        <div class="content">
            <h2>Staff List</h2>

            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
                <%
                    List<Staff> list = (List<Staff>) request.getAttribute("staffList");
                    if (list != null && !list.isEmpty()) {
                        for (Staff s : list) {
                %>
                <tr>
                    <td><%= s.getStaffID() %></td>
                    <td><%= s.getStaffName() %></td>
                    <td><%= s.getContactNumber() %></td>
                    <td><%= s.getEmail() %></td>
                    <td><%= s.getAddress() %></td>
                    <td><%= s.getUsername() %></td>
                    <td><%= s.getRoleTitle() %></td>
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
                <tr>
                    <td colspan="8" class="centered">No staff data available.</td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </div>
</body>
</html>
