<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
    
    <style>
        body { font-family: Arial, sans-serif; }
        .container { margin-top: 20px; }
        .form-section { margin-bottom: 20px; }
        .form-section .form-group { margin-bottom: 15px; }
        .form-section .form-control { border-radius: 4px; }
        .form-section .btn-custom { 
            border-radius: 4px; 
            background-color: green; /* Green background */
            color: white; /* White text */
            width: 100%; /* Full width */
        }
        .error-message { color: #d9534f; }
        .top-right-link {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .header-title {
            font-size: 32px; /* Increased size */
            margin-bottom: 20px;
        }
        .welcome-title {
            text-align: center;
            font-size: 24px; /* Adjust as needed */
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-between">
            <p class="header-title">PIZZA PETE'S</p>
            <div class="top-right-link">
                <p><a href="/register">Don't have an account? Register here</a></p>
            </div>
        </div>

        <div class="form-section">
            <h1 class="welcome-title">Welcome Back!</h1>
            <p class="error-message"><c:out value="${login_error}" /></p>
            <form method="post" action="/login" id="login-form">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" class="form-control"/>
                </div>
                <button type="submit" class="btn btn-custom">Log In</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
