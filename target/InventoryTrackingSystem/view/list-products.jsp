<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <meta charset="utf-8">
    <link href = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel = "stylesheet">
    <title>Product List Page</title>
</head>
<body>
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
                    <c:url var="detailLink" value="/detail">
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
            <p>
                <a href="${pageContext.request.contextPath}/" class="btn btn-danger btn-lg" role="button" aria-pressed="true">Ana Sayfaya Dön</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>