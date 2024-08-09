<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Page</title>
    <style>
        /* Add your existing CSS styles here */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f6f8f8;
            background-size: cover;
        }

        .signup-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background: #b5e8ee;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .signup-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .signup-header h1 {
            margin: 0;
            font-size: 2em;
            color: #151414;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        .form-group input,
        .form-group select,
        .form-group textarea,
        .form-group button {
            width: 100%;
            padding: 10px;
            border: 1px solid #242323;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-group button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #000033;
            color: #cf1a1a;
            font-size: 1.1em;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-group button:hover {
            background-color: #1ced09;
        }

        .error-message {
            color: #d9534f;
            margin-top: 10px;
        }

        .link-container {
            text-align: center;
            margin-top: 20px;
        }

        .link-container p {
            margin: 0;
        }

        .link-container a {
            color: #3a06f8;
            text-decoration: none;
            font-weight: bold;
        }

        .link-container a:hover {
            text-decoration: underline;
        }

        .tab {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .tab button {
            background-color: #f1f1f1;
            border: none;
            outline: none;
            padding: 14px 20px;
            cursor: pointer;
            font-size: 17px;
            transition: 0.3s;
        }

        .tab button.active {
            background-color: #006699;
        }

        .signup-form {
            display: none;
        }

        .signup-form.active {
            display: block;
        }

        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <div class="signup-header">
            <h1>User's Details</h1>
        </div>
        <div class="tab">
            <button class="tablinks active" onclick="openSignupForm(event, 'login')">User's login</button>
            <button class="tablinks" onclick="openSignupForm(event, 'signup')">User's signup</button>
        </div>
        <div id="login" class="signup-form active">
            <form action="login" method="post">
                <div class="form-group">
                    <label for="Username">Username:</label>
                    <input type="text" id="Username" name="username" placeholder="Enter your Username" required>
                </div>
                <div class="form-group">
                    <label for="Password">Password:</label>
                    <input type="password" id="Password" name="password" placeholder="Enter your Password" required>
                </div>
                <div class="form-group">
                    <button type="submit">Login</button>
                </div>
                <div class="error-message"><!-- Error messages will appear here --></div>
            </form>
        </div>
        <div id="signup" class="signup-form">
            <form action="signup" method="post">
                <div class="form-group">
                    <label for="FirstName">First Name:</label>
                    <input type="text" id="FirstName" name="fname" required>
                </div>
                <div class="form-group">
                    <label for="LastName">Last Name:</label>
                    <input type="text" id="LastName" name="lname" required>
                </div>
                <div class="form-group">
                    <label for="DOB">Date of Birth:</label>
                    <input type="date" id="DOB" name="dob" required>
                </div>
                <div class="form-group">
                    <label for="Gender">Gender:</label>
                    <input type="radio" id="male" name="gender" value="MALE">
                    <label for="male">Male</label>
                    <input type="radio" id="female" name="gender" value="FEMALE">
                    <label for="female">Female</label>
                    <input type="radio" id="Neutral" name="gender" value="NEUTRAL">
                    <label for="Neutral">Neutral</label>
                </div>
                <div class="form-group">
                    <label for="passing">Passing Marks:</label>
                    <input type="number" id="passing" name="marks" placeholder="Enter last board exam marks" required>
                </div>
                <div class="form-group">
                    <label for="percentage">Percentage(%):</label>
                    <input type="number" step="0.1" id="Percentage" name="percentage" required>
                </div>
                
                <div class="form-group">
                    <label for="Email">Email:</label>
                    <input type="email" id="Email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="Phone">Phone:</label>
                    <input type="tel" id="Phone" name="phone" required>
                </div>
                <div class="form-group">
                    <label for="Year">Joining Year:</label>
                    <select id="Year" name="year" required>
                        <option value="">Select Year</option>
                        <option value="2016">2016</option>
                        <option value="2017">2017</option>
                        <option value="2018">2018</option>
                        <option value="2019">2019</option>
                        <option value="2020">2020</option>
                        <option value="2021">2021</option>
                        <option value="2022">2022</option>
                        <option value="2023">2023</option>
                        <option value="2024">2024</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="Branch">Branch:</label>
                    <select id="Branch" name="branch" required>
                        <option value="">Select Branch</option>
                        <option value="CSE">CSE</option>
                        <option value="ECE">ECE</option>
                        <option value="EEE">EEE</option>
                        <option value="Mechanical">Mechanical</option>
                        <option value="Chemical">Chemical</option>
                        <option value="Agriculture">Agriculture</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="Address">Address:</label>
                    <textarea name="address" id="Address" required></textarea>
                </div>
                <div class="form-group">
                    <button type="submit">Sign Up</button>
                </div>
                <div class="error-message"><!-- Error messages will appear here --></div>
            </form>
        </div>
    </div>
    <script>
        function openSignupForm(evt, formType) {
            var i, form, tablinks;
            form = document.getElementsByClassName("signup-form");
            for (i = 0; i < form.length; i++) {
                form[i].classList.remove("active");
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].classList.remove("active");
            }
            document.getElementById(formType).classList.add("active");
            evt.currentTarget.classList.add("active");
        }
    </script>
</body>
</html>
