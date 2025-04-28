<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signIn.css">
    </head>
    <body>
        <div class="container">
            <div class="logo-container">
                <img src="logo.png" alt="FitHub Logo">
            </div>
            <div class="login-box">
                <h2>Sign in</h2>
                <form action="home.jsp" method="post">
                    <label for="userID">USER ID</label>
                    <input type="text" id="userID" name="userID" placeholder="Input" required>

                    <label for="password">USER PASSWORD</label>
                    <div class="password-wrapper">
                        <input type="password" id="password" name="password" placeholder="Input" required>
                        <i class="fa-solid fa-eye eye-icon" id="togglePassword"></i>
                    </div>

                    <a href="#" class="forgot-password">Forgot your password?</a>

                    <p style="margin-top: 20px;">
                        <label>
                            <input type="checkbox" name="agree" required>
                            By creating an account, you agree to abide by our <a href="#" id="terms-link">Terms and Conditions</a>.
                        </label>
                    </p>

                    <div class="button-wrapper">
                        <button type="submit" class="continue-btn">Continue</button>
                    </div>
                </form>                
            </div>

            <div class="signup-section">
                <div class="signup-title">
                    <span>New to FitHub?</span>
                </div>
                <a href="signUp1.jsp" class="signup-button">Create your FitHub account</a>
            </div>
        </div>

        <div id="terms-modal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h3>Terms and Conditions</h3>
                <iframe src="tnc.jsp" width="100%" height="300" style="border: none;"></iframe>
            </div>
        </div>

        <script>
            const toggle = document.getElementById('togglePassword');
            const password = document.getElementById('password');

            toggle.addEventListener('click', function () {
                const isHidden = password.getAttribute('type') === 'password';
                password.setAttribute('type', isHidden ? 'text' : 'password');

                if (isHidden) {
                    this.classList.remove('fa-eye');
                    this.classList.add('fa-eye-slash');
                } else {
                    this.classList.remove('fa-eye-slash');
                    this.classList.add('fa-eye');
                }
            });

            const modal = document.getElementById("terms-modal");
            const link = document.getElementById("terms-link");
            const closeBtn = document.querySelector(".modal .close");

            link.onclick = function (event) {
                event.preventDefault();
                modal.style.display = "block";
            };

            closeBtn.onclick = function () {
                modal.style.display = "none";
            };

            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            };
        </script>
    </body>
</html>
