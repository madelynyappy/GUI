<%-- 
    Document   : blogDetails
    Created on : Apr 14, 2025, 3:58:57 PM
    Author     : Madelyn Yap
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/blogdetails.css">

        <title>Blog | FITHUB</title>
    </head>
    <body>
        <%@ include file="../home/header.jsp" %>

        <%
    String id = request.getParameter("id");
        %>

        <main class="blog-detail-container">
            <% if ("1".equals(id)) { %>
            <section class="blog-hero">
                <div class="container">
                    <h1>Best Home Workout Equipment for 2024</h1>
                    <p>Staying fit at home has never been easier, thanks to innovative fitness equipment designed for all levels. Whether you're looking to build muscle, improve endurance, or stay active, having the right gear can make all the difference. Here are the best home workout equipment options for 2024:</p>
                </div>
            </section>

            <section class="blog-content">
                <div class="container">
                    <h2>1. Adjustable Dumbbells</h2>
                    <p>A must-have for strength training, adjustable dumbbells allow you to modify weight settings for progressive overload without cluttering your space.</p>

                    <h2>2. Resistance Bands</h2>
                    <p>Perfect for strength and mobility training, resistance bands add variety to your workouts and help activate muscles effectively.</p>

                    <h2>3. Smart Jump Rope</h2>
                    <p>Elevate your cardio workouts with a smart jump rope that tracks jump count, calories burned, and workout time via an app.</p>

                    <h2>4. Foldable Treadmill</h2>
                    <p>Ideal for small spaces, a foldable treadmill offers convenience and functionality for walking or running indoors.</p>

                    <h2>5. Kettlebells</h2>
                    <p>Great for dynamic strength training, kettlebells enhance functional movements and improve grip strength.</p>

                    <div class="product-recommendation">
                        <h3>Recommended Products:</h3>
                        <ul>
                            <li>FitHub Adjustable Dumbbells (20kg-40kg)</li>
                            <li>FitHub Resistance Bands Set</li>
                            <li>FitHub Smart Jump Rope Pro</li>
                            <li>FitHub Foldable Treadmill</li>
                            <li>FitHub Cast Iron Kettlebell Set</li>
                        </ul>
                    </div>
                </div>
            </section>

            <% } else if ("2".equals(id)) { %>
            <section class="blog-hero">
                <div class="container">
                    <h1>How to Choose the Right Running Shoes</h1>
                    <p>The right pair of running shoes can enhance performance, prevent injuries, and provide optimal comfort. Here’s a guide to help you find your perfect pair:</p>
                </div>
            </section>

            <section class="blog-content">
                <div class="container">
                    <h2>1. Understand Your Foot Type</h2>
                    <p>Identify whether you have a neutral arch, high arch, or flat feet to determine the necessary support.</p>

                    <h2>2. Consider Cushioning & Support</h2>
                    <p>Choose shoes with adequate cushioning based on your running surface and personal preference for comfort.</p>

                    <h2>3. Know Your Running Style</h2>
                    <p>Analyze your gait (heel striker, midfoot striker, or forefoot striker) to select a shoe that provides the best impact absorption.</p>

                    <h2>4. Check Shoe Fit</h2>
                    <p>Ensure a snug fit without tightness. Leave about a thumb’s width of space between your longest toe and the shoe’s tip.</p>

                    <h2>5. Pick the Right Sole</h2>
                    <p>For road running, opt for lightweight and cushioned shoes. For trails, choose durable shoes with better grip and support.</p>

                    <div class="product-recommendation">
                        <h3>Recommended Products:</h3>
                        <ul>
                            <li>FitHub Pro Running Shoes (Men & Women)</li>
                            <li>FitHub Trail Running Shoes</li>
                            <li>FitHub High-Performance Insoles</li>
                        </ul>
                    </div>
                </div>
            </section>

            <% } else if ("3".equals(id)) { %>
            <section class="blog-hero">
                <div class="container">
                    <h1>5 Strength Training Mistakes to Avoid</h1>
                    <p>Strength training is essential for building muscle and increasing endurance, but common mistakes can hinder progress. Avoid these errors for better results:</p>
                </div>
            </section>

            <section class="blog-content">
                <div class="container">
                    <h2>1. Skipping Warm-Up</h2>
                    <p>Failing to warm up can lead to injuries and reduced performance. Spend at least 5-10 minutes on mobility exercises.</p>

                    <h2>2. Using Improper Form</h2>
                    <p>Poor form can cause joint pain and injuries. Start with lighter weights and focus on technique before increasing resistance.</p>

                    <h2>3. Lifting Too Heavy, Too Soon</h2>
                    <p>Gradually increase weights rather than rushing into heavy lifting, which can strain muscles and lead to setbacks.</p>

                    <h2>4. Neglecting Rest Days</h2>
                    <p>Muscle recovery is crucial for growth. Ensure 1-2 rest days per week for optimal results.</p>

                    <h2>5. Not Tracking Progress</h2>
                    <p>Logging your workouts helps identify improvements and adjust routines accordingly.</p>

                    <div class="product-recommendation">
                        <h3>Recommended Products:</h3>
                        <ul>
                            <li>FitHub Adjustable Dumbbells</li>
                            <li>FitHub Weightlifting Gloves</li>
                            <li>FitHub Power Rack for Home Gym</li>
                            <li>FitHub Smart Workout Journal</li>
                        </ul>
                    </div>
                </div>
            </section>

            <% } else if ("4".equals(id)) { %>
            <section class="blog-hero">
                <div class="container">
                    <h1>Nutrition Tips for Peak Performance</h1>
                    <p>Proper nutrition fuels workouts, aids recovery, and enhances overall fitness. Follow these key nutrition tips:</p>
                </div>
            </section>

            <section class="blog-content">
                <div class="container">
                    <h2>1. Prioritize Protein Intake</h2>
                    <p>Protein supports muscle repair and growth. Aim for lean protein sources like chicken, fish, tofu, and protein shakes.</p>

                    <h2>2. Stay Hydrated</h2>
                    <p>Dehydration can cause fatigue and poor performance. Drink at least 2-3 liters of water daily.</p>

                    <h2>3. Balance Macronutrients</h2>
                    <p>Carbs provide energy, proteins aid in recovery, and healthy fats support overall function. Maintain a balanced diet.</p>

                    <h2>4. Eat Pre- & Post-Workout Meals</h2>
                    <p>A combination of carbs and protein before and after exercise enhances endurance and speeds up muscle recovery.</p>

                    <h2>5. Take Necessary Supplements</h2>
                    <p>Supplements like BCAAs, whey protein, and multivitamins can fill gaps in your diet when needed.</p>

                    <div class="product-recommendation">
                        <h3>Recommended Products:</h3>
                        <ul>
                            <li>FitHub Whey Protein Powder</li>
                            <li>FitHub BCAA Recovery Drink</li>
                            <li>FitHub Energy Hydration Pack</li>
                        </ul>
                    </div>
                </div>
            </section>

            <% } else if ("5".equals(id)) { %>
            <section class="blog-hero">
                <div class="container">
                    <h1>Beginner's Guide to Weightlifting</h1>
                    <p>Weightlifting is an excellent way to build strength, but beginners often feel overwhelmed. Here’s a step-by-step guide:</p>
                </div>
            </section>

            <section class="blog-content">
                <div class="container">
                    <h2>1. Start with Compound Movements</h2>
                    <p>Focus on exercises that target multiple muscle groups, such as squats, deadlifts, and bench presses.</p>

                    <h2>2. Use Proper Form & Technique</h2>
                    <p>Avoid injuries by learning the correct form from trainers or reputable online sources.</p>

                    <h2>3. Progress Gradually</h2>
                    <p>Begin with light weights and progressively increase resistance while maintaining good form.</p>

                    <h2>4. Follow a Structured Program</h2>
                    <p>A structured plan helps track progress and ensures balanced muscle development.</p>

                    <h2>5. Rest & Recover</h2>
                    <p>Adequate rest between workouts is crucial for muscle repair and growth.</p>

                    <div class="product-recommendation">
                        <h3>Recommended Products:</h3>
                        <ul>
                            <li>FitHub Barbell Set</li>
                            <li>FitHub Weightlifting Belt</li>
                            <li>FitHub Squat Rack</li>
                            <li>FitHub Muscle Recovery Foam Roller</li>
                        </ul>
                    </div>
                </div>
            </section>

            <% } else { %>
            <section class="not-found">
                <div class="container">
                    <h1>Blog not found</h1>
                </div>
            </section>
            <% } %>
        </main>


        <%@ include file="../home/footer.jsp" %>
    </body>
</html>
