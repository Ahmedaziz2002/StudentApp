<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Attendance"%>
<html>
<head>
    <title>View Attendance</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f4f6f9;
            padding: 40px;
        }
        .form-container {
            background: white;
            padding: 30px;
            max-width: 600px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
        h2 {
            color: #4e54c8;
            margin-bottom: 20px;
            text-align: center;
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type="submit"] {
            background-color: #4e54c8;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #3a3fad;
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
            margin-bottom: 20px;
        }
        .table-container {
            max-width: 800px;
            margin: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 15px rgba(0,0,0,0.05);
        }
        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }
        th {
            background-color: #4e54c8;
            color: white;
        }
    </style>
</head>
<body>

    <div style="text-align: center;">
        <a href="dashboard.jsp" class="back-button"><i class="fas fa-home"></i> Back to Dashboard</a>
    </div>

    <div class="form-container">
        <h2><i class="fas fa-search"></i> Search Attendance</h2>
        <form action="viewAttendance" method="post">
            <input type="text" name="studentId" placeholder="Enter Student ID" required />
            <input type="submit" value="View Attendance" />
        </form>
    </div>

    <div class="table-container">
        <%
            List<Attendance> records = (List<Attendance>) request.getAttribute("records");
            if (records != null && !records.isEmpty()) {
        %>
        <h2 style="text-align:center;">Attendance for Student: <%= request.getAttribute("studentId") %></h2>
        <table>
            <tr>
                <th>Date</th>
                <th>Status</th>
            </tr>
            <% for (Attendance a : records) { %>
                <tr>
                    <td><%= a.getDate() %></td>
                    <td><%= a.getStatus() %></td>
                </tr>
            <% } %>
        </table>
        <% } else if (request.getAttribute("records") != null) { %>
            <p style="text-align:center;">No records found for this student.</p>
        <% } %>
    </div>

</body>
</html>
