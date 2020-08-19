<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SNI Inventory Tracking App</title>
    <link href="../resources/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/static/new-style.css" rel="stylesheet">
</head>
<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">Inventory Tracking App</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <p class="nav-link"> Welcome <sec:authentication property="name"/></p>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href='<spring:url value="/perform_logout"/>'>Logout</a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>
<header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner" role="listbox">
            <div class="carousel-item active" style="background-image: url('../resources/static/SNIwallpaper - Copy2.jpg'); height: 400px; width: 1900px;">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Inventory Tracking App</h3>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="container">

    <h1 class="my-4" style="text-align: center">Welcome to SNI Inventory Tracking System</h1>
    <div class="row">
        <sec:authorize access="hasRole('ADMIN')">
        <div class="col-lg-3 mb-3">
            <div class="card h-100">
                <h4 class="card-header">Add Product</h4>
                <div class="card-body">
                    <p class="card-text">You can add a new Product here if the company bought new item. You should carefully add all the information related to the product.</p>
                </div>
                <div class="card-footer">
                    <a href="${pageContext.request.contextPath}/addProduct" class="btn btn-primary">Go to Page</a>
                </div>
            </div>
        </div>
        </sec:authorize>
        <sec:authorize access="hasRole('ADMIN')">
        <div class="col-lg-3 mb-3">
            </sec:authorize>
            <sec:authorize access="hasRole('USER')">
            <div class="col-lg-6 mb-6">
                </sec:authorize>
                <div class="card h-100">
                    <h4 class="card-header">List Products</h4>
                    <div class="card-body">
                        <p class="card-text">You can list all of the items at the company. This list will give you a information about who owns which item.</p>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/list" class="btn btn-primary">Go to Page</a>
                    </div>
                </div>
            </div>
            <sec:authorize access="hasRole('ADMIN')">
                <div class="col-lg-3 mb-3">
                    <div class="card h-100">
                        <h4 class="card-header">Add User</h4>
                        <div class="card-body">
                            <p class="card-text">You can add a new User if somebody joins the company.</p>
                        </div>
                        <div class="card-footer">
                            <a href="${pageContext.request.contextPath}/user/addUser" class="btn btn-primary">Go to page</a>
                        </div>
                    </div>
                </div>
            </sec:authorize>
            <sec:authorize access="hasRole('ADMIN')">
            <div class="col-lg-3 mb-3">
                </sec:authorize>
                <sec:authorize access="hasRole('USER')">
                <div class="col-lg-6 mb-6">
                    </sec:authorize>

                    <div class="card h-100">
                        <h4 class="card-header">List Users</h4>
                        <div class="card-body">
                            <p class="card-text">You can list the users here If you want to know more about a spesific User.</p>
                        </div>
                        <div class="card-footer">
                            <a href="${pageContext.request.contextPath}/user/list" class="btn btn-primary">Go to page</a>
                        </div>
                    </div>
                </div>
            </div>
            <script src="../resources/static/jquery/jquery.min.js"></script>
            <script src="../resources/static/bootstrap/js/bootstrap.bundle.min.js"></script>
        </div>
</body>
</html>
