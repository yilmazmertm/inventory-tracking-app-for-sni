<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <style>
        table, th, td {
            border: 1px solid black;
            align-content: center;
        }
    </style>
    <title>List Users Page</title>
</head>
<body>
<table>
    <tr>
        <th>User Name and Surname</th>
        <th>Team</th>
    </tr>

    <c:forEach var="user" items="${user}">
        <tr>
            <td> ${user.fullName} </td>
            <td> ${user.teamMember} </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
