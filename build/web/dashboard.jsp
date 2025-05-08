<%@ page import="model.User" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<String[]> students = new ArrayList<>();

    String url = "jdbc:mysql://localhost:3306/student_app";
    String dbUsername = "root";
    String dbPassword = "Shamha@2002";

    try (Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword)) {
        String query = "SELECT student_id, name, email, phone FROM students LIMIT 4";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            students.add(new String[] {
                rs.getString("student_id"),
                rs.getString("name"),
                rs.getString("email"),
                rs.getString("phone")
            });
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background: #f4f6f9;
            color: #333;
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 240px;
            background-color: #4e54c8;
            padding: 30px 20px;
            display: flex;
            flex-direction: column;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.05);
            color: white;
        }

        .sidebar h2 {
            margin-bottom: 30px;
            font-size: 20px;
            font-weight: 600;
            text-align: center;
        }

        .sidebar a {
            text-decoration: none;
            color: white;
            background: rgba(255, 255, 255, 0.1);
            margin-bottom: 15px;
            padding: 12px 20px;
            border-radius: 8px;
            font-weight: 500;
            transition: background 0.3s;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .sidebar a:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        .sidebar a i {
            font-size: 16px;
        }

        .main {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: #fff;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .navbar h1 {
            font-size: 20px;
            color: #4e54c8;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .navbar .logout {
            background: #4e54c8;
            color: white;
            padding: 8px 16px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: background 0.3s;
        }

        .navbar .logout:hover {
            background: #3b40a4;
        }

        .content {
            flex: 1;
            padding: 40px;
            overflow-y: auto;
        }

        .welcome-box {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 12px 24px rgba(0,0,0,0.1);
            text-align: center;
            margin-bottom: 40px;
        }

        .welcome-box h2 {
            font-size: 28px;
            color: #4e54c8;
        }

        .welcome-box p {
            margin-top: 10px;
            font-size: 16px;
            color: #666;
        }

        .student-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.05);
        }

        .student-table th, .student-table td {
            padding: 15px 20px;
            text-align: left;
        }

        .student-table th {
            background-color: #4e54c8;
            color: white;
        }

        .student-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .student-table tr:hover {
            background-color: #eef1f5;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2><i class="fas fa-tachometer-alt"></i> Dashboard</h2>
        <a href="studentRegistration.jsp"><i class="fas fa-user-plus"></i>Student Registration</a>
        <a href="attendance.jsp"><i class="fas fa-calendar-check"></i>Attendance Registration</a>
        <a href="viewAttendance.jsp"><i class="fas fa-eye"></i>View Attendance</a>
        <a href="marks.jsp"><i class="fas fa-clipboard-list"></i>Marks Management</a>
        <a href="viewMarks.jsp"><i class="fas fa-eye"></i>View Marks</a>
        <a href="reports.jsp"><i class="fas fa-chart-bar"></i>View Reports</a>
    </div>

    <div class="main">
        <div class="navbar">
            <h1><i class="fas fa-user-graduate"></i> Student Management System</h1>
            <a href="logout.jsp" class="logout"><i class="fas fa-right-from-bracket"></i> Logout</a>
        </div>

        <div class="content">
            <div class="welcome-box">
                <h2>Welcome, <%= user.getUserName() %> ?</h2>
                <p>Your role: <strong><%= user.getRole() %></strong></p>
            </div>
            <div class="welcome-box">
                <h2 style="color: #4e54c8; margin-bottom: 20px;">Student Records</h2>
            <table class="student-table">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (String[] s : students) {
                    %>
                        <tr>
                            <td><%= s[0] %></td>
                            <td><%= s[1] %></td>
                            <td><%= s[2] %></td>
                            <td><%= s[3] %></td>
                        </tr>
                    <%
                        }
                        if (students.size() == 0) {
                    %>
                        <tr>
                            <td colspan="4">No student records found.</td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            </div>
            
        </div>
    </div>
</body>
</html>
