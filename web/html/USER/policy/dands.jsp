<%-- 
    Document   : dands
    Created on : Apr 18, 2025, 3:59:38 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/policyDetails.css">
        <title>Shipping & Delivery Policy | FitHub Sdn Bhd</title>
    </head>
    <body>
        <%@ include file="../home/header.jsp" %> 
        
<section class="policy-hero" style="background: linear-gradient(to right, rgba(48, 88, 140, 0.8), rgba(96, 147, 191, 0.8)), url('${pageContext.request.contextPath}/images/shipping.jpg') no-repeat center 65%; background-size: cover;">
    <div class="policy-hero-content">
        <h1>FITHUB SDN BHD<br>Shipping and Delivery Policy</h1>
        <p>We value your support</p>
    </div>
</section>


        <div class="policy-container">
            <!-- Sidebar -->
            <div class="policy-sidebar">
                <h3>Legal Information</h3>
                <ul>
                    <li><a href="privacy.jsp"><i class="bi bi-shield-check"></i> Privacy Policy</a></li>
                    <li><a href="tnc.jsp"><i class="bi bi-file-text"></i> Terms and Conditions</a></li>
                    <li><a href="cands.jsp"><i class="bi bi-headset"></i> Contact and Support Policy</a></li>
                    <li><a href="randr.jsp"><i class="bi bi-arrow-counterclockwise"></i> Return and Refund Policy</a></li>
                    <li><a href="hands.jsp"><i class="bi bi-exclamation-triangle"></i> Health and Safety Disclaimer</a></li>

                </ul>
            </div>

            <!-- Main content beside sidebar -->
            <div class="policy-content">
        <h1>🚚 Shipping & Delivery Policy</h1>
        <p>Effective as of March 11, 2025</p>
        <p>At <strong>FitHub Sdn Bhd</strong>, we strive to provide a smooth and reliable delivery experience. Please read our <strong>Shipping & Delivery Policy</strong> carefully before placing an order.</p>

        <h2><strong>1. Estimated Delivery Times</strong></h2>
        <p>We offer the following shipping options:</p>
        <ul>
            <li><strong>🚚 Standard Shipping:</strong> 3–5 business days</li>
            <li><strong>🚀 Expedited Shipping:</strong> 1–3 business days</li>
        </ul>
        <p>Delivery times may vary depending on your location, public holidays, and courier service availability.</p>

        <h2><strong>2. Shipping Costs & Free Shipping</strong></h2>
        <ul>
            <li>🎉 <strong>FREE SHIPPING</strong> for orders <strong>RM1,000 and above.</strong></li>
            <li>🛒 For orders <strong>below RM1,000</strong>, a <strong>flat delivery charge of RM25</strong> applies.</li>
        </ul>

        <h2><strong>3. International Shipping</strong></h2>
        <p><strong>🌍 We currently ship to selected international locations.</strong></p>
        <ul>
            <li>Shipping fees and delivery times vary based on destination.</li>
            <li>Customers are responsible for any <strong>customs duties, taxes, or import fees</strong> imposed by their country.</li>
            <li>Delivery estimates: <strong>7–21 business days.</strong></li>
        </ul>
        <p>📧 Contact us at <strong>fithub888@gmail.com</strong> for specific international shipping inquiries.</p>

        <h2><strong>4. Tracking Your Order</strong></h2>
        <p>Once your order is shipped, you will receive a <strong>tracking number via email</strong>.</p>

        <h2><strong>5. Lost, Delayed, or Damaged Shipments</strong></h2>
        <p>We are <strong>not responsible for shipping delays</strong> caused by:</p>
        <ul>
            <li>⚠️ <strong>Courier delays</strong> due to weather or unexpected events</li>
            <li>⚠️ <strong>Incorrect shipping address</strong> provided by the customer</li>
            <li>⚠️ <strong>Customs clearance issues</strong> (for international orders)</li>
        </ul>
        <p><strong>What to do if your order is delayed or lost?</strong></p>
        <ul>
            <li>First, check your tracking number.</li>
            <li>If there is no update after <strong>5 business days</strong>, contact us at <strong>fithub888@gmail.com</strong>.</li>
            <li>If your package is confirmed lost, <strong>we will assist you in filing a claim with the courier</strong>.</li>
        </ul>

        <h2><strong>6. Changes to Shipping & Delivery Policy</strong></h2>
        <p>We may update this policy at any time. <strong>Any changes will be posted on our website.</strong></p>
        <p>Your continued use of our store means you <strong>agree</strong> to the updated shipping terms.</p>></p>
        <p>By purchasing from FitHub Sdn Bhd, you <strong>agree</strong> to our return & refund terms.</p>
        
                    </div>
        </div>
        <%@ include file="../home/footer.jsp" %>

    </body>
</html>

