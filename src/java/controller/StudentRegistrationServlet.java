package controller;

import model.Student;
import model.StudentDAO;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/registerStudent")
public class StudentRegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String studentId = request.getParameter("studentId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        Student student = new Student(studentId, name, email, phone);
        StudentDAO dao = new StudentDAO();

        boolean success = dao.registerStudent(student);

        if (success) {
            request.setAttribute("message", "Student registered successfully!");
        } else {
            request.setAttribute("error", "Registration failed. Student ID might already exist.");
        }

        request.getRequestDispatcher("studentRegistration.jsp").forward(request, response);
    }
}
