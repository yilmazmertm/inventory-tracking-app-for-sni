<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <title>Kullanıcı Detay Sayfası</title>
    <link href="../resources/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/static/css/new-style-homepage.css" rel="stylesheet">
    <style>
        p{
            color: red;
        }
    </style>
</head>
<body>
<div class="container">
    <h3 class="my-4">${theUser.fullName}</h3>
    <div class="row">
        <div class="col-md-4">
            <h5 class="my-3">İsim</h5>
            <p>${theUser.userName}</p>
            <h5 class="my-3">Email</h5>
            <p>${theUser.email}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Soyisim</h5>
            <p>${theUser.userLastName}</p>
            <h5 class="my-3">Yetkinlik Seviyesi</h5>
            <p>${theUser.userRole}</p>
        </div>
        <div class="col-md-4">
            <div class="my-3">
                <a href="${pageContext.request.contextPath}/" class="btn btn-danger btn-lg" role="button" aria-pressed="true">Ana Sayfaya Dön</a>
            </div>
        </div>
    </div>
</div>
</body>
<footer>
    <script src="../resources/static/jquery/jquery.min.js"></script>
    <script src="../resources/static/bootstrap/js/bootstrap.bundle.min.js"></script>
</footer>
</html>