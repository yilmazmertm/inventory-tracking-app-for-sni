<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Kullanıcı Ekleme Sayfası</title>
    <link href = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel = "stylesheet">
</head>
<body class="list-products">
<div class="col-sm-8" id="content" style="border-left: 1px;">
    <form:form action="saveUser" modelAttribute="user" method="post">

        <h2>Fill the form to enter a new User</h2>

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
            <label for="exampleFormControlSelect1">Team at the Company</label>
            <form:select path="teamMember" class="form-control" id="exampleFormControlSelect1">
                <form:option value="Java" />
                <form:option value="Abap" />
                <form:option value="Destek" />
                <form:option value="Bilgi Islem" />
                <form:option value="IK" />
                <form:option value="Stajyer" />
            </form:select>
        </div>
        <div class="form-group">
            <input type="submit" class="btn btn-primary btn-lg" value="Save User"/>
        </div>
    </form:form>
    <a href="${pageContext.request.contextPath}/" class="btn btn-danger btn-lg" role="button" aria-pressed="true">Ana Sayfaya Dön</a>
</div>

</body>
</html>
