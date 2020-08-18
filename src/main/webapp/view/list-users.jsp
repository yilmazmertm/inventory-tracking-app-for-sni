<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<html>
<head>
    <title>List Users Page</title>
    <link href = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel = "stylesheet">
</head>
<body class="list-products">
<div class="contentContainer">
    <p>
        <a href="${pageContext.request.contextPath}/user/addUser" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Add new User</a>
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
            <tr>
                <th scope="row">${user.fullName}</th>
                <td>${user.teamMember}</td>
                <td>
                    <a href="${updateLink}" class="btn btn-outline-success" role="button" aria-pressed="true">Update</a>
                    <a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this user?'))) return false" class="btn btn-outline-danger" role="button" aria-pressed="true">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
