package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/ScheduleInterviewServlet")
public class ScheduleInterviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Interview> interviews = new ArrayList<>();
        try (Connection conn = MySQLConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM interviews");
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Interview interview = new Interview();
                interview.setStudentUsn(rs.getString("studentusn"));
                interview.setCompanyId(rs.getString("company_id"));
                interview.setInterviewDate(rs.getDate("interview_date"));
                interviews.add(interview);
            }

            request.setAttribute("interviews", interviews);
            request.getRequestDispatcher("interview_details.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Error retrieving interview details", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentUsn = request.getParameter("studentUsn");
        String companyId = request.getParameter("companyId");
        String interviewDate = request.getParameter("interviewDate");

        try (Connection conn = MySQLConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("INSERT INTO interviews (studentusn, company_id, interview_date) VALUES (?, ?, ?)")) {

            pstmt.setString(1, studentUsn);
            pstmt.setString(2, companyId);
            pstmt.setDate(3, java.sql.Date.valueOf(interviewDate));
            pstmt.executeUpdate();

            // Redirect to the servlet to display updated interview details
            response.sendRedirect("home.jsp");

        } catch (SQLException e) {
            throw new ServletException("Error saving interview details", e);
        }
    }
}
