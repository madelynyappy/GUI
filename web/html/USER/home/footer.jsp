<%-- 
    Document   : footer
    Created on : Apr 13, 2025, 11:21:35 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    </head>
    <body>
        <footer class="footer">


            <a href="../../USER/home/home.jsp" style="text-decoration: none; color: inherit;">
                <div class="footer-title">FITHUB - 1ST Choice for Sports and Fitness Equipment</div>
            </a>



            <div class="footer-container">

                <div class="footer-column">
                    <%= application.getInitParameter("companyName") %>
                    <h3>Company Info</h3>
                    <ul>
                        <li><a href="../../USER/home/aboutUs.jsp">About Us</a></li>
                        <li><a href="../../USER/home/faq.jsp">Frequent Asked Questions</a></li>
                        <li><a href="../../USER/policy/generalPolicy.jsp">Policy Issues</a></li>
                        <li><a href="../../USER/home/contactUs.jsp">Contact Us</a></li>
                    </ul>
                </div>

                <div class="footer-column">
                    <h3>Product</h3>
                    <ul>
                        <li><a href="../../USER/product/dumbells.jsp">Dumbbells</a></li>
                        <li><a href="../../USER/product/yoga.jsp">Yoga</a></li>
                        <li><a href="../../USER/product/cardio.jsp">Cardio</a></li>
                        <li><a href="../../USER/product/accessories.jsp">Accessories</a></li>
                        <li><a href="../../USER/product/randw.jsp">Recovery & Wellness</a></li>
                    </ul>
                </div>

                <div class="footer-column">
                    <h3>Features</h3>
                    <ul>
                        <li><a href="../../USER/promotion/promotion.jsp">Promotion</a></li>
                        <li><a href="../../USER/blog.jsp">Blog</a></li>
                    </ul>
                </div>

                <div class="footer-column">
                    <h3>Get In Touch</h3>
                    <ul>
                        <li>Phone number (+60)123456789</li>
                       
                        <li>Lot S-29 & S-30, 2nd Floor,</li>
                        <li>Mid Valley Megamall, Lingkaran Syed Putra,</li>
                        <li> Mid Valley City, 59200 Kuala Lumpur,</li>
                        <li>Wilayah Persekutuan Kuala Lumpur</li>
                        <li> <%= application.getInitParameter("companyEmail") %> </li>
                    </ul>
                </div>
            </div>

            <div class="footer-bottom">
                <%= application.getInitParameter("copyright") %>
            </div>
        </footer>
    </body>
</html>
