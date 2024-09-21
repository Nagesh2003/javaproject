package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

public class ManageStudentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(ManageStudentsServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getAllStudents(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        addStudent(request, response);
    }

    private void getAllStudents(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Student> students = new ArrayList<>();
        try (Connection conn = MySQLConnection.getConnection()) {
            String sql = "SELECT * FROM students";
            try (PreparedStatement pstmt = conn.prepareStatement(sql);
                 ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Student student = new Student();
                    student.setId(rs.getInt("id"));
                    student.setStudentName(rs.getString("student_name"));
                    student.setDepartment(rs.getString("department"));
                    student.setStudentUsn(rs.getString("studentusn"));
                    students.add(student);
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error: ", e);
        }

        request.setAttribute("students", students);
        RequestDispatcher dispatcher = request.getRequestDispatcher("student_details.jsp");
        dispatcher.forward(request, response);
    }

    private void addStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentName = request.getParameter("studentName");
        String studentUsn = request.getParameter("studentusn");
        String department = request.getParameter("department");

        try (Connection conn = MySQLConnection.getConnection()) {
            String sql = "INSERT INTO students (student_name, studentusn, department) VALUES (?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, studentName);
                pstmt.setString(2, studentUsn);
                pstmt.setString(3, department);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error: ", e);
        }

        // Redirect to the student details page after adding a student
        response.sendRedirect("home.jsp"); // Triggers GET request to show updated list
    }
}
