package controller;

import model.ReportDAO;
import model.ReportView;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String semester = request.getParameter("semester");
        ReportDAO dao = new ReportDAO();
        List<ReportView> reports = dao.getReportBySemester(semester);
        request.setAttribute("reports", reports);
        request.setAttribute("semester", semester);
        request.getRequestDispatcher("reports.jsp").forward(request, response);
    }
}
