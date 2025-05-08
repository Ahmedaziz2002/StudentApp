<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <title>Attendance Registration</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f4f6f9;
            padding: 50px;
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
        .form-container {
            background: white;
            padding: 40px;
            max-width: 500px;
            margin: auto;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        h2 {
            color: #4e54c8;
            margin-bottom: 20px;
            text-align: center;
        }
        input, select {
            width: 100%;
            padding: 12px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type=submit] {
            background-color: #4e54c8;
            color: white;
            border: none;
            font-weight: 600;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #3a3fad;
        }
        .message {
            text-align: center;
            color: green;
        }
        .error {
            text-align: center;
            color: red;
        }
    </style>
</head>
<body>

    <div style="text-align: center;">
        <a href="dashboard.jsp" class="back-button">
            <i class="fas fa-home"></i> Back to Dashboard
        </a>
    </div>

    <div class="form-container">
        <h2><i class="fas fa-calendar-check"></i> Register Attendance</h2>
        <form action="registerAttendance" method="post">
            <input type="text" name="studentId" placeholder="Student ID" required />
            <input type="date" name="date" required />
            <select name="status" required>
                <option value="">Select Status</option>
                <option value="Present">Present</option>
                <option value="Absent">Absent</option>
            </select>
            <input type="submit" value="Submit Attendance" />
        </form>

        <% if (request.getAttribute("message") != null) { %>
            <p class="message"><%= request.getAttribute("message") %></p>
        <% } else if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>
    </div>
</body>
</html>
