<%-- 
    Document   : product
    Created on : Apr 14, 2025, 3:46:10 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*, java.sql.*"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">
        <title>Products | FitHub</title>
    </head>
    <body>
         <%@ include file="../home/header.jsp" %>
        
         <!-- Product Showcase Section -->
            <section class="product-section">
                <div class="section-header">
                    <h2>See Our Products</h2>
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
                        
                         <div class="product-grid">  <!-- Product Card need to have 20 default-->
                    <!-- Product Card 1 -->
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/images/products/trident_football.jpg" alt="Trident Football">
                        <h4>Trident Galactic Hybrid Premier Match Football (FIFA Quality Pro)</h4>

                        <p class="price">RM269.00</p>
                        <button class="add-to-cart">Add to cart</button>
                    </div>

                    <!-- Product Card 2 -->
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/images/products/trident_teeball.jpg" alt="Trident Teeball">
                        <h4>Trident Milestone Double Knit Teeball – 9"</h4>

                        <p class="price">RM45.00</p>
                        <button class="add-to-cart">Add to cart</button>
                    </div>

                    <!-- Product Card 3 -->
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/images/products/trident_landingmat.jpg" alt="Landing Mat">
                        <h4>Trident High Jump Landing Mat – 10' x 6' x 18" (Blue/Black)</h4>

                        <p class="price">RM3,900.00</p>
                        <button class="add-to-cart">Add to cart</button>
                    </div>

                    <!-- Product Card 4 -->
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/images/products/trident_netball.jpg" alt="Netball Post">
                        <h4>Trident Master Portable Netball Post</h4>

                        <p class="price">RM450.00</p>
                        <button class="add-to-cart">Add to cart</button>
                    </div>
                </div>
                        
                         <div class="product-grid">  <!-- Product Card need to have 20 default-->
                    <!-- Product Card 1 -->
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/images/products/trident_football.jpg" alt="Trident Football">
                        <h4>Trident Galactic Hybrid Premier Match Football (FIFA Quality Pro)</h4>

                        <p class="price">RM269.00</p>
                        <button class="add-to-cart">Add to cart</button>
                    </div>

                    <!-- Product Card 2 -->
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/images/products/trident_teeball.jpg" alt="Trident Teeball">
                        <h4>Trident Milestone Double Knit Teeball – 9"</h4>

                        <p class="price">RM45.00</p>
                        <button class="add-to-cart">Add to cart</button>
                    </div>

                    <!-- Product Card 3 -->
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/images/products/trident_landingmat.jpg" alt="Landing Mat">
                        <h4>Trident High Jump Landing Mat – 10' x 6' x 18" (Blue/Black)</h4>

                        <p class="price">RM3,900.00</p>
                        <button class="add-to-cart">Add to cart</button>
                    </div>

                    <!-- Product Card 4 -->
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/images/products/trident_netball.jpg" alt="Netball Post">
                        <h4>Trident Master Portable Netball Post</h4>

                        <p class="price">RM450.00</p>
                        <button class="add-to-cart">Add to cart</button>
                    </div>
                </div>
                        
                         <div class="product-grid">  <!-- Product Card need to have 20 default-->
                    <!-- Product Card 1 -->
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/images/products/trident_football.jpg" alt="Trident Football">
                        <h4>Trident Galactic Hybrid Premier Match Football (FIFA Quality Pro)</h4>

                        <p class="price">RM269.00</p>
                        <button class="add-to-cart">Add to cart</button>
                    </div>

                    <!-- Product Card 2 -->
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/images/products/trident_teeball.jpg" alt="Trident Teeball">
                        <h4>Trident Milestone Double Knit Teeball – 9"</h4>

                        <p class="price">RM45.00</p>
                        <button class="add-to-cart">Add to cart</button>
                    </div>

                    <!-- Product Card 3 -->
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/images/products/trident_landingmat.jpg" alt="Landing Mat">
                        <h4>Trident High Jump Landing Mat – 10' x 6' x 18" (Blue/Black)</h4>

                        <p class="price">RM3,900.00</p>
                        <button class="add-to-cart">Add to cart</button>
                    </div>

                    <!-- Product Card 4 -->
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/images/products/trident_netball.jpg" alt="Netball Post">
                        <h4>Trident Master Portable Netball Post</h4>

                        <p class="price">RM450.00</p>
                        <button class="add-to-cart">Add to cart</button>
                    </div>
                </div>
                        
                         <div class="product-grid">  <!-- Product Card need to have 20 default-->
                    <!-- Product Card 1 -->
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/images/products/trident_football.jpg" alt="Trident Football">
                        <h4>Trident Galactic Hybrid Premier Match Football (FIFA Quality Pro)</h4>

                        <p class="price">RM269.00</p>
                        <button class="add-to-cart">Add to cart</button>
                    </div>

                    <!-- Product Card 2 -->
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/images/products/trident_teeball.jpg" alt="Trident Teeball">
                        <h4>Trident Milestone Double Knit Teeball – 9"</h4>

                        <p class="price">RM45.00</p>
                        <button class="add-to-cart">Add to cart</button>
                    </div>

                    <!-- Product Card 3 -->
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/images/products/trident_landingmat.jpg" alt="Landing Mat">
                        <h4>Trident High Jump Landing Mat – 10' x 6' x 18" (Blue/Black)</h4>

                        <p class="price">RM3,900.00</p>
                        <button class="add-to-cart">Add to cart</button>
                    </div>

                    <!-- Product Card 4 -->
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/images/products/trident_netball.jpg" alt="Netball Post">
                        <h4>Trident Master Portable Netball Post</h4>

                        <p class="price">RM450.00</p>
                        <button class="add-to-cart">Add to cart</button>
                    </div>
                </div>
</div> <!-- close product-grid -->
<a href="../product/productDetails.jsp" class="view-all">Find Out More!</a>
</section>


         
           <!-- blog  -->
    <section class="driving-time-section">
        <div class="container">
            <div class="section-heading">
                <h2>Looking for Recommendations? <br><span>Explore Our Blog</span></h2>
<p>Our curated blog articles offer expert tips, workout guides, and recommended gear to help you make informed choices. </p>

            </div>
            <div class="driving-grid">
                <div class="driving-list">
                    <div class="driving-item">
                        <img src="https://images.unsplash.com/photo-1601584115197-04ecc0da31d7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="Ciężarówka o zachodzie słońca">
                        <div class="driving-item-content">
                            <h4>Rozliczanie czasu pracy kierowców - najlepsze rozwiązania i praktyczne porady</h4>
                           
                        </div>
                    </div>
                    <div class="driving-item">
                        <img src="https://images.unsplash.com/photo-1586191582151-f73872dfd183?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="Ciężarówki w rzędzie">
                        <div class="driving-item-content">
                            <h4>Pakiet i zmiana UE 2020, art. 8, 9, 10 - analizy, komentarze i praktyczne porady</h4>
                           
                        </div>
                    </div>
                    <div class="driving-item">
                        <img src="https://images.unsplash.com/photo-1545165375-7c5f3a5cf217?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="Skrzyżowanie autostrad">
                        <div class="driving-item-content">
                            <h4>Nowy europejski program dla rozliczania czasu pracy kierowców</h4>
                           
                        </div>
                    </div>
                    <div class="driving-item">
                        <img src="https://images.unsplash.com/photo-1592838064575-70ed626d3a0e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="Ciężarówka w deszczu">
                        <div class="driving-item-content">
                            <h4>GBOX Assist to nowa era rozliczania i kontroli czasu pracy kierowców</h4>
                            
                        </div>
                    </div>
                </div>
                <div class="driving-feature">
                    <img src="${pageContext.request.contextPath}/images/blog.jpg" alt="blog">
                </div>
            </div>
            <a href="#" class="view-all">Explore More Articles</a>
        </div>
    </section>
           
           <%@ include file="../home/footer.jsp" %>
    </body>
</html>