<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <title>List Users Page</title>
    <link href = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel = "stylesheet">
</head>
<body class="list-products">
<div class="contentContainer">
    <sec:authorize access="hasRole('ADMIN')">
        <p>
            <a href="${pageContext.request.contextPath}/user/addUser" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Add new User</a>
        </p>
    </sec:authorize>
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Full Name</th>
            <th scope="col">Team</th>
            <sec:authorize access="hasRole('ADMIN')">
                <th scope="col">Action</th>
            </sec:authorize>
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
                <sec:authorize access="hasRole('ADMIN')">
                    <td>
                        <a href="${updateLink}" class="btn btn-outline-success" role="button" aria-pressed="true">Update</a>
                        <a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this user?'))) return false" class="btn btn-outline-danger" role="button" aria-pressed="true">Delete</a>
                    </td>
                </sec:authorize>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <p>
        <a href="${pageContext.request.contextPath}/" class="btn btn-danger btn-lg" role="button" aria-pressed="true">Ana Sayfaya Dön</a>
    </p>
</div>
</body>
</html>
