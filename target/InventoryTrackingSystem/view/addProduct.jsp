<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel = "stylesheet">
    <title>Add an Inventory Item</title>
</head>
<body class="add-product">
<h2>Lütfen ürün ekleyiniz, ürünün kime ait olacağını dikkatle seçiniz.</h2>
<hr>
<p>
<h4> Kullanıcı Listesinde Adınız yok ise, hemen kayıt yaptırın</h4>
<br>
<a href="${pageContext.request.contextPath}/user/addUser">Üye olun</a>
</p>
<form:form action="saveProduct" modelAttribute="theProduct" method="post">

    <form:hidden path="id" />

    <table>
        <tbody>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Product Name : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="productName" /></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleFormControlInput1">The Current Owner of the Product : </label></td>
                <td>
                    <form:select class = "form-control" id="exampleFormControlInput1" path="user.id" items="${theUsers}" itemLabel="FullName" itemValue="Id">
                    </form:select>
                </td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Manufacturer : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="manufacturer" /></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Older name of the Product : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="oldProductName" /></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Model : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="model"/></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Serial Number : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="serialNo" /></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Memory (GB) : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="memoryGb"/></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Operating System : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="operatingSystem" /></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Domain Name : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="domainName" /></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Lan Address : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="lanAddress" /></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">WLAN Address : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="wlanAddress" /></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Antivirus : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="antivirus"/></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">License Number : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="licenseNumber" /></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Office App Installation Status : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="officeApp" /></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Information about the Seller : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="seller" /></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Product Number : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="productNumber" /></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Additional Note : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="notes"/></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Purchase Date (MM-dd-yyyy) : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="purchaseDate" /></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Setup Date (MM-dd-yyyy) : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="setupDate" /></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label for="exampleInput">Setup Date for Windows (MM-dd-yyyy) : </label></td>
                <td><form:input type="text" class="form-control" id="exampleInput" path="setupDateForWindows" /></td>
            </div>
        </tr>
        <tr>
            <div class="form-group">
                <td><label></label></td>
                <td><input type="submit" class="btn btn-primary" value="Save"/></td>
            </div>
        </tr>
        </tbody>
    </table>
</form:form>

<footer>
    <script src = "https://code.jquery.com/jquery.js"></script>
    <script src = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</footer>
</body>
</html>
