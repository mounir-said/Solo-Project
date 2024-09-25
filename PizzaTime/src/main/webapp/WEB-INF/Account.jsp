<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .section-header {
            margin-bottom: 1rem;
        }
        .btn-custom {
            width: 100%; /* Make the button full width */
            border: 2px solid green; /* Add border */
            background-color: green; /* Green background color */
            color: white; /* Text color */
        }
        .btn-custom:hover {
            background-color: darkgreen; /* Darker green on hover */
        }
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

    <div class="container mt-4">
        <div class="row">
            <!-- Account Info Section -->
            <div class="col-md-6">
                <h2 class="section-header">Account Info</h2>
                <form:form method="POST" action="/editaccount/${userId}" modelAttribute="user" id="edit-form" class="form">
                    <input type="hidden" name="_method" value="put">
                    <div class="form-group">
                        <form:label path="firstName">First Name:</form:label>
                        <form:input type="text" path="firstName" class="form-control"/>
                        <form:errors path="firstName" cssClass="text-danger"/>
                    </div>
                    <div class="form-group">
                        <form:label path="lastName">Last Name:</form:label>
                        <form:input type="text" path="lastName" class="form-control"/>
                        <form:errors path="lastName" cssClass="text-danger"/>
                    </div>
                    <div class="form-group">
                        <form:label path="email">Email:</form:label>
                        <form:input type="email" path="email" class="form-control"/>
                        <form:errors path="email" cssClass="text-danger"/>
                    </div>
                    <div class="form-group">
                        <form:label path="address">Address:</form:label>
                        <form:input type="text" path="address" class="form-control"/>
                        <form:errors path="address" cssClass="text-danger"/>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <form:label path="city">City:</form:label>
                            <form:input type="text" path="city" class="form-control"/>
                            <form:errors path="city" cssClass="text-danger"/>
                        </div>
                        <div class="form-group col-md-6">
                            <form:label path="state">State:</form:label>
                            <form:input type="text" path="state" class="form-control"/>
                            <form:errors path="state" cssClass="text-danger"/>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-custom">Update</button>
                </form:form>
            </div>

            <!-- Past Orders Section -->
            <div class="col-md-6">
                <h2 class="section-header">Past Orders</h2>
                <h3>Favorite Orders</h3>
                <div class="list-group">
                    <c:forEach var="order" items="${favoriteOrders}">
                        <div class="list-group-item">
                            <p><strong>Date:</strong> <fmt:formatDate value="${order.createdAt}" pattern="yyyy-MM-dd"/></p>
                            <p>
                                <strong>Order:</strong> <c:out value="${order.crustType}"/> - 
                                <c:forEach var="topping" items="${order.toppings}" varStatus="status">
                                    <c:out value="${topping}"/>
                                    <c:if test="${!status.last}">, </c:if>
                                </c:forEach>
                            </p>
                            <a href="/favorite/${order.id}" class="btn btn-sm btn-danger">Unfavorite</a>
                        </div>
                    </c:forEach>
                </div>

                <h3 class="mt-4">Past Orders</h3>
                <div class="list-group">
                    <c:forEach var="order" items="${pastOrders}">
                        <div class="list-group-item">
                            <p><strong>Date:</strong> <fmt:formatDate value="${order.createdAt}" pattern="yyyy-MM-dd"/></p>
                            <p>
                                <strong>Order:</strong> <c:out value="${order.crustType}"/> - 
                                <c:forEach var="topping" items="${order.toppings}" varStatus="status">
                                    <c:out value="${topping}"/>
                                    <c:if test="${!status.last}">, </c:if>
                                </c:forEach>
                            </p>
                            <div class="d-flex justify-content-between">
                                <a href="/favorite/${order.id}" class="btn btn-sm btn-success">Make Favorite</a>
                                <form action="/account/${order.id}" method="post" class="form-inline" onsubmit="return confirmDelete();">
                                    <input type="hidden" name="_method" value="delete">
                                    <input type="submit" class="btn btn-danger" value="Delete Order">
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function confirmDelete() {
            return confirm('Are you sure you want to delete this order?');
        }
    </script>
</body>
</html>
