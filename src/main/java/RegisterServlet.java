import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        try {
            Connection conn = MySQLConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO users (username, password, email) VALUES (?, ?, ?)");
            pstmt.setString(1, username);
            pstmt.setString(2, password); // In real scenario, use secure password storage
            pstmt.setString(3, email);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            // Redirect to login page after successful registration
            response.sendRedirect("login.html");
        } catch (SQLException e) {
            throw new ServletException("Error registering user", e);
        }
    }
}
