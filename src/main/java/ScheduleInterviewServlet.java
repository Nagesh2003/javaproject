import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ScheduleInterviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentusn = (request.getParameter("studentId"));
        String companyId = (request.getParameter("companyId"));
        String interviewDateString = request.getParameter("interviewDate");
        
        // Convert interviewDate string to java.sql.Date
        java.sql.Date interviewDate = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date parsedDate = sdf.parse(interviewDateString);
            interviewDate = new java.sql.Date(parsedDate.getTime());
        } catch (ParseException e) {
            throw new ServletException("Error parsing interview date", e);
        }

        try {
            Connection conn = MySQLConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(
                    "INSERT INTO interviews (studentusn, company_id, interview_date) VALUES (?, ?, ?)");
            pstmt.setString(1, studentusn);
            pstmt.setString(2, companyId);
            pstmt.setDate(3, interviewDate);

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            // Redirect back to home page or interview schedule page
            response.sendRedirect("home.jsp");
        } catch (SQLException e) {
            throw new ServletException("Error scheduling interview", e);
        }
    }
}
