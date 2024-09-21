<%@ page import="com.example.MySQLConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Company Results</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Additional styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            padding: 20px;
            max-width: 1200px;
            margin: auto;
            background-color: #ffffff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .navbar {
            background-color: #0D1117;
            color: #C9D1D9;
            padding: 15px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .navbar a {
            color: #C9D1D9;
            text-decoration: none;
            padding: 0 15px;
        }

        .navbar a:hover {
            color: #58A6FF;
        }

        h2 {
            color: #0D1117;
            margin-bottom: 20px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #0D1117;
            color: #C9D1D9;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .error-message {
            color: red;
            text-align: center;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="navbar">
            <!-- Your existing navbar content -->
        </div>
        <h2>Company Results</h2>
        <table>
            <thead>
                <tr>
                    <th>Company ID</th>
                    <th>Company Name</th>
                    <th>Industry</th>
                </tr>
            </thead>
            <tbody>
                <% 
                try {
                    Connection conn = MySQLConnection.getConnection();
                    PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM companies");
                    ResultSet rs = pstmt.executeQuery();
                    
                    while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getInt("company_id") %></td>
                            <td><%= rs.getString("company_name") %></td>
                            <td><%= rs.getString("industry") %></td>
                        </tr>
                        <%
                    }
                    
                    rs.close();
                    pstmt.close();
                    conn.close();
                } catch (SQLException e) {
                    %>
                    <tr>
                        <td colspan="3" class="error-message">Error fetching data: <%= e.getMessage() %></td>
                    </tr>
                    <%
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
