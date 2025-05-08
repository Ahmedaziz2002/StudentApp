package controller;

import model.AttendanceDAO;
import model.Attendance;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewAttendance")
public class ViewAttendanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String studentId = request.getParameter("studentId");
        AttendanceDAO dao = new AttendanceDAO();

        List<Attendance> records = dao.getAttendanceByStudentId(studentId);

        request.setAttribute("records", records);
        request.setAttribute("studentId", studentId);
        request.getRequestDispatcher("viewAttendance.jsp").forward(request, response);
    }
}
