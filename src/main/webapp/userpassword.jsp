<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Summary</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
            text-align: center;
        }

        h1 {
            color: #333;
        }
        
        h3{
        	color : #009933;
        }
        .complaint-summary {
            margin: 20px 0;
            text-align: left;
        }

        .complaint-summary p {
            font-size: 1em;
            color: #666;
        }

        .btn-group {
            margin-top: 20px;
            display: flex;
            justify-content: space-around;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .home-btn {
            background-color: #007bff;
        }

        .home-btn:hover {
            background-color: #0056b3;
        }

        .print-btn {
            background-color: #28a745;
        }

        .print-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>User Details</h1>
        <h3>User's Credentials : </h3>
        <div class="complaint-summary">
        <%
        	HttpSession session2 = request.getSession(false);
        	String username = (String)session2.getAttribute("username");
        	String password = (String)session2.getAttribute("pass");
        	session2.invalidate();
        	
        %>
            <p><strong>Username :</strong> <%=username %></p>
            <p><strong>Password :</strong> <%=password %></p>
        </div>
        <div class="btn-group">
            <button class="btn home-btn" onclick="window.location.href='/Registration_Project/'">Go Back to Login</button>
            <button class="btn print-btn" onclick="window.print()">Print Complaint Details</button>
        </div>
    </div>
</body>
</html>
