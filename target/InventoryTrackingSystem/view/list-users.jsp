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
    <p>
        <a href="${pageContext.request.contextPath}/" class="btn btn-danger btn-lg" role="button" aria-pressed="true">Ana Sayfaya Dön</a>
    </p>
</div>
</body>
</html>
