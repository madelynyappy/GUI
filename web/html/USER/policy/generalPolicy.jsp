<%-- 
    Document   : generalPrivacy
    Created on : Apr 14, 2025, 3:29:22 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Our Policies</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/generalPolicy.css">
    </head>
    <%@ include file="../home/header.jsp" %>

    <section class="hero-section">
        <div class="overlay">
            <h1>The Policy We Provide</h1>
            <p>summary for what is policy</p>
            <a href="home/contactUs.jsp" class="enquiry-btn">Enquiry Us for More</a>
        </div>
    </section>
<section class="policy-section">
  <div class="policy-container">

    <!-- Image Left -->
    <div class="policy-card alt-image-left">
      <div class="policy-image">
        <img src="../../../images/privacy.jpg" alt="Privacy Policy Image" />
      </div>
      <div class="policy-content">
        <h2>Privacy Policy</h2>
        <p>Learn how we collect, use, and protect your personal data.</p>
        <a href="privacy.jsp" class="learn-more-btn">Learn More</a>
      </div>
    </div>

    <!-- Image Right -->
    <div class="policy-card alt-image-right">
      <div class="policy-content">
        <h2>Terms & Conditions</h2>
        <p>Understand the rules and conditions for using our services.</p>
        <a href="tandc.jsp" class="learn-more-btn">Learn More</a>
      </div>
      <div class="policy-image">
        <img src="../../../images/terms.jpg" alt="Terms and Conditions Image" />
      </div>
    </div>

    <!-- Image Left -->
    <div class="policy-card alt-image-left">
      <div class="policy-image">
        <img src="../../../images/shipping.jpg" alt="Shipping and Delivery Image" />
      </div>
      <div class="policy-content">
        <h2>Shipping & Delivery Policy</h2>
        <p>Information about shipping methods, timelines, and charges.</p>
        <a href="dands.jsp" class="learn-more-btn">Learn More</a>
      </div>
    </div>

    <!-- Image Right -->
    <div class="policy-card alt-image-right">
      <div class="policy-content">
        <h2>Return & Refund Policy</h2>
        <p>Details on how you can return items and request refunds.</p>
        <a href="randr.jsp" class="learn-more-btn">Learn More</a>
      </div>
      <div class="policy-image">
        <img src="../../../images/refund.jpg" alt="Return and Refund Image" />
      </div>
    </div>

    <!-- Image Left -->
    <div class="policy-card alt-image-left">
      <div class="policy-image">
        <img src="../../../images/health.jpg" alt="Health and Safety Image" />
      </div>
      <div class="policy-content">
        <h2>Health & Safety Disclaimer</h2>
        <p>Important notes on health responsibilities and disclaimers.</p>
        <a href="hands.jsp" class="learn-more-btn">Learn More</a>
      </div>
    </div>

    <!-- Image Right -->
    <div class="policy-card alt-image-right">
      <div class="policy-content">
        <h2>Contact & Support Policy</h2>
        <p>How to reach us for help, support, or inquiries.</p>
        <a href="cands.jsp" class="learn-more-btn">Learn More</a>
      </div>
      <div class="policy-image">
        <img src="../../../images/contact.jpg" alt="Contact Support Image" />
      </div>
    </div>

  </div>
</section>

    <%@ include file="../home/footer.jsp" %>
</body>
</html>
