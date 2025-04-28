<%-- 
    Document   : contactUs
    Created on : Apr 14, 2025, 4:20:03 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contactUs.css">
        <title>Contact Us</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>


        <div class="container">
            <header>
                <h1>Contact Us</h1>
                <p>We'd love to hear from you. Please fill out the form below or use our contact information.</p><br>
            </header>

            <div class="content">
                <!-- Contact Form Section -->
                <section class="form-section">
                    <div class="card" id="contact-form">
                        <h2>Send Us a Message</h2>
                        <form id="messageForm">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" id="name" class="form-control" placeholder="Your name" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" class="form-control" placeholder="Your email address" required>
                            </div>
                            <div class="form-group">
                                <label for="subject">Subject</label>
                                <input type="text" id="subject" class="form-control" placeholder="Subject of your message" required>
                            </div>
                            <div class="form-group">
                                <label for="message">Message</label>
                                <textarea id="message" class="form-control" placeholder="Your message" required></textarea>
                            </div>
                            <button type="submit" class="btn">Send Message</button>
                        </form>
                    </div>

                    <!-- Success Message (Hidden by default) -->
                    <div class="card success-message" id="success-message">
                        <div class="success-icon">✓</div>
                        <h3 class="success-title">Thank You!</h3>
                        <p class="success-text">Your message has been sent successfully. We'll get back to you as soon as possible.</p>
                        <button class="btn" id="send-another">Send Another Message</button>
                    </div>
                </section>

                <!-- Contact Info Section -->
                <section class="info-section">
                    <div class="card">
                        <h2>Contact Information</h2>

                        <div class="contact-item">
                            <div class="contact-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                <circle cx="12" cy="10" r="3"></circle>
                                </svg>
                            </div>
                            <div class="contact-details">
                                <p class="contact-label">Address</p>
                                <p class="contact-text">123 Business Avenue, Suite 100<br>San Francisco, CA 94107</p>
                            </div>
                        </div>

                        <div class="contact-item">
                            <div class="contact-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                                </svg>
                            </div>
                            <div class="contact-details">
                                <p class="contact-label">Phone</p>
                                <p class="contact-text">+1 (555) 123-4567</p>
                            </div>
                        </div>

                        <div class="contact-item">
                            <div class="contact-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                                <polyline points="22,6 12,13 2,6"></polyline>
                                </svg>
                            </div>
                            <div class="contact-details">
                                <p class="contact-label">Email</p>
                                <p class="contact-text">contact@yourcompany.com</p>
                            </div>
                        </div>

                        <div style="margin-top: 25px;">
                            <h3 style="font-size: 1.2rem; margin-bottom: 15px; color: var(--bdazzled-blue);">Business Hours</h3>
                            <div class="hours-item">
                                <span class="hours-day">Monday - Friday:</span>
                                <span>9:00 AM - 6:00 PM</span>
                            </div>
                            <div class="hours-item">
                                <span class="hours-day">Saturday:</span>
                                <span>10:00 AM - 4:00 PM</span>
                            </div>
                            <div class="hours-item">
                                <span class="hours-day">Sunday:</span>
                                <span>Closed</span>
                            </div>
                        </div>

                        <div style="margin-top: 25px;">
                            <h3 style="font-size: 1.2rem; margin-bottom: 15px; color: var(--bdazzled-blue);">Follow Us</h3>
                            <div class="social-links">
                                <button class="social-btn">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path>
                                    </svg>
                                </button>
                                <button class="social-btn">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
                                    <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
                                    <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line>
                                    </svg>
                                </button>
                                <button class="social-btn">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M22 4s-.7 2.1-2 3.4c1.6 10-9.4 17.3-18 11.6 2.2.1 4.4-.6 6-2C3 15.5.5 9.6 3 5c2.2 2.6 5.6 4.1 9 4-.9-4.2 4-6.6 7-3.8 1.1 0 3-1.2 3-1.2z"></path>
                                    </svg>
                                </button>
                                <button class="social-btn">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"></path>
                                    <rect x="2" y="9" width="4" height="12"></rect>
                                    <circle cx="4" cy="4" r="2"></circle>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        
        <section class="location-section">
    <div class="card full-width-map">
        <h2>Our Location</h2>
        <div class="map-container">
            <div class="map-placeholder"></div>
            <div class="map-pin">
                <div class="map-pin-inner"></div>
            </div>
        </div>
        <p>
            We're conveniently located in the heart of the business district, with easy access to public transportation and parking.
        </p>
    </div>
</section>

        <!-- Testimonials Section -->
        <section id="testimonials" class="testimonials">
            <div class="container">
                <div class="section-header">
                    <div class="badge">Testimonials</div>
                    <h2 class="section-title">Loved by businesses worldwide</h2>
                    <p class="section-description">
                        Don't just take our word for it. Here's what our customers have to say.
                    </p>
                </div>

                <div class="testimonial-grid">
                    <div class="testimonial-card">
                        <div class="testimonial-content">

                            <div>
                                <p class="testimonial-text">
                                    "StreamLine has completely transformed how our team works. We've cut meeting time in half and
                                    increased our delivery speed by 35%."
                                </p>
                                <h4 class="testimonial-author">Sarah Johnson</h4>

                            </div>
                        </div>
                    </div>

                    <div class="testimonial-card">
                        <div class="testimonial-content">

                            <div>
                                <p class="testimonial-text">
                                    "The automation features alone have saved us countless hours. Our team can now focus on what
                                    really matters instead of repetitive tasks."
                                </p>
                                <h4 class="testimonial-author">Michael Chen</h4>

                            </div>
                        </div>
                    </div>

                    <div class="testimonial-card">
                        <div class="testimonial-content">

                            <div>
                                <p class="testimonial-text">
                                    "As a remote team, StreamLine has been essential for keeping everyone aligned and productive.
                                    The ROI has been incredible."
                                </p>
                                <h4 class="testimonial-author">Emily Rodriguez</h4>

                            </div>
                        </div>
                    </div>

                    <div class="testimonial-card">
                        <div class="testimonial-content">

                            <div>
                                <p class="testimonial-text">
                                    "The customer support is exceptional. Any time we've had questions, the team has been quick to
                                    respond and incredibly helpful."
                                </p>
                                <h4 class="testimonial-author">David Park</h4>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <%@ include file="footer.jsp" %>

        <script>
            // Simple form handling
            document.getElementById('messageForm').addEventListener('submit', function (e) {
                e.preventDefault();

                // Hide form and show success message
                document.getElementById('contact-form').style.display = 'none';
                document.getElementById('success-message').style.display = 'block';

                // Reset form
                this.reset();
            });

            // Send another message button
            document.getElementById('send-another').addEventListener('click', function () {
                document.getElementById('contact-form').style.display = 'block';
                document.getElementById('success-message').style.display = 'none';
            });
        </script>

    </body>
</html>
