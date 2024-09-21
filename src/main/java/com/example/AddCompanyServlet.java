package com.example;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddCompanyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String companyName = request.getParameter("companyName");
        String industry = request.getParameter("industry");

        if (companyName == null || companyName.isEmpty() || industry == null || industry.isEmpty()) {
            throw new ServletException("Company Name and Industry cannot be empty");
        }

        try {
            Connection conn = MySQLConnection.getConnection();
            String sql = "INSERT INTO companies (company_name, industry) VALUES (?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, companyName);
            pstmt.setString(2, industry);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            response.sendRedirect("home.jsp");
        } catch (SQLException e) {
            throw new ServletException("Error adding company", e);
        }
    }
}
