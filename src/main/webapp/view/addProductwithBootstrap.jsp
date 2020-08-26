<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <link href = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel = "stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="../resources/static/js/addProduct.js"></script>
    <title>Ürün ekleme Sayfası</title>
</head>
<body>
<h2>Lütfen ürün ekleyiniz, ürünün kime ait olacağını dikkatle seçiniz.</h2>
<hr>
<br>
<div class="container" style="place-content: center;">
    <div class="col-sm-2">

    </div>
    <div class="col-sm-8" id="content" style="border-left: 1px;">
        <form:form action="saveProduct" modelAttribute="theProduct" method="post">
            <form:hidden path="id" />
            <form:hidden path="createdBy" />
            <form:hidden path="updatedBy" />
            <form:hidden path="create_time" class="date"/>
            <form:hidden path="update_time" class="date"/>

            <div class="form-group">
                <label for="exampleInput">Ürün İsmi : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="productName" />
            </div>
            <div class="row">
                <div class="form-group col-sm">
                    <label for="exampleFormControlInput1">Ürünün sahibi : </label>
                    <form:select class = "form-control" id="exampleFormControlInput1" path="user.id" items="${theUsers}" itemLabel="FullName" itemValue="Id" />
                </div>
                <div class="col-sm-auto">
                    <br>
                    <button id="showModal" type="button" class="btn btn-primary">Kullanıcı Ekle</button>
                </div>
            </div>
            <div class="form-group">
                <label for="exampleInput">Üretici : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="manufacturer" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Ürünün eski adı : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="oldProductName" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Modeli : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="model"/>
            </div>
            <div class="form-group">
                <label for="exampleInput">Seri Numarası : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="serialNo" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Belleği (GB) : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="memoryGb"/>
            </div>
            <div class="form-group">
                <label for="exampleInput">Domain İsmi : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="domainName" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Lan Adresi : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="lanAddress" />
            </div>
            <div class="form-group">
                <label for="exampleInput">WLAN Adresi : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="wlanAddress" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Antivirus durumu : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="antivirus"/>
            </div>
            <div class="form-group">
                <label for="exampleInput">Lisans numarası : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="licenseNumber" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Office Uyg. Yüklenme Durumu : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="officeApp" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Satın alınan kurum hakkında ek bilgi : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="seller" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Ürün numarası : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="productNumber" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Ekstra Not : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="notes"/>
            </div>
            <div class="form-group">
                <label for="exampleInput">Alış Tarihi (AA-gg-yyyy) : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="purchaseDate" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Windows Kurulum Tarihi (AA-gg-yyyy) : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="setupDateForWindows" />
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Ürün Ekle"/>
                <a href="${pageContext.request.contextPath}/" class="btn btn-danger " role="button" aria-pressed="true">Ana Sayfaya Dön</a>
            </div>
        </form:form>
    </div>
</div>
</body>
<footer>
    <script src = "https://code.jquery.com/jquery.js"></script>
    <script src = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</footer>
</html>
