<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: Arial, sans-serif; }
        #navbar { margin-bottom: 20px; }
        #navbar a { margin-right: 15px; text-decoration: none; }
        h2 { color: #333; text-align: left; margin-top: 20px; }
        .price-container { display: flex; justify-content: space-between; margin: 20px 0; }
        hr { border-top: 1px solid #ccc; margin: 20px 0; }
        .form-buttons { display: flex; justify-content: space-between; }
        .form-buttons form { flex: 1; margin-right: 10px; }
        .form-buttons form:last-child { margin-right: 0; }
        .btn { width: 100%; }
    </style>
</head>
<body>
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
        <h2>Your Order</h2>
        <div class="card">
            <div class="card-body">
                <p><strong>METHOD:</strong> <c:out value="${currentOrder.deliveryMethod}" /></p>
                <p><strong>QTY:</strong> <c:out value="${currentOrder.qty}" /></p>
                <p><strong>Size:</strong> <c:out value="${currentOrder.pizzaSize}" /></p>
                <p><strong>Crust:</strong> <c:out value="${currentOrder.crustType}" /></p>
                <p><strong>Toppings:</strong>
                    <c:forEach var="topping" items="${currentOrder.toppings}">
                        <c:out value="${topping}" />
                        <c:if test="${not empty topping}">, </c:if>
                    </c:forEach>
                </p>
                
                <!-- Price Container -->
                <div class="price-container">
                    <p><strong>Price:</strong></p>
                    <p>$<c:out value="${price}" /></p>
                </div>

                <!-- Horizontal line -->
                <hr />

                <!-- Total Container Styled the Same as Price -->
                <div class="price-container">
                    <p><strong>TOTAL:</strong></p>
                    <p>$<c:out value="${price}" /></p>
                </div>

                <!-- Buttons Side by Side -->
                <div class="form-buttons">
                    <form action="/checkout/${currentOrder.id}/delete" method="post">
                        <input type="hidden" name="_method" value="delete">
                        <input type="submit" class="btn btn-danger" value="Start Over">
                    </form>
                    <form action="/purchase/${currentOrder.id}" method="post">
                        <input type="submit" class="btn btn-primary" value="Purchase">
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
