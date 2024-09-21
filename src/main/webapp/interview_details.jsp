<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.Interview" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Interview Details</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Interview Details</h2>
    <table>
        <thead>
            <tr>
                <th>Student USN</th>
                <th>Company ID</th>
                <th>Interview Date</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Interview> interviews = (List<Interview>) request.getAttribute("interviews");
                if (interviews != null && !interviews.isEmpty()) {
                    for (Interview interview : interviews) {
            %>
            <tr>
                <td><%= interview.getStudentUsn() %></td>
                <td><%= interview.getCompanyId() %></td>
                <td><%= interview.getInterviewDate() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="3">No interview records found.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
