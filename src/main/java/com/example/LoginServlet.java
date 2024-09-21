package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("logout".equals(action)) {
            // Handle logout
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate(); // Invalidate the session
            }
            response.sendRedirect("login.html"); // Redirect to login page
        } else {
            // Handle login
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            try (Connection conn = MySQLConnection.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=?")) {

                pstmt.setString(1, username);
                pstmt.setString(2, password);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        HttpSession session = request.getSession();
                        session.setAttribute("username", username); // Store username in session
                        response.sendRedirect("home.jsp"); // Redirect to home page on successful login
                    } else {
                        response.sendRedirect("login.html?error=Invalid credentials"); // Redirect back to login page if authentication fails
                    }
                }

            } catch (SQLException e) {
                throw new ServletException("Error authenticating user", e);
            }
        }
    }
}
