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
    <title>SNI Envanter Takip Sistemi</title>
    <link rel="canonical" href="../resources/static/img/logo-sni.png">
    <link href="../resources/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/static/css/sigin.css" rel="stylesheet">
</head>
<body class="text-center">
<form:form action="/perform_login" method="post" class="form-signin">
    <img class="mb-4" src="../resources/static/img/logo-sni.png" alt="" width="98" height="77">
    <h1 class="h3 mb-3 font-weight-normal">Lütfen Giriş Yapınız</h1>
    <label for="inputEmail" class="sr-only">Email adresi</label>
    <input type="email" id="inputEmail" name="changedUsername" class="form-control" placeholder="Email adresi" required autofocus>
    <label for="inputPassword" class="sr-only" >Şifre</label>
    <input type="password" id="inputPassword" class="form-control" name="changedPassword" placeholder="Şifre" required>
    <c:if test="${not empty sessionScope.message}">
        <span style="color:green"><c:out value="${sessionScope.message}"/></span>
        <c:remove var="message" scope="session" />
        <br><br>
    </c:if>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Giriş Yap</button>
    <br>
    <div class="checkbox mb-3">
        <a href="${pageContext.request.contextPath}/user/getRegister" class="btn btn-secondary">Kaydolmak için tıklayın</a>
    </div>
</form:form>
</body>
</html>
