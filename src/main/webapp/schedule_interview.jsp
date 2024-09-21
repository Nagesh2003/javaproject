<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Schedule Interview</title>
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
        input[type="text"], input[type="date"] {
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
        <h2>Schedule Interview</h2>
        <form action="ScheduleInterviewServlet" method="post">
<label for="studentUsn">Student USN:</label>
<input type="text" id="studentUsn" name="studentUsn" required>


            <label for="companyId">Company ID:</label>
            <input type="text" id="companyId" name="companyId" required>

            <label for="interviewDate">Interview Date:</label>
            <input type="date" id="interviewDate" name="interviewDate" required>

            <input type="submit" value="Schedule Interview">
        </form>
        <% 
            String message = request.getParameter("message");
            if (message != null) {
        %>
        <p><%= message %></p>
        <% 
            }
        %>
    </div>
</body>
</html>
