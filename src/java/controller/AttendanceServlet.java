package controller;

import model.AttendanceDAO;
import model.Attendance;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/registerAttendance")
public class AttendanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String studentId = request.getParameter("studentId");
        Date date = Date.valueOf(request.getParameter("date")); // yyyy-MM-dd
        String status = request.getParameter("status");

        Attendance attendance = new Attendance(studentId, date, status);
        AttendanceDAO dao = new AttendanceDAO();

        boolean success = dao.registerAttendance(attendance);

        if (success) {
            request.setAttribute("message", "Attendance recorded successfully!");
        } else {
            request.setAttribute("error", "Failed to record attendance. Check student ID.");
        }

        request.getRequestDispatcher("attendance.jsp").forward(request, response);
    }
}
