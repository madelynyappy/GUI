<%-- 
    Document   : cardio
    Created on : Apr 14, 2025, 4:00:05 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*, java.sql.*"%>
<%
    List<Product> productList = new ArrayList<>();
    try {
        Connection conn = DBConnector.getConnection();
        ProductDAO productDAO = new ProductDAO(conn);
        productList = productDAO.getProductsByCategory("C102"); 
        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png"> 
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/categoryDetails.css">
        <title>Cardio | FITHUB </title>
    </head>
    <body>
        <%@ include file="../home/header.jsp" %>

         <section class="video-hero" id="video-hero">
            <video autoplay muted loop playsinline class="video-bg">
                <source src="${pageContext.request.contextPath}/images/cardio.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
            <div class="video-overlay">
                <h1>Cardio</h1>
                <p>Your #1 destination for fitness, strength & health gear</p>
                <a href="http://localhost:48944/FITHUB2/html/USER/product/product.jsp" class="btn-shop">Shop Now</a>
            </div>
        </section>
        
                <!-- Product Showcase Section -->
            <section class="product-section">
                <div class="section-header">
                    <h2>Cardio Products</h2>
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
                </div>
                        
                        
 <!-- close product-grid -->
</section>
                
        <%@ include file="../home/footer.jsp" %>

    </body>
</html>

