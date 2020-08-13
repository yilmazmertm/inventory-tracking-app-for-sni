<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Home Page</title>
    <link rel="stylesheet" href="../resources/style.css">
</head>
<body>
<img class = "ui-icon-background" src="../resources/SNIwallpaper.jpg">
<h2 class="title">Main Menu</h2>

<ul class="opening-menu">
    <li class="items"><a href="${pageContext.request.contextPath}/list"><h1>List Products</h1></a></li>
    <li><a href="${pageContext.request.contextPath}/addProduct"><h1>Add Product</h1></a></li>
    <li><a href="${pageContext.request.contextPath}/user/list"><h1>List Users</h1></a></li>
    <li><a href="${pageContext.request.contextPath}/user/addUser"><h1>Add User</h1></a></li>
</ul>

</body>
</html>
