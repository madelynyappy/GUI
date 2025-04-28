<%-- 
    Document   : faq
    Created on : Apr 14, 2025, 3:49:15 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/faq.css">
        <title>FAQ - FitHub</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>

        <div class="faq-header">
            <h1>FAQ</h1>
            <p style="text-align:center;">Frequently Asked Questions (FAQ)</p>
            <div class="faq-tabs">
                <a href="#payment">💳 Payment</a>
                <a href="#delivery">🚚 Delivery</a>
                <a href="#product">🛒 Product</a>
                <a href="#account">👤 Account</a>
            </div>
        </div>       

        <!-- Payment FAQ -->
        <div class="faq-wrapper">
            <div class="faq-section">
                <h2 id="payment">💳 Payment FAQ</h2>   
                <div class="faq-item">
                    <div class="faq-question">
                        What payment methods are accepted?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">We accept credit cards, debit cards, online banking, and e-wallets such as Touch 'n Go and GrabPay.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Can I pay by cash on delivery (COD)?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">No, we currently do not support COD. All payments must be made online.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Is it safe to enter my card details on your website?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Yes, our website uses secure encryption and follows industry-standard security protocols to protect your data.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Can I use multiple payment methods for a single order?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">No, only one payment method can be used per transaction.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Why did my payment fail?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Common reasons include insufficient balance, incorrect card details, or bank rejection. Try another method or contact your bank.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Will I receive a receipt after payment?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Yes, an electronic receipt and order confirmation will be sent to your email.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Are there additional charges like taxes?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Prices include standard sales tax. Any additional delivery or express charges will be shown before checkout.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Can I see my card details for future use?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">For security reasons, we do not store card details on our servers.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Do you offer installment payment plans?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Currently, we do not support installment plans.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        How do I request a refund?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Please contact customer service. Refunds are processed based on our return policy.</div>
                </div>
            </div>
        </div>

        <!-- Delivery FAQ -->
        <div class="faq-wrapper">
            <div class="faq-section">
                <h2 id="delivery">🚚 Delivery FAQ</h2>
                <div class="faq-item">
                    <div class="faq-question">
                        How long does delivery take?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Standard delivery takes 3–5 working days, depending on your location.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Do you offer express delivery?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Yes, express delivery is available for selected areas with an extra charge.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Is delivery free?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Delivery is free for above RM1000. Otherwise, a flat rate of RM25 applies.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Can I track my order?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Yes, a tracking link will be provided via email once your order is shipped.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        What courier service do you use?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">We use trusted partners such as J&T Express, Ninja Van, and Pos Laju.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Can I change my delivery address after placing an order?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Please contact customer service immediately. Address changes are not guaranteed if the order is already processed.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        What happens if I'm not home during delivery?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">The courier will usually attempt re-delivery or leave a pickup notice.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Can I pick up the order myself?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Currently, we do not offer self-pickup.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Do you ship internationally?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">No, we currently only deliver within Malaysia.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        What should I do if my package is damaged or missing?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Contact our support team with your order number and photo evidence if applicable.</div>
                </div>
            </div>
        </div>

        <!-- Product & Ordering FAQ -->
        <div class="faq-wrapper">
            <div class="faq-section">
                <h2 id="product">🛒 Product & Ordering FAQ</h2>
                <div class="faq-item">
                    <div class="faq-question">
                        Are the products original and branded?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Yes, all our fitness equipment is original and sourced from trusted suppliers.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Do you restock sold-out items?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Yes, restocking timelines vary. You may sign up for restock alerts.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        How do I know which equipment suits me?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Refer to our product guides or consult our support team for advice.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Can I cancel my order after placing it?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Orders can only be canceled before they are shipped. Contact us quickly if needed.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Is there a minimum order value?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">No, there is no minimum order required.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        How do I use the promotion codes?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Enter the code during checkout to apply available discounts.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Can I buy products in bulk?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Yes, for bulk orders, contact our sales team for special pricing.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        What should I do if I received the wrong item?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Please notify our support within 3 days of receiving the item.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Are the weights calibrated accurately?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Yes, our weights meet standard manufacturing precision.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Can I customize a product set(e.g., dumbbell + mat)?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">We offer set bundles from time to time; check our promotion page.</div>
                </div>
            </div>
        </div>

        <!-- Account & Technical Support FAQ -->
        <div class="faq-wrapper">
            <div class="faq-section">
                <h2 id="account">👤 Account & Technical Support FAQ</h2>
                <div class="faq-item">
                    <div class="faq-question">
                        How do I create an account?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Click on “Register” and fill in your personal information to get started.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        I forgot my password. What should I do?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Use the “Forgot Password” link to reset your password via email.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Can I edit my account details?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Yes, once logged in, you can update your name, email, and address.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Is my personal information secure?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Yes, we apply security best practices and encryption to protect your data.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Can I delete my account permanently?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Submit a request through customer support to deactivate your account.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Why can't I log into my account?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Ensure your credentials are correct. If issues persist, reset your password or contact support.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Can I have multiple accounts with the same email?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">No, each email can only be registered once.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        How do I track my order status in my account?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Login, go to "My Orders", and check the latest status updates.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        Do I need an account to place an order?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">Yes, registration is required to complete a purchase.</div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        How can I contact support?
                        <span class="icon">▼</span>
                    </div>
                    <div class="faq-answer">You can reach us via the contact form, live chat, or call our hotline during business hours.</div>
                </div>
            </div>
        </div>

        <button onclick="window.scrollTo({top: 0, behavior: 'smooth'})"
                style="position:fixed;bottom:20px;right:20px;padding:10px 15px;
                background:#6c63ff;color:white;border:none;border-radius:50px;">
            ↑ Top
        </button>

        <%@ include file="footer.jsp" %>
    </body>

    <script>
        document.querySelectorAll('.faq-item').forEach(item => {
            item.addEventListener('click', () => {
                item.classList.toggle('active');
                const answer = item.querySelector('.faq-answer');
                if (item.classList.contains('active')) {
                    answer.style.display = 'block';
                } else {
                    answer.style.display = 'none';
                }
            });
        });
    </script>
</html>
