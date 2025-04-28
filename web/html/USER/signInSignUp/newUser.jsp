<%-- 
    Document   : newUser
    Created on : Apr 14, 2025, 3:46:10 PM
    Author     : Madelyn Yap
--%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Join Fithub Community</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newUser.css">
    </head>
    <body>
        <%@ include file="../home/header.jsp" %>
        <div class="container">
            <div class="main-content">
                <!-- Background -->
                <div class="bg-image" style="background-image: url('../../../images/newUser.jpg');"></div>



                <div class="bg-overlay"></div>

                <!-- Hero Section -->
                <div class="hero">
                    <div class="hero-content">
                        <h1 class="hero-title">Say hello to the world</h1>
                        <p class="hero-description">
                            Gear up with top-quality sports equipment designed to elevate your performance, fuel your passion, and support every step of your fitness journey.
                        </p>
                       <div class="button-group">
  <a href="signUp.jsp" class="button button-primary">Sign up for free</a>
  <a href="../home/home.jsp" class="button button-outline">Browse More</a>
</div>


                    </div>
                </div>
            </div>
        </div>


        <%@ include file="../home/footer.jsp" %>
    </body>
</html>
