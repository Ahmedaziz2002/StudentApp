<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.MarkView" %>
<%
    List<MarkView> marks = (List<MarkView>) request.getAttribute("marks");
%>
<html>
<head>
    <title>View Marks</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f4f6f9;
            padding: 40px;
        }
          .back-button {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            background-color: #4e54c8;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 500;
            margin-bottom: 30px;
            transition: background-color 0.3s;
        }

        .back-button:hover {
            background-color: #3a3fad;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #4e54c8;
            text-align: center;
            margin-bottom: 20px;
        }
        input[type=text] {
            width: 100%;
            padding: 12px;
            border-radius: 6px;
            border: 1px solid #ccc;
            margin-bottom: 20px;
        }
        input[type=submit] {
            background-color: #4e54c8;
            color: white;
            border: none;
            padding: 10px 20px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4e54c8;
            color: white;
        }
    </style>
</head>
<body>
    <div style="text-align: center;">
        <a href="dashboard.jsp" class="back-button">
            <i class="fas fa-home"></i> Back to Dashboard
        </a>
    </div>
    <div class="container">
        <h2><i class="fas fa-eye"></i> View Student Marks</h2>
        <form action="ViewMarksServlet" method="get">
            <input type="text" name="studentId" placeholder="Enter Student ID" required />
            <input type="submit" value="Search" />
        </form>
        <%@ page import="model.Student" %>
<%
    Student student = (Student) request.getAttribute("student");
%>

<% if (student != null) { %>
    <div style="margin-top: 30px; background-color: #f1f3fc; padding: 20px; border-radius: 10px;">
        <h3>Student Information</h3>
        <p><strong>ID:</strong> <%= student.getStudentId() %></p>
        <p><strong>Name:</strong> <%= student.getName() %></p>
        <p><strong>Email:</strong> <%= student.getEmail() != null ? student.getEmail() : "N/A" %></p>
        <p><strong>Phone:</strong> <%= student.getPhone() != null ? student.getPhone() : "N/A" %></p>
    </div>
<% } %>


        <% if (marks != null && !marks.isEmpty()) { %>
            <table>
                <tr>
                    <th>Subject</th>
                    <th>Semester</th>
                    <th>Grade</th>
                </tr>
                <% for (MarkView m : marks) { %>
                    <tr>
                        <td><%= m.getSubjectName() %></td>
                        <td><%= m.getSemester() %></td>
                        <td><%= m.getGrade() %></td>
                    </tr>
                <% } %>
            </table>
        <% } else if (marks != null) { %>
            <p style="color:red; text-align:center;">No marks found for this student.</p>
        <% } %>
    </div>
</body>
</html>
