<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="../resources/static/logo-sni.png">
    <title>SNI Inventory Tracking App - Registiration Page</title>
    <link rel="canonical" href="../resources/static/logo-sni.png">
    <link href="../resources/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="../resources/static/sigin.css" rel="stylesheet">
</head>

<body class="text-center">
<form:form action="doRegister" modelAttribute="user" method="post" class="form-signin">
    <img class="mb-4" src="../resources/static/logo-sni.png" alt="" width="98" height="77">
    <h1 class="h3 mb-3 font-weight-normal">Please Register</h1>

    <div class="form-group">
        <label for="exampleInput">First Name : </label>
        <form:input type="text" class="form-control" id="exampleInput" path="userName" />
    </div>
    <div class="form-group">
        <label for="exampleInput">Last name : </label>
        <form:input type="text" class="form-control" id="exampleInput" path="userLastName" />
    </div>
    <div class="form-group">
        <label for="exampleInput">Email : </label>
        <form:input type="email" class="form-control" id="exampleInput" path="email" />
    </div>
    <div class="form-group">
        <label for="exampleInput">Password : </label>
        <form:input type="password" class="form-control" id="exampleInput" path="password" />
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
    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>

</form:form>
</body>
</html>
