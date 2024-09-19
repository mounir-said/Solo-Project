<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login or Register</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body { font-family: Arial, sans-serif; }
        .container { margin-top: 20px; }
        .form-section { margin-bottom: 20px; }
        .form-section h1 { margin-bottom: 20px; }
        .form-section .form-group { margin-bottom: 15px; }
        .form-section .form-control { border-radius: 4px; }
        .form-section .btn-primary { border-radius: 4px; }
        .error-message { color: #d9534f; }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-section">
            <h1>Register</h1>
            <p class="error-message"><c:out value="${register_error}" /></p>
            <form:form method="POST" action="/registration" modelAttribute="user" id="registration-form">
                <div class="form-group">
                    <form:label path="firstName" cssClass="form-label">First Name:</form:label>
                    <form:input type="text" path="firstName" cssClass="form-control"/>
                    <form:errors path="firstName" cssClass="error-message" />
                </div>
                <div class="form-group">
                    <form:label path="lastName" cssClass="form-label">Last Name:</form:label>
                    <form:input type="text" path="lastName" cssClass="form-control"/>
                    <form:errors path="lastName" cssClass="error-message" />
                </div>
                <div class="form-group">
                    <form:label path="email" cssClass="form-label">Email:</form:label>
                    <form:input type="email" path="email" cssClass="form-control"/>
                    <form:errors path="email" cssClass="error-message" />
                </div>
                <div class="form-group">
                    <form:label path="address" cssClass="form-label">Address:</form:label>
                    <form:input type="text" path="address" cssClass="form-control"/>
                    <form:errors path="address" cssClass="error-message" />
                </div>
                <div class="form-group">
                    <form:label path="city" cssClass="form-label">City:</form:label>
                    <form:input type="text" path="city" cssClass="form-control"/>
                    <form:errors path="city" cssClass="error-message" />
                </div>
                <div class="form-group">
                    <form:label path="state" cssClass="form-label">State:</form:label>
                    <form:input type="text" path="state" cssClass="form-control"/>
                    <form:errors path="state" cssClass="error-message" />
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
                <button type="submit" class="btn btn-primary">Register!</button>
            </form:form>
        </div>

        <div class="form-section">
            <h1>Login</h1>
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
                <button type="submit" class="btn btn-primary">Login!</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
