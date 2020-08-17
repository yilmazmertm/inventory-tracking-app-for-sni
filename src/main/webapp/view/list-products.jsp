<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<html>
<head>
    <meta charset="utf-8">
    <link href = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel = "stylesheet">
    <link rel="stylesheet" type="text/css" href="../resources/style.css">
    <title>Product List Page</title>
</head>
<body>
<table class="table table-hover">
    <thead>
    <tr>
        <th scope="col">Owner</th>
        <th scope="col">Product Name</th>
        <th scope="col">Manufacturer</th>
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
        <c:url var="deleteLink" value="/delete">
            <c:param name="productId" value="${product.id}" />
        </c:url>
        <tr>
            <th>${product.owner}</th>
            <td>${product.productName}</td>
            <td>${product.manufacturer}</td>
            <td>${product.model}</td>
            <td>${product.memoryGb}</td>
            <td>${product.purchaseDate}</td>
            <td><a href="${updateLink}"> Update</a> -- <a href="${deleteLink}"> Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p>
    <a href="${pageContext.request.contextPath}/user/addUser" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Üye olun</a>
    <a href="${pageContext.request.contextPath}/" class="btn btn-danger btn-lg" role="button" aria-pressed="true">Ana Sayfaya Dön</a>
</p>
</body>
</html>
