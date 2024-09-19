<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Americratika&display=swap" rel="stylesheet">
    <style>
        body { font-family: Arial, sans-serif; }
        .navbar { margin-bottom: 20px; }
        .navbar a { margin-right: 15px; }
        .container { margin-top: 20px; }
        .section-header { margin-bottom: 1rem; text-align: center; }
        .card { margin: 10px; width: 100%; }
        .card-description { font-family: 'Americratika', sans-serif; font-style: italic; margin-bottom: 3rem; }
        .btn { background-color: transparent; color: #000; border: 1px solid #000; }
        .btn:hover { background-color: #f8f9fa; }
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
        <h2 class="section-header">Quick Options</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <p class="card-description">Eager to satisfy your cravings? Use this option to place a brand new order for your favorite pizzas and sides. Enjoy the delightful experience of customizing your order just the way you like it! Choose from a wide variety of toppings, crusts, and sizes to create the perfect meal. Whether you're in the mood for a classic pepperoni, a gourmet white pizza, or something more adventurous like a barbecue chicken pie, our extensive menu has something for everyone. From traditional favorites to unique creations, let your taste buds guide you as you embark on a delicious journey, ensuring that every bite is a moment of pure joy. So go ahead, make your selection and indulge in the comforting goodness of a freshly made pizza!</p>
                        <a href="/order" class="btn">New ORDER</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <p class="card-description">No time to search for your favorites? Click here to quickly reorder your beloved dishes with just a few clicks. It's convenient and ensures you get what you love without any hassle! With our easy reordering feature, you can revisit your most cherished meals without the effort of scrolling through the entire menu. This option is perfect for those busy days when you crave the familiar tastes that bring comfort, allowing you to enjoy your meal without any unnecessary delays. Experience the satisfaction of having your favorite meal on its way to you in no time, and relive the delightful flavors you know and love. Don’t waste time wondering what to order—let us bring your favorites right back to your doorstep!</p>
                        <a href="/reorder/favorite" class="btn">RE-ORDER MY FAVE</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <p class="card-description">Feeling adventurous? Let us surprise you with a special dish that we think you'll absolutely love. Embrace the unexpected and enjoy a delightful culinary adventure! This option allows you to step out of your comfort zone and discover new flavors and combinations that you may not have considered before. Trust our expert chefs to craft something uniquely delicious just for you, ensuring that every meal is a new discovery. Who knows, you might just find your new favorite dish and expand your palate in the process. Let us tantalize your taste buds with a surprise that will leave you craving more, turning your meal into a delightful experience that keeps you coming back for more!</p>
                        <a href="/order/surprise" class="btn">SURPRISE ME</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
