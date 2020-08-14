<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<html>
<head>
    <title>List Users Page</title>
    <link rel="stylesheet" type="text/css" href="../resources/style.css">
</head>
<body class="list-products">
<table>
    <tr>
        <th>User Name and Surname</th>
        <th>Team</th>
        <th>Action</th>
    </tr>

    <c:forEach var="user" items="${users}">
        <c:url var="updateLink" value="/user/showFormForUpdate">
            <c:param name="userId" value="${user.id}" />
        </c:url>
        <c:url var="deleteLink" value="/user/delete">
            <c:param name="userId" value="${user.id}" />
        </c:url>

        <tr>
            <td> ${user.fullName} </td>
            <td> ${user.teamMember} </td>
            <td><a href="${updateLink}">Update</a> -- <a href="${deleteLink}">Delete</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
