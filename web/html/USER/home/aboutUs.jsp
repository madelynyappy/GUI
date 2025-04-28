<%-- 
    Document   : aboutUs
    Created on : Apr 14, 2025, 4:13:29 PM
    Author     : Madelyn Yap
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>About Us - FitHub</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutUs.css">
    </head>
    <body>
        <%@ include file="header.jsp" %>

        <section class="video-hero" id="video-hero">
            <video autoplay muted loop playsinline class="video-bg">
                <source src="${pageContext.request.contextPath}/images/aboutVideo.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
            <div class="video-overlay">
                <h1>About FitHub</h1>
                <p>Your #1 destination for fitness, strength & health gear</p>
            </div>
        </section>


        <section class="mission-section">
            <div class="mission-heading text-center py-5">
                <h2 class="display-5 fw-bold text-primary d-flex justify-content-center align-items-center gap-2">
                    <i class="bi bi-bullseye"></i>
                    Our Mission
                </h2>
                <p class="lead text-muted mt-3 mb-0 px-3 text-center">
                    At <strong>FitHub</strong>, we believe that fitness should be accessible to everyone, 
                    regardless of age or experience. 
                </p>
            </div>


            <div class="mission-card-container">
                <!-- Card 1 -->
                <div class="card">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
                    <path d="M15.854 5.646a.5.5 0 0 0-.708-.708L11.5 8.586 10.354 7.44a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l4-4z"/>
                    <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm6-6a3 3 0 1 0-6 0 3 3 0 0 0 6 0z"/>
                    </svg>
                    <div class="card__content">
                        <p class="card__title">Inclusivity</p>
                        <p class="card__description">Fitness is for all — from teens to seniors, everyone deserves to stay active and healthy.</p>
                    </div>
                </div>

                <!-- Card 2 -->
                <div class="card">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-check2-circle" viewBox="0 0 16 16">
                    <path d="M2.5 8a5.5 5.5 0 1 1 11 0 5.5 5.5 0 0 1-11 0zm10.5 0a6.5 6.5 0 1 0-13 0 6.5 6.5 0 0 0 13 0z"/>
                    <path d="M10.97 5.97a.75.75 0 0 1 1.071 1.05L7.477 12l-3.5-3.5a.75.75 0 1 1 1.06-1.06l2.47 2.47 3.463-4.94z"/>
                    </svg>
                    <div class="card__content">
                        <p class="card__title">Quality</p>
                        <p class="card__description">We deliver durable, effective fitness gear that stands the test of time and effort.</p>
                    </div>
                </div>

                <!-- Card 3 -->
                <div class="card">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-journal-text" viewBox="0 0 16 16">
                    <path d="M3 1.5v13h10v-13H3zm1 1h8v11H4v-11z"/>
                    <path d="M5 3.5h6v1H5v-1zm0 2h6v1H5v-1z"/>
                    </svg>
                    <div class="card__content">
                        <p class="card__title">Education</p>
                        <p class="card__description">We share expert fitness tips, training guides, and wellness knowledge for every stage.</p>
                    </div>
                </div>

                <!-- Card 4 -->
                <div class="card">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-lightbulb-fill" viewBox="0 0 16 16">
                    <path d="M2 6a6 6 0 1 1 12 0c0 2.25-1.445 3.688-2.5 4.5h-7C3.445 9.688 2 8.25 2 6z"/>
                    <path d="M5.5 11a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5z"/>
                    <path d="M6 13.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v.5h-4v-.5z"/>
                    </svg>
                    <div class="card__content">
                        <p class="card__title">Innovation</p>
                        <p class="card__description">We bring you cutting-edge fitness equipment with the latest in sports tech.</p>
                    </div>
                </div>

                <!-- Card 5 -->
                <div class="card">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-people" viewBox="0 0 16 16">
                    <path d="M13 6.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                    <path d="M1 6.5a2.5 2.5 0 1 1 5 0 2.5 2.5 0 0 1-5 0z"/>
                    <path d="M13 14s-1 0-1-1 1-4 4-4 4 3 4 4-1 1-1 1h-6zm-12 0s-1 0-1-1 1-4 4-4 4 3 4 4-1 1-1 1H1z"/>
                    </svg>
                    <div class="card__content">
                        <p class="card__title">Community</p>
                        <p class="card__description">We support a passionate fitness community — pushing each other to grow stronger every day.</p>
                    </div>
                </div>
            </div>
        </section>


        <!-- Promotion Highlight -->
        <section class="promo-section">
            <h2>Special Promotions Just for You!</h2>
            <p>Discover exclusive deals and discounts on our best-selling fitness gear and accessories.</p>
            <a href="${pageContext.request.contextPath}/html/USER/promotion/promotion.jsp" class="btn">Explore Promotions</a>
        </section>

        <!-- Brand Collaborators -->
        <section class="brand-slider">
            <div class="brand-slider-container">
                <div class="brand-track">
                    <!-- duplicated images for seamless loop -->
                    <img src="${pageContext.request.contextPath}/images/nike.png" alt="Nike">
                    <img src="${pageContext.request.contextPath}/images/adidas.png" alt="Adidas">
                    <img src="${pageContext.request.contextPath}/images/underarmour.png" alt="Under Armour">
                    <img src="${pageContext.request.contextPath}/images/puma.png" alt="Puma">
                    <img src="${pageContext.request.contextPath}/images/reebok.png" alt="Reebok">
                    <img src="${pageContext.request.contextPath}/images/rogue.png" alt="Rogue">
                    <img src="${pageContext.request.contextPath}/images/gymshark.jpg" alt="Gymshark">

                    <!-- duplicate for loop -->
                    <img src="${pageContext.request.contextPath}/images/nike.png" alt="Nike">
                    <img src="${pageContext.request.contextPath}/images/adidas.png" alt="Adidas">
                    <img src="${pageContext.request.contextPath}/images/underarmour.png" alt="Under Armour">
                    <img src="${pageContext.request.contextPath}/images/puma.png" alt="Puma">
                    <img src="${pageContext.request.contextPath}/images/reebok.png" alt="Reebok">
                    <img src="${pageContext.request.contextPath}/images/rogue.png" alt="Rogue">
                    <img src="${pageContext.request.contextPath}/images/gymshark.jpg" alt="Gymshark">
                </div>
            </div>
        </section>

        <section class="site-overview">
            <h2>Explore More with FitHub</h2>
            <p>We’re more than just an online store. Dive into everything FitHub has to offer:</p>

            <div class="overview-container">
            <div class="overview-grid">
                <!-- Blog -->
                <a href="${pageContext.request.contextPath}/html/USER/blog/blog.jsp" class="overview-card">
                    <i class="bi bi-journal-text"></i>
                    <h3>Blog</h3>
                    <p>Read expert-written articles and real-world fitness success stories.</p>
                </a>

                <!-- FAQ -->
                <a href="${pageContext.request.contextPath}/html/USER/home/faq.jsp" class="overview-card">
                    <i class="bi bi-question-circle"></i>
                    <h3>FAQ</h3>
                    <p>Get answers to common questions about our products, services, and support.</p>
                </a>

                <!-- Product Categories -->
                <div class="overview-card dropdown-card">
                    <i class="bi bi-box-seam"></i>
                    <h3>Product Categories</h3>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/html/USER/product/dumbbells.jsp">Dumbbells</a></li>
                        <li><a href="${pageContext.request.contextPath}/html/USER/product/cardio.jsp">Cardio</a></li>
                        <li><a href="${pageContext.request.contextPath}/html/USER/product/yoga.jsp">Yoga</a></li>
                        <li><a href="${pageContext.request.contextPath}/html/USER/product/accessories.jsp">Accessories</a></li>
                        <li><a href="${pageContext.request.contextPath}/html/USER/product/randw.jsp">Recovery & Wellness</a></li>
                    </ul>
                </div>

            </div>
            </div>
        </section>
        <%@ include file="footer.jsp" %>
    </body>
</html>

