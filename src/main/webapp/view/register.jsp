<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="../resources/static/img/logo-sni.png">
    <title>SNI Envanter Takip Sistemi - Kaydol</title>
    <link rel="canonical" href="../resources/static/img/logo-sni.png">
    <link href="../resources/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/static/css/sigin.css" rel="stylesheet">
</head>
<body class="text-center">
<form:form action="doRegister" modelAttribute="user" method="post" class="form-signin">
    <img class="mb-4" src="../resources/static/img/logo-sni.png" alt="" width="98" height="77">
    <h1 class="h3 mb-3 font-weight-normal">Lütfen Kaydolun</h1>

    <div class="form-group">
        <label for="exampleInput">İsim : </label>
        <form:input type="text" class="form-control" id="exampleInput" path="userName" required="required"/>
    </div>
    <div class="form-group">
        <label for="exampleInput">Soyisim : </label>
        <form:input type="text" class="form-control" id="exampleInput" path="userLastName" required="required"/>
    </div>
    <div class="form-group">
        <label for="exampleInput">Email : </label>
        <form:input type="email" class="form-control" id="exampleInput" path="email" required="required"/>
    </div>
    <div class="form-group">
        <label for="exampleInput">Şifre : </label>
        <form:input type="password" class="form-control" id="exampleInput" path="password" required="required"/>
    </div>
    <div class="form-group">
        <label for="exampleFormControlSelect1">Şirketteki takım : </label>
        <form:select path="teamMember" class="form-control" id="exampleFormControlSelect1" >
            <form:option value="Java" />
            <form:option value="Abap" />
            <form:option value="Destek" />
            <form:option value="Bilgi Islem" />
            <form:option value="IK" />
            <form:option value="Stajyer" />
        </form:select>
    </div>
    <c:if test="${not empty message}">
        <span style="color:green"><c:out value="${message}"/></span>
        <c:remove var="message" scope="session" />
        <br><br>
    </c:if>
    <c:if test="${not empty isUnique}">
        <span style="color:green"><c:out value="${isUnique}"/></span>
        <c:remove var="message" scope="session" />
        <br><br>
    </c:if>

    <button class="btn btn-lg btn-primary btn-block" type="submit">Kaydol</button>
    <br><br>
    <div class="checkbox mb-3">
        <a href="${pageContext.request.contextPath}/login" class="btn btn-secondary">Giriş Sayfasına Gidin</a>
    </div>
</form:form>
</body>
</html>