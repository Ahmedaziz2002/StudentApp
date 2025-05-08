package controller;

import model.User;
import model.UserDAO;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        
        UserDAO userDAO=new UserDAO();
        try{
            User user=userDAO.checkLogin(username, password);
            if(user!=null){
                HttpSession session=request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("dashboard.jsp");
            }
            else{
                request.setAttribute("error","Invalid username or password");
                RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
        }catch(Exception e){
            throw new ServletException("Login failed",e);
        }
    }
}