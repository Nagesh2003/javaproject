<%@ page session="false" %>
<%
    // Invalidate the session to log out the user
    HttpSession session = request.getSession(false);
    if (session != null) {
        session.invalidate();
    }
    // Redirect to the login page
    response.sendRedirect("login.html");
%>
