<%-- 
    Document   : home
    Created on : Apr 14, 2025, 3:03:09 PM
    Author     : Madelyn Yap
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
         <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/fithub.png"> 
        <title>FitHub | Home</title>
    </head>
    <body>
        <!-- Header -->
        <jsp:include page="header.jsp" />

        <!-- Video Hero Section -->
        <section class="video-hero" id="video-hero">
            <video autoplay muted loop playsinline class="video-bg">
                <source src="${pageContext.request.contextPath}/images/heroVideo.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </section>

        <main class="homepage-container">
            <!-- Introduction Section -->
            <section class="intro-section">
                <h1>Welcome to FITHUB – Your Ultimate Destination for Fitness & Sports Gear!</h1>
                <p>
                    At FITHUB, we believe that fitness is for everyone – whether you’re a teen starting your fitness journey, 
                    an adult pushing limits, or a senior staying active for a healthier life.
                </p>
                <p>
                    <i class="bi bi-bar-chart-line-fill"></i> Train Smart. Move Better. Live Strong.
                </p>
                <p>
                    From home gym essentials and high-performance sports gear to activewear and recovery tools, 
                    FITHUB is your one-stop shop for all things fitness.
                </p>
            </section>

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
                            if (count >= 8) break; // Only display first 8 products
                            
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
                <a href="../product/product.jsp" class="find-out-more">Find Out More!</a>
            </section>

            <!-- Trust & Credibility Section -->
            <section class="trust-section">
                <h2><i class="bi bi-trophy-fill"></i> Why Choose Us?</h2>

                <div class="trust-grid">
                    <!-- Row 1 -->
                    <div class="trust-item">
                        <i class="bi bi-patch-check-fill"></i>
                        <h3>Quality Assurance</h3>
                        <p>Premium, durable, and tested equipment.</p>
                    </div>
                    <div class="trust-item">
                        <i class="bi bi-truck"></i>
                        <h3>Fast Shipping</h3>
                        <p>Get your gear in 2–5 business days.</p>
                    </div>
                    <div class="trust-item">
                        <i class="bi bi-shield-lock-fill"></i>
                        <h3>Secure Payments</h3>
                        <p>100% safe checkout with SSL encryption.</p>
                    </div>

                    <!-- Row 2 -->
                    <div class="trust-item">
                        <i class="bi bi-headset"></i>
                        <h3>Customer Support</h3>
                        <p>24/7 live support for all your fitness needs.</p>
                    </div>
                    <div class="trust-item">
                        <i class="bi bi-arrow-counterclockwise"></i>
                        <h3>Warranty & Returns</h3>
                        <p>Hassle-free returns & warranty coverage.</p>
                    </div>
                    <div class="trust-item">
                        <i class="bi bi-globe2"></i>
                        <h3>Nationwide Coverage</h3>
                        <p>We deliver across Malaysia, reaching customers from cities to rural towns.</p>
                    </div>

                </div>

                <p class="trust-footer"><i class="bi bi-people-fill"></i> Join thousands of satisfied customers. Experience the FitHub difference today!</p>
            </section>

            <style>
                .promotion-full {
                    position: relative;
                    width: 100vw;
                    background:
                        linear-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.1)),
                        url('${pageContext.request.contextPath}/images/promotionHome.jpg') center/cover no-repeat;
                    background-size: cover;
                    background-position: center;
                    height: 500px;
                    color: white;
                    overflow: hidden;

                    /* ADJUSTMENT */
                    margin-left: calc(-50vw + 50%);
                    padding: 0 !important;
                }
            </style>

            <section class="promotion-full">
                <div class="promotion-overlay">
                    <div class="promotion-content">
                        <div class="promotion-text">
                            <span class="subtitle">Enjoy Various Discounts on Our Promotion Items</span>
                            <h1 class="title">
                                Up to <span class="highlight-red">-90%</span> Discount
                            </h1>
                            <p class="description">
                                Discover unbeatable prices on top-quality fitness & wellness equipment.<br>
                                Upgrade your workout, without breaking the bank.
                            </p>
                            <a href="${pageContext.request.contextPath}/html/USER/promotion/promotion.jsp" class="btn-primary promotion-button">Shop Now</a>
                        </div>
                    </div>
                </div>
            </section>

            <!-- To Know More Section -->
            <section class="to-know-more-section">
                <h2 class="section-title">Who We Are</h2>
                <div class="info-grid">
                    <!-- Card 1 -->
                    <div class="info-card">
                        <a href="contactUs.jsp">
                            <img src="${pageContext.request.contextPath}/images/contactushome.jpg" alt="About Us">
                            <div class="info-content">
                                <h4>Innovation Is in Our DNA, CONTACT US!</h4>
                                <p class="learn-more-link">Learn More</p>
                            </div>
                        </a>
                    </div>

                    <!-- Card 2 -->
                    <div class="info-card">
                        <a href="aboutUs.jsp">
                            <img src="${pageContext.request.contextPath}/images/aboutushome.jpg" alt="FAQ">
                            <div class="info-content">
                                <h4>About Quality Products, Unbeatable Prices</h4>
                                <p class="learn-more-link">Learn More</p>
                            </div>
                        </a>
                    </div>

                    <!-- Card 3 -->
                    <div class="info-card">
                        <a href="faq.jsp">
                            <img src="${pageContext.request.contextPath}/images/faqhome.jpg" alt="Contact Us">
                            <div class="info-content">
                                <h4>Frequently Asked Questions</h4>
                                <p class="learn-more-link">Learn More</p>
                            </div>
                        </a>
                    </div>
                </div>
            </section>


            <section class="welcome-section">
                <p>
                    <strong>Welcome!</strong>
                    <span class="subtext">Sign in for the best experience</span>
                    <a href="${pageContext.request.contextPath}/html/USER/signInSignUp/signIn.jsp" class="sign-in">Sign In</a>
                    <span class="divider">|</span>
                    <a href="${pageContext.request.contextPath}/html/USER/signInSignUp/signUp1.jsp" class="create-account">Create Account</a>
                </p>
            </section>

            <!-- Category Section -->
            <section class="category-section">
                <h2 class="category-title">Browse Our Other Collections</h2>
                <div class="category-wrapper grid-layout">
                    <div class="category-item twocolumn" style="background-image: url('${pageContext.request.contextPath}/images/cat_dumbbells.jpg');">
                        <div class="category-text">
                            <h3>Dumbbells</h3>
                            <a href="USER/product/dumbbells.jsp">Shop Dumbbells</a>
                        </div>
                    </div>

                    <div class="category-item onerow" style="background-image: url('${pageContext.request.contextPath}/images/cat_accessories.jpg');">
                        <div class="category-text">
                            <h3>Accessories</h3>
                            <a href="USER/product/accessories.jsp">Explore Accessories</a>
                        </div>
                    </div>

                    <div class="category-item" style="background-image: url('${pageContext.request.contextPath}/images/cat_cardio.jpg');">
                        <div class="category-text">
                            <h3>Cardio</h3>
                            <a href="USER/product/cardio.jsp">Get Your Heart Pumping</a>
                        </div>
                    </div>

                    <div class="category-item twocolumn" style="background-image: url('${pageContext.request.contextPath}/images/cat_yoga.jpg');">
                        <div class="category-text">
                            <h3>Yoga</h3>
                            <a href="USER/product/yoga.jsp">Flow with Yoga</a>
                        </div>
                    </div>

                    <div class="category-item threecolumn" style="background-image: url('${pageContext.request.contextPath}/images/cat_recovery.jpg');">
                        <div class="category-text">
                            <h3>Recovery & Wellness</h3>
                            <a href="USER/product/randw.jsp">Relax & Recover</a>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- Footer -->
        <jsp:include page="footer.jsp" />
        <script>
            window.addEventListener('scroll', function () {
                const header = document.querySelector('.header');
                const videoSection = document.getElementById('video-hero');

                if (window.scrollY > videoSection.offsetHeight - 80) {
                    header.classList.add('scrolled');
                } else {
                    header.classList.remove('scrolled');
                }
            });
        </script>
    </body>
</html>