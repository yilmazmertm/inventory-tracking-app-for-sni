<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Kullanıcı Ekleme Sayfası</title>
    <link href = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel = "stylesheet">
    <link rel="stylesheet" type="text/css" href="../resources/style.css">
</head>
<body class="list-products">

<form:form action="saveUser" modelAttribute="user" method="post">

    <form:hidden path="id" />
    <div class="form-group">
        <label for="exampleInput">First Name : </label>
        <form:input type="text" class="form-control" id="exampleInput" path="userName" />
    </div>
    <div class="form-group">
        <label for="exampleInput">Last name : </label>
        <form:input type="text" class="form-control" id="exampleInput" path="userLastName" />
    </div>
    <div class="form-group">
        <label for="exampleFormControlSelect1">First Name:</label>
        <form:select path="teamMember" class="form-control" id="exampleFormControlSelect1">
            <form:option value="Java" />
            <form:option value="Abap" />
            <form:option value="Destek" />
            <form:option value="Bilgi Islem" />
            <form:option value="IK" />
            <form:option value="Stajyer" />
        </form:select>
    </div>
</form:form>

<a href="${pageContext.request.contextPath}/">Geri dön</a>

</body>
</html>
