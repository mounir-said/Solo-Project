<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Surprise Me</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
    
    <style>
        body { font-family: Arial, sans-serif; }
        .navbar { margin-bottom: 20px; }
        .container { margin-top: 20px; }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">MyApp</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/order">Order</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Logout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/account/${userId}">Account</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h2>Your Surprise Pizza</h2>
        <c:if test="${not empty order}">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">${order.pizzaSize} ${order.crustType}</h5>
                    <p class="card-text"><strong>Quantity:</strong> ${order.qty}</p>
                    <p class="card-text"><strong>Delivery Method:</strong> ${order.deliveryMethod}</p>
                    <p class="card-text"><strong>Toppings:</strong> 
                        <c:forEach var="topping" items="${order.toppings}">
                            ${topping}<c:if test="${!topping eq order.toppings[last]}">, </c:if>
                        </c:forEach>
                    </p>
                    <form action="/createorder" method="post">
                        <input type="hidden" name="pizzaSize" value="${order.pizzaSize}" />
                        <input type="hidden" name="crustType" value="${order.crustType}" />
                        <input type="hidden" name="qty" value="${order.qty}" />
                        <input type="hidden" name="deliveryMethod" value="${order.deliveryMethod}" />
                        <c:forEach var="topping" items="${order.toppings}">
                            <input type="hidden" name="toppings" value="${topping}" />
                        </c:forEach>
                        <button type="submit" class="btn btn-primary">Order This Pizza</button>
                    </form>
                </div>
            </div>
        </c:if>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
