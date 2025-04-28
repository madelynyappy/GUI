<%-- 
    Document   : search
    Created on : Apr 17, 2025, 1:20:00 AM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css">
<%
    String searchTerm = request.getParameter("query");
    if (searchTerm == null || searchTerm.trim().isEmpty()) {
        out.println("<h3>No search term provided.</h3>");
        return;
    }

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourDB", "root", "password");

        String sql = "SELECT * FROM Product WHERE ProductName LIKE ? OR ProductDescription LIKE ?";
        stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        stmt.setString(1, "%" + searchTerm + "%");
        stmt.setString(2, "%" + searchTerm + "%");
        rs = stmt.executeQuery();
%>

<h2>Search Results for "<%= searchTerm %>"</h2>
<div style="display: flex; flex-wrap: wrap; gap: 20px;">
<%
    boolean hasResults = false;
    while (rs.next()) {
        hasResults = true;
%>
    <div style="border: 1px solid #ccc; padding: 10px; width: 250px;">
        <img src="<%= rs.getString("ProductImageURL") %>" alt="Image" width="100%">
        <h4><%= rs.getString("ProductName") %></h4>
        <p>RM <%= rs.getDouble("ProductPrice") %></p>
        <p><%= rs.getString("ProductDescription") %></p>
    </div>
<%
    }

    if (!hasResults) {
%>
    <p>No results found.</p>
<%
    } else {
        rs.beforeFirst();
        rs.next();
        String matchedCategoryID = rs.getString("CategoryID");

        String relatedSQL = "SELECT * FROM Product WHERE CategoryID = ? AND (ProductName NOT LIKE ? AND ProductDescription NOT LIKE ?)";
        PreparedStatement relatedStmt = conn.prepareStatement(relatedSQL);
        relatedStmt.setString(1, matchedCategoryID);
        relatedStmt.setString(2, "%" + searchTerm + "%");
        relatedStmt.setString(3, "%" + searchTerm + "%");
        ResultSet relatedRs = relatedStmt.executeQuery();
%>

<h3>You might also like:</h3>
<div style="display: flex; flex-wrap: wrap; gap: 20px;">
<%
    while (relatedRs.next()) {
%>
    <div style="border: 1px solid #ccc; padding: 10px; width: 250px;">
        <img src="<%= relatedRs.getString("ProductImageURL") %>" alt="Image" width="100%">
        <h4><%= relatedRs.getString("ProductName") %></h4>
        <p>RM <%= relatedRs.getDouble("ProductPrice") %></p>
    </div>
<%
    }
    relatedRs.close();
    relatedStmt.close();
%>
</div>

<%
    }
%>
</div>

<%
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
