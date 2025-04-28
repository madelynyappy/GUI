<!DOCTYPE html>
<!--
http://localhost:8080/try5/regis.html
-->
<!DOCTYPE html>
<html>
    <head>
        <style>

        </style>

        <title>Create Staff Account</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Create Staff Account!</h1>
        <form action="StaffRegis" method="post">
            <div>
                <label for="staffID" class="required">Staff ID</label>
                <input type="text" id="staffID" name="staffID" required>
            </div>

            <div>
                <label for="staffName" class="required">Full Name</label>
                <input type="text" id="staffName" name="staffName" required>
            </div>

            <div>
                <label for="staffContactNumber" class="required">Contact Number</label>
                <input type="text" id="staffContactNumber" name="staffContactNumber" required>
            </div>

            <div>
                <label for="staffEmail" class="required">Email</label>
                <input type="email" id="staffEmail" name="staffEmail" required>
            </div>

            <div>
                <label for="staffAddress" class="required">Address</label>
                <textarea id="staffAddress" name="staffAddress" required></textarea>
            </div>

            <div>
                <label for="staffUserName" class="required">Username</label>
                <input type="text" id="staffUserName" name="staffUserName" required>
            </div>

            <div>
                <label for="staffPassword" class="required">Password</label>
                <input type="password" id="staffPassword" name="staffPassword" required>
            </div>

            <div>
                <label for="staffPasswordConfirm" class="required">Confirm Password</label>
                <input type="password" id="staffPasswordConfirm" name="staffPasswordConfirm" required>
            </div>

            <div>
                <label for="staffRoleTitle" class="required">Role Title</label>
                <select id="staffRoleTitle" name="staffRoleTitle" required>
                    <option value="">Select a role</option>
                    <option value="Manager">Manager</option>
                    <option value="Sales Assistant">Sales Assistant</option>
                    <option value="Administrator">Administrator</option>
                    <option value="Support Staff">Support Staff</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div>
                <label for="staffStatus" class="required">Status</label>
                <select id="staffStatus" name="staffStatus" required>
                    <option value="">Select status</option>
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                    <option value="On Leave">On Leave</option>
                </select>
            </div>
            <div>
                <label for="staffLastLogin">Last Login Date</label>
                <input type="date" name="staffLastLogin">
            </div>

            <div>
                <button type="submit">Register Staff</button>
            </div>
        </form>
    </body>
</html>
