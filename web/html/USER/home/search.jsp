<%-- 
    Document   : search
    Created on : Apr 17, 2025, 1:20:00 AM
    Author     : Madelyn Yap
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.*, java.sql.*" %>
<%
    String keyword = request.getParameter("keyword");
    List<Product> resultList = new ArrayList<>();

    if (keyword != null && !keyword.trim().isEmpty()) {
        keyword = keyword.toLowerCase(); // ignore case

        try {
            Connection conn = DBConnector.getConnection();
            ProductDAO productDAO = new ProductDAO(conn);
            List<Product> allProducts = productDAO.getAllProducts();

            for (Product p : allProducts) {
                String id = p.getProductID().toLowerCase();
                String name = p.getProductName().toLowerCase();
                if (id.contains(keyword) || name.contains(keyword)) {
                    resultList.add(p);
                }
            }

            conn.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
%>

<!--Product Result-->
<%
    List<Product> productList = new ArrayList<>();
    try {
        Connection conn = DBConnector.getConnection();
        ProductDAO productDAO = new ProductDAO(conn);
        productList = productDAO.getAllProducts();
        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Product</title>
</head>
<body>
    <%@ include file="../home/header.jsp" %>
<h1>Search Product</h1>
<!-- comment 
<form method="get" action="search.jsp">
    <input type="text" name="keyword" placeholder="Search by Product ID or Name" value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
    <button type="submit">Search</button>
</form>
-->

<% if (!resultList.isEmpty()) { %>
    <table border="1" cellpadding="8">
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Description</th>
            <th>Price (MYR)</th>
            <th>Category</th>
        </tr>
        <% for (Product p : resultList) { %>
        <tr>
            <td><%= p.getProductID() %></td>
            <td><%= p.getProductName() %></td>
            <td><%= p.getProductDescription() %></td>
            <td><%= String.format("%.2f", p.getProductPrice()) %></td>
            <td><%= p.getCategoryID() %></td>
        </tr>
        <% } %>
    </table>
<% } else if (keyword != null) { %>
    <p>No results found for "<%= keyword %>"</p>
<% } %>

 <!-- Product Showcase Section -->
<!--            <section class="product-section">
                <div class="section-header">
                    <h2>See Our Promotion Products</h2>
                    <a href="USER/product/product.jsp" class="see-more-link">See More<i class="bi bi-arrow-right"></i></a>
                </div>

                <div class="product-grid">
                    <% 
                        int count = 0;
                        for (Product p : productList) {
                            if (count % 4 == 0 && count > 0) {
                                out.println("</div><div class='product-grid'>");
                            }
                    %>
                        <div class="product-card">
                            <% if (p.getProductImageList() != null && !p.getProductImageList().isEmpty()) { %>
                                <img src="${pageContext.request.contextPath}/<%= p.getProductImageList().get(0).getPath() %>" alt="<%= p.getProductName() %>">
                            <% } else { %>
                                <img src="${pageContext.request.contextPath}/images/noImage.png" alt="No image available">
                            <% } %>
                            <h4><%= p.getProductName() %></h4>
                            <p class="price">RM<%= String.format("%.2f", p.getProductPrice()) %></p>
                            <button class="add-to-cart" onclick="window.location.href='<%=request.getContextPath()%>/AddToCartServlet?productID=<%=p.getProductID()%>'">Add to cart</button>
                        </div>
                    <%
                            count++;
                        }
                    %>
                </div>-->
                        
 <!-- close product-grid -->
<!--</section> -->
                    
<%@ include file="../home/footer.jsp" %>
</body>
</html>
