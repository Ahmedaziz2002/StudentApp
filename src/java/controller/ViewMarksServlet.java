package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import model.MarksDAO;
import model.MarkView;
import model.Student;

public class ViewMarksServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

        String studentId = req.getParameter("studentId");
        MarksDAO dao = new MarksDAO();

        List<MarkView> marks = dao.getMarksByStudent(studentId);
        Student student = dao.getStudentById(studentId);

        req.setAttribute("marks", marks);
        req.setAttribute("student", student);
        RequestDispatcher rd = req.getRequestDispatcher("viewMarks.jsp");
        rd.forward(req, res);
    }
}
