
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
</head>
<body>
<h2>Main Menu</h2>

<ul>
    <li><a href="${pageContext.request.contextPath}/list"><h1>List Products</h1></a></li>
    <li><a href="${pageContext.request.contextPath}/addProduct"><h1>Add Product</h1></a></li>
    <li><a href="${pageContext.request.contextPath}/user/list"><h1>List Users</h1></a></li>
    <li><a href="${pageContext.request.contextPath}/user/addUser"><h1>Add User</h1></a></li>
</ul>

</body>
</html>
