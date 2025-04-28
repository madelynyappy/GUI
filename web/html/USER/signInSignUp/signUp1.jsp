<!DOCTYPE html>
<!--
http://localhost:8080/try5/regis.html
-->
<!DOCTYPE html>
<html>
    <head>
        <title>Create Account</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signUp.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="logo-container">
            <img src="logo.png" alt="FitHub Logo">
        </div>
        <div class="container">
            <h2>Create your FitHub Account</h2>
            <p>All fields are required</p>

            <form action="signUp2.jsp" method="post">
                <p>
                    <label>First Name</label>
                    <input type="text" name="fName" placeholder="First Name" required>
                </p>
                <p>
                    <label>Last Name</label>
                    <input type="text" name="lName" placeholder="Last Name" required>
                </p>
                <p>
                    <label>Contact Number</label>
                    <input type="text" name="contact" placeholder="01X-XXXXXXX" required>
                </p>
                <p>
                    <label>Email</label>
                    <input type="text" name="email" placeholder="XXXXXX@xxx.com" required>
                </p>        
                <label for="password1">Password</label>
                <div class="password-wrapper">
                    <input type="password" id="password1" name="password" placeholder="Input" required>
                    <i class="fa-solid fa-eye eye-icon" id="togglePassword1"></i>
                </div>
                <div class="vali">
                    <ul>
                        <li><i id="charIcon" class="bi bi-x-circle-fill" style="color: red;"></i> at least 8 characters</li>
                        <li><i id="uppIcon" class="bi bi-x-circle-fill" style="color: red;"></i> at least one uppercase character</li>
                        <li><i id="lowIcon" class="bi bi-x-circle-fill" style="color: red;"></i> at least one lowercase character</li>
                        <li><i id="numIcon" class="bi bi-x-circle-fill" style="color: red;"></i> at least one number</li>
                        <li><i id="specIcon" class="bi bi-x-circle-fill" style="color: red;"></i> at least one special character</li>
                    </ul>
                </div>
                <label for="password2">Re-enter Password</label>
                <div class="password-wrapper">
                    <input type="password" id="password2" placeholder="Input" required>
                    <i class="fa-solid fa-eye eye-icon" id="togglePassword2"></i>
                </div>
                <p id="matchMsg" style="color: red; font-size: 14px;"></p>

                <p style="margin-top: 20px;">
                    <label>
                        <input type="checkbox" name="agree" required>
                        By creating an account, you agree to abide by our <a href="#" id="terms-link">Terms and Conditions</a>.
                    </label>
                </p>

                <div id="terms-modal" class="modal">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <h3>Terms and Conditions</h3>
                        <iframe src="tnc.jsp" width="100%" height="300" style="border: none;"></iframe>
                    </div>
                </div>

                <div class="button-wrapper">
                    <button type="submit" class="continue-btn">Next</button>
                </div>
            </form>
        </div>
        <script>
            function togglePassword(toggleId, inputId) {
                const toggle = document.getElementById(toggleId);
                const input = document.getElementById(inputId);

                toggle.addEventListener('click', function () {
                    const isHidden = input.getAttribute('type') === 'password';
                    input.setAttribute('type', isHidden ? 'text' : 'password');

                    if (isHidden) {
                        this.classList.remove('fa-eye');
                        this.classList.add('fa-eye-slash');
                    } else {
                        this.classList.remove('fa-eye-slash');
                        this.classList.add('fa-eye');
                    }
                });
            }

            const password1 = document.getElementById("password1");
            const password2 = document.getElementById("password2");
            const matchMsg = document.getElementById("matchMsg");

            const charIcon = document.getElementById("charIcon");
            const lowIcon = document.getElementById("lowIcon");
            const uppIcon = document.getElementById("uppIcon");
            const numIcon = document.getElementById("numIcon");
            const specIcon = document.getElementById("specIcon");

            password1.addEventListener("input", function () {
                const val = password1.value;

                updateIcon(charIcon, val.length >= 8);
                updateIcon(lowIcon, /[a-z]/.test(val));
                updateIcon(uppIcon, /[A-Z]/.test(val));
                updateIcon(numIcon, /\d/.test(val));
                updateIcon(specIcon, /[!@#$%^&*(),.?":{}|<>=+\-_;~]/.test(val));
            });

            function updateIcon(icon, isValid) {
                if (isValid) {
                    icon.classList.remove("bi-x-circle-fill");
                    icon.classList.add("bi-check-circle-fill");
                    icon.style.color = "green";
                } else {
                    icon.classList.remove("bi-check-circle-fill");
                    icon.classList.add("bi-x-circle-fill");
                    icon.style.color = "red";
                }
            }


            const form = document.querySelector("form");

            form.addEventListener("submit", function (e) {
                const val = password1.value;

                const isValidLength = val.length >= 8;
                const hasLowercase = /[a-z]/.test(val);
                const hasUppercase = /[A-Z]/.test(val);
                const hasNumber = /\d/.test(val);
                const hasSpecial = /[!@#$%^&*(),.?":{}|<>=+\-_;~]/.test(val);
                const passwordsMatch = val === password2.value;

                if (!(isValidLength && hasLowercase && hasUppercase && hasNumber && hasSpecial)) {
                    e.preventDefault();
                    matchMsg.textContent = "Password does not meet strength requirements.";
                    matchMsg.style.color = "red";
                    password1.focus();
                } else if (!passwordsMatch) {
                    e.preventDefault();
                    matchMsg.textContent = "Passwords do not match";
                    matchMsg.style.color = "red";
                    password2.focus();
                } else {
                    matchMsg.textContent = "";
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
