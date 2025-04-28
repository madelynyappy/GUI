<%-- 
    Document   : randw
    Created on : Apr 14, 2025, 3:59:44 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/categoryDetails.css">
        <title>Recovery and Wellness | FITHUB </title>
    </head>
    <body>
        <%@ include file="../home/header.jsp" %>

        <section class="video-hero" id="video-hero">
            <video autoplay muted loop playsinline class="video-bg">
                <source src="${pageContext.request.contextPath}/images/randw.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
            <div class="video-overlay">
                <h1>About FitHub</h1>
                <p>Your #1 destination for fitness, strength & health gear</p>
            </div>
        </section>
        
        <%@ include file="../home/footer.jsp" %>

    </body>
</html>
