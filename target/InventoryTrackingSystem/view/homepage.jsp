<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SNI Inventory Tracking App</title>
    <link href="../resources/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="../resources/static/new-style.css" rel="stylesheet">
    <!-- Jquery Scripts -->
    <!-- Jquery Scripts -->
    <script>
        $(document).ready(function(){
            $('#scrollToTop').hide();

            if (window.location.hash === '#openModal') {
                $('#addUserModal').modal('show');;
            }

            $(window).scroll(function(){
                if ($(this).scrollTop() > 75) {
                    $('#scrollToTop').fadeIn();
                } else {
                    $('#scrollToTop').fadeOut();
                }
            });

            $('#scrollToTop').click(function(){
                $('html, body').animate({scrollTop : 0},800);
                return false;
            });

            $('#addUseratTable').click(function(){
                $('#addUserModal').modal('show');
            });

            var $userName = $('#inputFirstName');
            var $userLastName = $('#inputLastName');
            var $userRole = $('#inputRole');
            var $team = $('#inputTeamRole');
            var $email = $('#inputEmail');
            var $active = $('#inputActive');
            var $password = $('#inputPassword');

            $("#submitButtonForForm").click(function(){
                event.preventDefault();
                var userName = $userName.val();
                var userLastName = $userLastName.val();
                var userRole = $userRole.val();
                var team = $team.val();
                var email = $email.val();
                var active = $active.val();
                var password = $password.val();

                $.ajax({
                    type: 'POST',
                    url: '/user/saveAjaxJson',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        userName:userName,
                        userLastName:userLastName,
                        userRole:userRole,
                        team:team,
                        email: email,
                        active:active,
                        password:password
                    }),
                    success: function (response) {
                        if (response === false){
                            alert("email is already taken")
                        }else {
                            alert('success')
                            $('#addUserModal').modal('hide');
                        }
                    },
                    error: function () {
                        alert('error saving user');
                    }
                })

            });
        });
    </script>
    <!-- Jquery Scripts -->
    <!-- Jquery Scripts -->
</head>
<body>
<!-- Navigation Bar -->
<!-- Navigation Bar -->
<nav id="navbar-example2" class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">Inventory Tracking App</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="btn btn-primary" id="scrollToTop" href="#">Scroll to Top</a>
            </li>
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
</nav>
<!-- Navigation Bar -->
<!-- Navigation Bar -->
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
    <p style="text-align: center">
        <c:if test="${not empty message}">
            <span style="color:green"><c:out value="${message}"/></span>
            <c:remove var="message" scope="session" />
            <br><br>
        </c:if>
    </p>
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
                        <a href="${pageContext.request.contextPath}/addProduct" class="btn btn-primary">Add Product</a>
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
                        <a href="#listProductsContainer" class="btn btn-primary">List Products</a>
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
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addUserModal">Click to add a User</button>
                        </div>
                    </div>
                </div>
            </sec:authorize>
            <!-- Add User Modal -->
            <!-- Add User Modal -->
            <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Fill the form to enter a new User</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="inputFirstName" class="col-form-label">First Name</label>
                                <input type="email" id="inputFirstName" class="form-control" required autofocus>
                            </div>
                            <div class="form-group">
                                <label for="inputLastName" class="col-form-label">Last Name</label>
                                <input type="email" id="inputLastName" class="form-control" required autofocus>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="col-form-label">User Role</label>
                                <select class="form-control" id="inputRole">
                                    <option value="ROLE_ADMIN">Admin</option>
                                    <option value="ROLE_USER">User</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="inputTeamRole" class="col-form-label">Team</label>
                                <select class="form-control" id="inputTeamRole">
                                    <option value="Java">Java</option>
                                    <option value="Abap">Abap</option>
                                    <option value="Destek">Destek</option>
                                    <option value="Bilgi Islem">Bilgi Islem</option>
                                    <option value="IK">IK</option>
                                    <option value="Stajyer">Stajyer</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="col-form-label">Email address</label>
                                <input type="email" id="inputEmail" name="changedUsername" class="form-control" placeholder="please enter a valid e-mail adress" required autofocus>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword" class="col-form-label" >Password</label>
                                <input type="password" id="inputPassword" class="form-control" name="changedPassword" placeholder="Password" required>
                            </div>
                            <div class="form-group">
                                <label for="inputActive" class="col-form-label">Status</label>
                                <select class="form-control" id="inputActive">
                                    <option value="true">Active</option>
                                    <option value="false">Disabled</option>
                                </select>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button id="submitButtonForForm" type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Add User Modal -->
            <!-- Add User Modal -->
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
                            <a href="#listUserContainer" class="btn btn-primary" type="button">List Users</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- User List Scroll -->
<!-- User List Scroll -->
<div data-spy="scroll" data-target="#navbar-example2" data-offset="100">
    <div class="container" style="padding-top: 500px; margin-bottom: 500px" id="listUserContainer">
        <div class="contentContainer">
            <p>
                <sec:authorize access="hasRole('ADMIN')">
                    <button id="addUseratTable" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Add new User</button>
                </sec:authorize>
            </p>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">Full Name</th>
                    <th scope="col">Team</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${users}">
                    <c:url var="updateLink" value="/user/showFormForUpdate">
                        <c:param name="userId" value="${user.id}" />
                    </c:url>
                    <c:url var="deleteLink" value="/user/delete">
                        <c:param name="userId" value="${user.id}" />
                    </c:url>
                    <c:url var="detailLink" value="/user/detail">
                        <c:param name="userId" value="${user.id}" />
                    </c:url>
                    <tr>
                        <th scope="row">${user.fullName}</th>
                        <td>${user.teamMember}</td>
                        <td>
                            <sec:authorize access="hasRole('ADMIN')">
                                <a href="${updateLink}" class="btn btn-outline-success" role="button" aria-pressed="true">Update</a>
                            </sec:authorize>
                            <a href="${detailLink}" class="btn btn-outline-info" role="button" aria-pressed="true">Detail</a>
                            <sec:authorize access="hasRole('ADMIN')">
                                <a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this user?'))) return false" class="btn btn-outline-danger" role="button" aria-pressed="true">Delete</a>
                            </sec:authorize>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- User List Scroll -->
<!-- User List Scroll -->

<!-- Product List Scroll -->
<!-- Product List Scroll -->
<div data-spy="scroll" data-target="#navbar-example2" data-offset="0">
    <div class="container" style="padding-top: 500px; padding-bottom: 500px;" id="listProductsContainer">
        <div class="contentContainer">
            <div class="row">
                <div class="col-sm-10" id="container" style="border-left: 1px">
                    <p>
                        <sec:authorize access="hasRole('ADMIN')">
                            <a href="${pageContext.request.contextPath}/addProduct" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Add new Product</a>
                        </sec:authorize>
                    </p>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th scope="col">Product Name</th>
                            <th scope="col">Owner</th>
                            <th scope="col">Model</th>
                            <th scope="col">Memory</th>
                            <th scope="col">Purchase Date</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="product" items="${products}">
                            <c:url var="updateLink" value="/showFormForUpdate">
                                <c:param name="productId" value="${product.id}" />
                            </c:url>
                            <c:url var="detailLink" value="/detail">
                                <c:param name="productId" value="${product.id}" />
                            </c:url>
                            <c:url var="deleteLink" value="/delete">
                                <c:param name="productId" value="${product.id}" />
                            </c:url>
                            <tr>
                                <td>${product.productName}</td>
                                <th>${product.owner}</th>
                                <td>${product.model}</td>
                                <td>${product.memoryGb}</td>
                                <td>${product.purchaseDate}</td>
                                <td>
                                    <sec:authorize access="hasRole('ADMIN')">
                                        <a href="${updateLink}" class="btn btn-outline-success" role="button" aria-pressed="true">Update</a>
                                    </sec:authorize>
                                    <a href="${detailLink}" class="btn btn-outline-info" role="button" aria-pressed="true">Detail</a>
                                    <sec:authorize access="hasRole('ADMIN')">
                                        <a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this product?'))) return false" class="btn btn-outline-danger" role="button" aria-pressed="true">Delete</a>
                                    </sec:authorize>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Product List Scroll -->
<!-- Product List Scroll -->
</body>

<script src="../resources/static/jquery/jquery.min.js"></script>
<script src="../resources/static/bootstrap/js/bootstrap.bundle.min.js"></script>

</html>
