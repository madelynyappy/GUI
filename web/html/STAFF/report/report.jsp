<%-- 
    Document   : report
    Created on : Apr 29, 2025, 11:14:20 PM
    Author     : Madelyn Yap
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sales Report</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/report.css">
</head>
<body>
<h1>Sales Report</h1>

<div class="button-group">
    <form method="get" action="${pageContext.request.contextPath}/ReportServlet">
        <button type="submit" name="type" value="top10">Top 10 Sold Products</button>
        <button type="submit" name="type" value="daily">Daily Sales</button>

        <select name="month">
            <option value="">Select Month</option>
            <option value="1">January</option>
            <option value="2">February</option>
            <option value="3">March</option>
            <option value="4">April</option>
            <option value="5">May</option>
            <option value="6">June</option>
            <option value="7">July</option>
            <option value="8">August</option>
            <option value="9">September</option>
            <option value="10">October</option>
            <option value="11">November</option>
            <option value="12">December</option>
        </select>
        <button type="submit" name="type" value="monthly">Monthly Sales</button>

        <select name="year">
            <option value="">Select Year</option>
<%
            for (int year = 2025; year <= Calendar.getInstance().get(Calendar.YEAR); year++) {
%>
            <option value="<%= year %>"><%= year %></option>
<%
            }
%>
        </select>
        <button type="submit" name="type" value="yearly">Yearly Sales</button>
    </form>
</div>

<%
    String reportType = (String) request.getAttribute("reportType");
    List<Map<String, Object>> reportData = (List<Map<String, Object>>) request.getAttribute("reportData");

    if (reportData == null || reportData.isEmpty()) {
%>
    <p>No data available for this report.</p>
<%
    } else {
%>
    <table border="1" cellpadding="8">
        <thead>
        <tr>
<%
            Map<String, Object> firstRow = reportData.get(0);
            for (String column : firstRow.keySet()) {
%>
            <th><%= column %></th>
<%
            }
%>
        </tr>
        </thead>
        <tbody>
<%
        for (Map<String, Object> row : reportData) {
%>
        <tr>
<%
            for (Object value : row.values()) {
%>
            <td><%= value %></td>
<%
            }
%>
        </tr>
<%
        }
%>
        </tbody>
    </table>
<%
    }
%>
</body>
</html>
