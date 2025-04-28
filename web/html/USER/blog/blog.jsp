<%-- 
    Document   : blog
    Created on : Apr 14, 2025, 4:00:05 PM
    Author     : Madelyn Yap
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Blog | FITHUB</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css">
    </head>
    <body>
        <%@ include file="../home/header.jsp" %>

        <!-- Hero Section -->
        <section class="hero">
            <div class="container">
                <h1><span>Blog</span></h1>    
            </div>
        </section>

        <!-- Blog Section -->
        <section class="blog-section">
            <div class="container">

                <!-- Blog 1 -->
                <div class="blog-post">
                    <h2 class="blog-title">Best Home Workout Equipment for 2024</h2>
                    <p class="blog-description">Staying fit at home has never been easier, thanks to innovative fitness equipment designed for all levels. Whether you're looking to build muscle, improve endurance, or stay active, having the right gear can make all the difference. Here are the best home workout equipment options for 2024:</p>
                    <a href="blogDetails.jsp?id=1" class="read-more-btn">Read More</a>
                </div>

                <!-- Blog 2 -->
                <div class="blog-post">
                    <h2 class="blog-title">How to Choose the Right Running Shoes</h2>
                    <p class="blog-description">The right pair of running shoes can enhance performance, prevent injuries, and provide optimal comfort. Here's a guide to help you find your perfect pair:</p>
                    <a href="blogDetails.jsp?id=2" class="read-more-btn">Read More</a>
                </div>

                <!-- Blog 3 -->
                <div class="blog-post">
                    <h2 class="blog-title">5 Strength Training Mistakes to Avoid</h2>
                    <p class="blog-description">Strength training is essential for building muscle and increasing endurance, but common mistakes can hinder progress. Avoid these errors for better results:</p>
                    <a href="blogDetails.jsp?id=3" class="read-more-btn">Read More</a>
                </div>

                <!-- Blog 4 -->
                <div class="blog-post">
                    <h2 class="blog-title">Nutrition Tips for Peak Performance</h2>
                    <p class="blog-description">Proper nutrition fuels workouts, aids recovery, and enhances overall fitness. Follow these key nutrition tips:</p>
                    <a href="blogDetails.jsp?id=4" class="read-more-btn">Read More</a>
                </div>

                <!-- Blog 5 -->
                <div class="blog-post">
                    <h2 class="blog-title">Beginner's Guide to Weightlifting</h2>
                    <p class="blog-description">Weightlifting is an excellent way to build strength, but beginners often feel overwhelmed. Here's a step-by-step guide:</p>
                    <a href="blogDetails.jsp?id=5" class="read-more-btn">Read More</a>
                </div>
            </div>
        </section>

        <section class="product-section">
            <h2 class="section-header">You May Also Like</h2>
            <div class="product-grid">
                <div class="product-card">
                    <img src="/placeholder.svg?height=300&width=300&text=Sport+Bottle" alt="Sport Water Bottle">
                    <h4>Sport Water Bottle</h4>
                    <p class="price">RM39.99</p>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
                <div class="product-card">
                    <img src="/placeholder.svg?height=300&width=300&text=Tumbler" alt="Insulated Tumbler">
                    <h4>Insulated Tumbler</h4>
                    <p class="price">RM44.99</p>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
                <div class="product-card">
                    <img src="/placeholder.svg?height=300&width=300&text=Collapsible" alt="Collapsible Water Bottle">
                    <h4>Collapsible Water Bottle</h4>
                    <p class="price">RM34.99</p>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
                <div class="product-card">
                    <img src="/placeholder.svg?height=300&width=300&text=Glass+Bottle" alt="Glass Water Bottle">
                    <h4>Glass Water Bottle</h4>
                    <p class="price">RM29.99</p>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
        </section>

        <%@ include file="../home/footer.jsp" %>
    </body>
</html>
