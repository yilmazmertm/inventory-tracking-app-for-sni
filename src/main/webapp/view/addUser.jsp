<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kullanıcı Ekleme Sayfası</title>
</head>
<body>

<form:form action="saveUser" modelAttribute="userAddModel" method="POST">
    <table>
        <tbody>
        <tr>
            <td><label>First Name:</label></td>
            <td><form:input path="userName" /></td>
        </tr>
        <tr>
            <td><label>Last name:</label></td>
            <td><form:input path="userLastName" /></td>
        </tr>
        <tr>
            <td><label></label></td>
            <td><input type="submit" value="Save" class="save" /></td>
        </tr>
        </tbody>
    </table>
</form:form>

<a href="${pageContext.request.contextPath}/">Geri dön</a>

</body>
</html>
