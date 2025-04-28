<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    </head>
    <body>
        <header class="header">
            <div class="header-container">

                <div class="left-group">
                    <div class="header-logo">
                        <a href="${pageContext.request.contextPath}/html/USER/home/home.jsp">
                            <img src="${pageContext.request.contextPath}/images/logo.png" alt="FitHub Logo">
                        </a>
                    </div>

                    <div class="nav-links">
                        <a href="${pageContext.request.contextPath}/html/USER/home/home.jsp">HOME</a>

                        <div class="nav-item">
                            <a href="${pageContext.request.contextPath}/html/USER/product/product.jsp" class="dropbtn">PRODUCT</a>
                            <div class="dropdown-content">
                                <a href="${pageContext.request.contextPath}/html/USER/product/dumbbells.jsp">Dumbbells</a>
                                <a href="${pageContext.request.contextPath}/html/USER/product/yoga.jsp">Yoga</a>
                                <a href="${pageContext.request.contextPath}/html/USER/product/cardio.jsp">Cardio</a>
                                <a href="${pageContext.request.contextPath}/html/USER/product/accessories.jsp">Accessories</a>
                                <a href="${pageContext.request.contextPath}/html/USER/product/randw.jsp">Recovery & Wellness</a>
                            </div>
                        </div>

                        <a href="${pageContext.request.contextPath}/html/USER/promotion/promotion.jsp">PROMOTION</a>
                        <a href="${pageContext.request.contextPath}/html/USER/blog/blog.jsp">BLOG</a>
                    </div>

                </div>

                <div class="right-group">
                    <form class="search-form" action="${pageContext.request.contextPath}/html/USER/home/search.jsp" method="get">
                        <input type="text" name="query" placeholder="Search Product...">
                        <button type="submit"><i class="bi bi-search"></i></button>
                    </form>

                    <div class="icon-links">
                        <a href="${pageContext.request.contextPath}/html/USER/product/cart.jsp" title="Cart">
                            <i class="bi bi-cart-fill" style="font-size: 25px; color: white;"></i>
                        </a>

                        <div class="user-dropdown">
                            <span class="user-icon" id="userIcon">
                                <i class="bi bi-person-circle user-icon"></i>
                            </span>
                            <div class="user-menu" id="userMenu">
                                <a href="${pageContext.request.contextPath}/html/USER/signInSignUp/signIn.jsp">Sign In</a>
                                <a href="${pageContext.request.contextPath}/LogoutServlet">Log Out</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const userIcon = document.getElementById("userIcon");
                const userMenu = document.getElementById("userMenu");

                userIcon.addEventListener("click", function (e) {
                    e.stopPropagation();
                    userMenu.style.display = userMenu.style.display === "flex" ? "none" : "flex";
                });

                document.body.addEventListener("click", function () {
                    userMenu.style.display = "none";
                });

                userMenu.addEventListener("click", function (e) {
                    e.stopPropagation();
                });
            });
        </script>

    </body>
</html>
