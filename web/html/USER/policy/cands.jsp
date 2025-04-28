<%-- 
    Document   : cands
    Created on : Apr 14, 2025, 3:28:00 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/policyDetails.css">
        <title>Contact & Support | FitHub Sdn Bhd</title>
    </head>
    <body>
        <%@ include file="../home/header.jsp" %>

<section class="policy-hero" style="background: linear-gradient(to right, rgba(48, 88, 140, 0.8), rgba(96, 147, 191, 0.8)), url('${pageContext.request.contextPath}/images/contact.jpg') no-repeat center 80%; background-size: cover;">
    <div class="policy-hero-content">
        <h1>FITHUB SDN BHD<br>Contact and Support</h1>
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
                    <li><a href="dands.jsp"><i class="bi bi-truck"></i> Shipping and Delivery Policy</a></li>
                    <li><a href="randr.jsp"><i class="bi bi-arrow-counterclockwise"></i> Return and Refund Policy</a></li>
                    <li><a href="hands.jsp"><i class="bi bi-exclamation-triangle"></i> Health and Safety Disclaimer</a></li>

                </ul>
            </div>

            <!-- Main content beside sidebar -->
            <div class="policy-content">
                <h1>📞 <strong>Contact & Support Policy</strong></h1>
                <p>Effective as of March 11, 2025</p>
                <p>At <strong>FitHub Sdn Bhd</strong>, we are committed to providing excellent customer support. If you have any questions, concerns, or need assistance, please review our <strong>support guidelines</strong> below.</p>

                <h2><strong>1. Support Hours & Response Time</strong></h2>
                <p>🕒 <strong>Our customer support team is available:</strong></p>
                <ul>
                    <li><strong>Monday – Friday:</strong> 9:00 AM – 6:00 PM (GMT+8)</li>
                    <li><strong>Saturday:</strong> 10:00 AM – 2:00 PM (GMT+8)</li>
                    <li><strong>Sunday & Public Holidays:</strong> Closed</li>
                </ul>
                <p><strong>Response Time:</strong> We aim to respond to all inquiries within <strong>24–48 hours</strong> during business days.</p>

                <h2><strong>2. Contact Methods</strong></h2>
                <p>📬 <strong>Email Support</strong></p>
                <ul>
                    <li>General Inquiries: <a href="mailto:fithub888@gmail.com">fithub888@gmail.com</a></li>
                </ul>
                <p><strong>Phone Support</strong></p>
                <ul>
                    <li>Customer Service: <strong>+60123456789</strong></li>
                    <li>Available during business hours</li>
                </ul>
                <p><strong>Live Chat</strong></p>
                <ul>
                    <li>Available on our website from <strong>10:00 AM – 5:00 PM</strong> (Monday – Friday)</li>
                    <li>Response time: <strong>Instant or within 5 minutes</strong></li>
                </ul>
                <p><strong>Support Tickets</strong></p>
                <ul>
                    <li>Submit a ticket via our <strong>Help Center</strong></li>
                    <li>Track ticket status though email updates</li>
                </ul>

                <h2><strong>3. Changes to Contact & Support Policy</strong></h2>
                <p>We may update this policy at any time. <strong>Any changes will be posted on our website.</strong></p>
                <p>By using our support services, you <strong>agree</strong> to these terms.</p>
            </div>
        </div>

        <%@ include file="../home/footer.jsp" %>

    </body>
</html>
