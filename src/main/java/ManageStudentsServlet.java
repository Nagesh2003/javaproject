import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ManageStudentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentName = request.getParameter("studentName");
        String studentusn = request.getParameter("studentusn");
        String department = request.getParameter("department");

        // Validate parameters
        if (studentName == null || studentName.isEmpty() || department == null || department.isEmpty()) {
            throw new ServletException("Student Name and Department cannot be empty");
        }

        try {
            Connection conn = MySQLConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO students (student_name, studentusn, department) VALUES (?, ?, ?)");
            pstmt.setString(1, studentName);
            pstmt.setString(2, studentusn);
            pstmt.setString(3, department);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            
        } catch (SQLException e) {
            throw new ServletException("Error managing students", e);
        }
    }
}
