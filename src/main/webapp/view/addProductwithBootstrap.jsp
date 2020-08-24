<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel = "stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Add an Inventory Item</title>

    <script>
        $(document).ready(function() {
            $("#showModal").click(function () {
                window.location.href = '/#openModal'
            });
        });
    </script>
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

            <div class="form-group">
                <label for="exampleInput">Product Name : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="productName" />
            </div>
            <div class="row">
                <div class="form-group col-sm">
                    <label for="exampleFormControlInput1">The Current Owner of the Product : </label>
                    <form:select class = "form-control" id="exampleFormControlInput1" path="user.id" items="${theUsers}" itemLabel="FullName" itemValue="Id" />
                </div>
                <div class="col-sm-auto">
                    <br>
                    <button id="showModal" type="button" class="btn btn-primary">Kullanıcı Ekle</button>
                </div>
            </div>
            <div class="form-group">
                <label for="exampleInput">Manufacturer : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="manufacturer" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Older name of the Product : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="oldProductName" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Model : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="model"/>
            </div>
            <div class="form-group">
                <label for="exampleInput">Serial Number : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="serialNo" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Memory (GB) : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="memoryGb"/>
            </div>
            <div class="form-group">
                <label for="exampleInput">Domain Name : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="domainName" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Lan Address : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="lanAddress" />
            </div>
            <div class="form-group">
                <label for="exampleInput">WLAN Address : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="wlanAddress" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Antivirus : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="antivirus"/>
            </div>
            <div class="form-group">
                <label for="exampleInput">License Number : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="licenseNumber" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Office App Installation Status : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="officeApp" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Information about the Seller : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="seller" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Product Number : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="productNumber" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Additional Note : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="notes"/>
            </div>
            <div class="form-group">
                <label for="exampleInput">Purchase Date (MM-dd-yyyy) : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="purchaseDate" />
            </div>
            <div class="form-group">
                <label for="exampleInput">Setup Date for Windows (MM-dd-yyyy) : </label>
                <form:input type="text" class="form-control" id="exampleInput" path="setupDateForWindows" />
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Add Product"/>
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
