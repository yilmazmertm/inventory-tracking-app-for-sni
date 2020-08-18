<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Home Page</title>
    <link rel="stylesheet" type="text/css" href="../resources/static/style.css">
    <style>
        a, u {
            text-decoration: none;
        }
    </style>
</head>
<body class="body-class">
<div>
<h2 class="title">Inventory Tracking App</h2>

<ul class="opening-menu">
    <br><br>
    <li><a class="options" href="${pageContext.request.contextPath}/list"><h1>List Products</h1></a></li>
    <li><a class="options" href="${pageContext.request.contextPath}/addProduct"><h1>Add Product</h1></a></li>
    <li><a class="options" href="${pageContext.request.contextPath}/user/list"><h1>List Users</h1></a></li>
    <li><a class="options" href="${pageContext.request.contextPath}/user/addUser"><h1>Add User</h1></a></li>
</ul>
</div>

</body>
</html>
