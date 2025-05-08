<%@ page session="true" %>
<%
    session.invalidate(); // Destroy the session
    response.sendRedirect("login.jsp"); // Redirect to login page
%>
