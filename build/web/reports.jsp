<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="model.ReportView" %>
<%
    List<ReportView> reports = (List<ReportView>) request.getAttribute("reports");
    String semester = (String) request.getAttribute("semester");

    String[] rowColors = {
        "#fef6e4", "#e0f7fa", "#fce4ec", "#e8f5e9", "#fff3e0",
        "#e3f2fd", "#ede7f6", "#f9fbe7", "#e1f5fe", "#f3e5f5"
    };
%>
<html>
<head>
    <title>Performance Reports</title>
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
            max-width: 1000px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #4e54c8;
            text-align: center;
            margin-bottom: 30px;
        }

        input, select {
            padding: 10px;
            margin: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        input[type=submit] {
            background-color: #4e54c8;
            color: white;
            font-weight: 600;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background-color: #4e54c8;
            color: white;
        }

        .student-row {
            border-radius: 6px;
        }

        .average-row {
            font-weight: bold;
            background-color: #ddd !important;
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
        <h2><i class="fas fa-chart-line"></i> Student Performance Report</h2>

        <form method="get" action="ReportServlet">
            <label>Semester:</label>
            <select name="semester" required>
                <option value="">-- Select Semester --</option>
                <option value="Y1S1">Year 1 Semester 1</option>
                <option value="Y1S2">Year 1 Semester 2</option>
                <option value="Y2S1">Year 2 Semester 1</option>
                <option value="Y2S2">Year 2 Semester 2</option>
                <option value="Y3S1">Year 3 Semester 1</option>
                <option value="Y3S2">Year 3 Semester 2</option>
                <option value="Y4S1">Year 4 Semester 1</option>
                <option value="Y4S2">Year 4 Semester 2</option>
            </select>
            <input type="submit" value="Generate Report" />
        </form>

        <% if (reports != null && !reports.isEmpty()) { %>
            <table>
                <tr>
                    <th>Student ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>Semester</th>
                    <th>GPA</th>
                </tr>
                <%
                    String currentStudentId = "";
                    double gpaSum = 0;
                    int gpaCount = 0;
                    int colorIndex = 0;

                    for (int i = 0; i < reports.size(); i++) {
                        ReportView r = reports.get(i);
                        String studentId = r.getStudentId();

                        boolean newStudent = !studentId.equals(currentStudentId);

                        if (newStudent && !currentStudentId.equals("")) {
                            // Print average row for previous student
                %>
                            <tr class="average-row">
                                <td colspan="5">Average GPA</td>
                                <td><%= String.format("%.2f", gpaSum / gpaCount) %></td>
                            </tr>
                <%
                            gpaSum = 0;
                            gpaCount = 0;
                        }

                        if (newStudent) {
                            currentStudentId = studentId;
                            colorIndex = (colorIndex + 1) % rowColors.length;
                        }

                        gpaSum += r.getGpa();
                        gpaCount++;

                        String bgColor = rowColors[colorIndex];
                %>
                        <tr class="student-row" style="background-color: <%= bgColor %>;">
                            <td><%= r.getStudentId() %></td>
                            <td><%= r.getStudentName() %></td>
                            <td><%= r.getEmail() %></td>
                            <td><%= r.getSubjectName() %></td>
                            <td><%= r.getSemester() %></td>
                            <td><%= String.format("%.2f", r.getGpa()) %></td>
                        </tr>
                <%
                        // If it's the last record, print average for the last student
                        boolean isLast = (i == reports.size() - 1);
                        if (isLast) {
                %>
                            <tr class="average-row">
                                <td colspan="5">Average GPA</td>
                                <td><%= String.format("%.2f", gpaSum / gpaCount) %></td>
                            </tr>
                <%
                        }
                    }
                %>
            </table>
        <% } else if (semester != null) { %>
            <p style="text-align: center; color: #888; margin-top: 20px;">
                No records found for <strong><%= semester %></strong>.
            </p>
        <% } %>
    </div>
</body>
</html>
