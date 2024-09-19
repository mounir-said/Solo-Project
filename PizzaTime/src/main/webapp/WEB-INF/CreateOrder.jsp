<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Craft A Pizza</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body { font-family: Arial, sans-serif; }
        .navbar { margin-bottom: 20px; }
        .navbar a { margin-right: 15px; text-decoration: none; }
        .container { margin-top: 20px; }
        .form-group { margin-top: 10px; }
        fieldset { border: 1px solid #ccc; padding: 10px; margin-top: 10px; }
        legend { font-weight: bold; }
        .form-row { margin-bottom: 10px; }
        .btn-green { background-color: #28a745; color: white; width: 100%; }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Pizza Pete's</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/order">Order</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/account/${userId}">Account</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h1 class="text-center">Craft-A-Pizza</h1>
        <form:form method="POST" action="/createorder" modelAttribute="order" id="order-form">
            <div class="form-group">
                <form:label path="deliveryMethod">Delivery Method:</form:label>
                <form:select path="deliveryMethod" class="form-control">
                    <form:option value="Deliver">Delivery</form:option>
                    <form:option value="Take-Out">Take-Out</form:option>
                </form:select>
                <form:errors path="deliveryMethod" cssClass="text-danger"/>
            </div>

            <div class="form-row">
                <div class="form-group col">
                    <form:label path="pizzaSize">Size:</form:label>
                    <form:select path="pizzaSize" class="form-control">
                        <form:option value="Small">Small</form:option>
                        <form:option value="Medium">Medium</form:option>
                        <form:option value="Large">Large</form:option>
                    </form:select>
                    <form:errors path="pizzaSize" cssClass="text-danger"/>
                </div>
                <div class="form-group col">
                    <form:label path="crustType">Crust:</form:label>
                    <form:select path="crustType" class="form-control">
                        <form:option value="Thin Crust">Thin Crust</form:option>
                        <form:option value="Thick Crust">Thick Crust</form:option>
                        <form:option value="Deep Dish">Deep Dish</form:option>
                    </form:select>
                    <form:errors path="crustType" cssClass="text-danger"/>
                </div>
                <div class="form-group col">
                    <form:label path="qty">Qty:</form:label>
                    <form:select path="qty" class="form-control">
                        <form:option value="1">1</form:option>
                        <form:option value="2">2</form:option>
                        <form:option value="3">3</form:option>
                        <form:option value="4">4</form:option>
                        <form:option value="5">5</form:option>
                    </form:select>
                    <form:errors path="qty" cssClass="text-danger"/>
                </div>
            </div>

            <fieldset>
                <legend>Toppings:</legend>
                <div class="form-check">
                    <form:checkbox path="toppings" value="extra cheese" class="form-check-input"/> 
                    <form:label path="toppings" value="extra cheese" class="form-check-label">Extra Cheese</form:label>
                </div>
                <div class="form-check">
                    <form:checkbox path="toppings" value="pepperoni" class="form-check-input"/>
                    <form:label path="toppings" value="pepperoni" class="form-check-label">Pepperoni</form:label>
                </div>
                <div class="form-check">
                    <form:checkbox path="toppings" value="mushrooms" class="form-check-input"/>
                    <form:label path="toppings" value="mushrooms" class="form-check-label">Mushrooms</form:label>
                </div>
                <div class="form-check">
                    <form:checkbox path="toppings" value="peppers" class="form-check-input"/>
                    <form:label path="toppings" value="peppers" class="form-check-label">Peppers</form:label>
                </div>
                <form:errors path="toppings" cssClass="text-danger"/>
            </fieldset>
            
            <form:input type="hidden" path="user" value="${userId}" />
            <button type="submit" class="btn btn-green">Add to Order</button>
        </form:form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
