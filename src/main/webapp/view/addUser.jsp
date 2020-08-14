<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Kullanıcı Ekleme Sayfası</title>
    <link rel="stylesheet" type="text/css" href="../resources/style.css">
</head>
<body class="list-products">

<form:form action="saveUser" modelAttribute="user" method="post">

    <form:hidden path="id" />

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
            <td><label>Please enter your team at the company:</label></td>
            <td>
                <form:select path="teamMember">
                    <form:option value="Java" />
                    <form:option value="Abap" />
                    <form:option value="Destek" />
                    <form:option value="Bilgi Islem" />
                    <form:option value="IK" />
                    <form:option value="Stajyer" />
                </form:select>
            </td>
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
