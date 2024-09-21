<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.MySQLConnection" %>
<%@ page import="com.example.Student" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Students</title>
    <link rel="stylesheet" href="styles.css">
    <style>
    .navbar {
            background-color: #333;
            overflow: hidden;
            margin-bottom: 20px;
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
        .container {
            width: 80%;
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        form {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
            text-align: left;
        }
        th, td {
            padding: 15px;
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
        <h2>Manage Students</h2>
        <form action="ManageStudentsServlet" method="post">
            <label for="studentName">Student Name:</label>
            <input type="text" id="studentName" name="studentName" required>

            <label for="studentusn">Student USN:</label>
            <input type="text" id="studentusn" name="studentusn" required>

            <label for="department">Department:</label>
            <input type="text" id="department" name="department" required>

            <input type="submit" value="Add Student">
        </form>
    </div>
</body>
</html>
