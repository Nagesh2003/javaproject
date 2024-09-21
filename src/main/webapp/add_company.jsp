<%@ page import="com.example.MySQLConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Company</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Your CSS styles */
        .navbar {
            background-color: #333;
            overflow: hidden;
        }

        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .form-container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-container label {
            display: block;
            margin-bottom: 8px;
        }

        .form-container input[type="text"], .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
        }

        .form-container input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
       <div class="navbar">
            <a href="home.jsp">Home</a>
            <a href="add_company.jsp">Add Company</a>
            <a href="manage_students.jsp">Manage Students</a>
            <a href="schedule_interview.jsp">Schedule Interviews</a>
            <a href="LogoutServlet" class="logout-link">Logout</a>
        </div>
        <h2>Add Company</h2>
        
        <div class="form-container">
            <form action="AddCompanyServlet" method="post">
                <label for="companyName">Company Name:</label>
                <input type="text" id="companyName" name="companyName" required>
                <br>
                <label for="industry">Industry:</label>
                <input type="text" id="industry" name="industry" required>
                <br>
                <input type="submit" value="Add Company">
            </form>
        </div>
    </div>
</body>
</html>
