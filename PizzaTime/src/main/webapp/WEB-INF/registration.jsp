<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body { font-family: Arial, sans-serif; }
        .container { margin-top: 20px; }
        .form-section { margin-bottom: 20px; }
        .form-section h1 { margin-bottom: 20px; }
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
                <p><a href="/login">Already have an account? Login here</a></p>
            </div>
        </div>

        <div class="form-section">
            <p class="error-message"><c:out value="${register_error}" /></p>
            <form:form method="POST" action="/registration" modelAttribute="user" id="registration-form">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <form:label path="firstName" cssClass="form-label">First Name:</form:label>
                        <form:input type="text" path="firstName" cssClass="form-control"/>
                        <form:errors path="firstName" cssClass="error-message" />
                    </div>
                    <div class="form-group col-md-6">
                        <form:label path="lastName" cssClass="form-label">Last Name:</form:label>
                        <form:input type="text" path="lastName" cssClass="form-control"/>
                        <form:errors path="lastName" cssClass="error-message" />
                    </div>
                </div>
                <div class="form-group">
                    <form:label path="email" cssClass="form-label">Email:</form:label>
                    <form:input type="email" path="email" cssClass="form-control"/>
                    <form:errors path="email" cssClass="error-message" />
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <form:label path="city" cssClass="form-label">City:</form:label>
                        <form:input type="text" path="city" cssClass="form-control"/>
                        <form:errors path="city" cssClass="error-message" />
                    </div>
                    <div class="form-group col-md-6">
                        <form:label path="state" cssClass="form-label">State:</form:label>
                        <form:input type="text" path="state" cssClass="form-control"/>
                        <form:errors path="state" cssClass="error-message" />
                    </div>
                </div>
                <div class="form-group">
                    <form:label path="address" cssClass="form-label">Address:</form:label>
                    <form:input type="text" path="address" cssClass="form-control"/>
                    <form:errors path="address" cssClass="error-message" />
                </div>
                <div class="form-group">
                    <form:label path="password" cssClass="form-label">Password:</form:label>
                    <form:password path="password" cssClass="form-control"/>
                    <form:errors path="password" cssClass="error-message" />
                </div>
                <div class="form-group">
                    <form:label path="passwordConfirmation" cssClass="form-label">Password Confirmation:</form:label>
                    <form:password path="passwordConfirmation" cssClass="form-control"/>
                    <form:errors path="passwordConfirmation" cssClass="error-message" />
                </div>
                <button type="submit" class="btn btn-custom">Sign Up</button>
            </form:form>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
