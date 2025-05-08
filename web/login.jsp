<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <title>Login</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #4e54c8, #8f94fb);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login {
            background: white;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 350px;
            text-align: center;
        }

        .login h2 {
            margin-bottom: 25px;
            color: #333;
        }

        form input[type="text"],
        form input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 8px;
            transition: border-color 0.3s;
        }

        form input[type="text"]:focus,
        form input[type="password"]:focus {
            border-color: #4e54c8;
            outline: none;
        }

        form input[type="submit"] {
            background: #4e54c8;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 8px;
            margin-top: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
        }

        form input[type="submit"]:hover {
            background: #3b40a4;
        }

        .error-message {
            margin-top: 15px;
            color: #e74c3c;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="login">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required />
            <input type="password" name="password" placeholder="Password" required />
            <input type="submit" value="Login" />
        </form>
        <% if(request.getAttribute("error") != null) { %>
            <div class="error-message"><%= request.getAttribute("error") %></div>
        <% } %>
    </div>
</body>
</html>
