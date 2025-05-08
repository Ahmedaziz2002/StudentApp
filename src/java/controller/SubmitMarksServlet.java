package controller;

import model.MarksDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class SubmitMarksServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String studentId = req.getParameter("studentId");
        int subjectId = Integer.parseInt(req.getParameter("subjectId"));
        String semester = req.getParameter("semester");
        String grade = req.getParameter("grade");

        MarksDAO dao = new MarksDAO();
        boolean saved = dao.saveMark(studentId, subjectId, semester, grade);

        if (saved) {
            req.setAttribute("message", "Marks submitted successfully.");
        } else {
            req.setAttribute("error", "Failed to submit marks.");
        }

        RequestDispatcher rd = req.getRequestDispatcher("marks.jsp");
        rd.forward(req, res);
    }
}
