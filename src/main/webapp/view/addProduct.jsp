<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../resources/style.css">
    <title>Add an Inventory Item</title>
</head>
<body class="add-product">
<h3>Please enter an Inventory Item with carefully checking the "owner" column.</h3>
<hr>
<p>
    <h4> Kullanıcı Listesinde Adınız yok ise, hemen kayıt yaptırın</h4>
<br>
<a href="${pageContext.request.contextPath}/user/addUser">Üye olun</a>
</p>
<form:form action="saveProduct" modelAttribute="theProduct" method="POST">
    <table>
        <tbody>
        <tr>
            <td><label>Product Name : </label></td>
            <td><form:input path="productName" /></td>
        </tr>
        <tr>
            <td>The Owner of the Product : </td>
            <td><form:select path="user.id" items="${user_ids}">
            </form:select></td>
        </tr>
        <tr>
            <td><label>Manufacturer : </label></td>
            <td><form:input path="manufacturer" /></td>
        </tr>
        <tr>
            <td><label>Older name of the Product : </label></td>
            <td><form:input path="oldProductName" /></td>
        </tr>
        <tr>
            <td><label>Model : </label></td>
            <td><form:input path="model" /></td>
        </tr>
        <tr>
            <td><label>Serial Number : </label></td>
            <td><form:input path="serialNo" /></td>
        </tr>
        <tr>
            <td><label>Memory (GB) : </label></td>
            <td><form:input path="memoryGb" /></td>
        </tr>
        <tr>
            <td><label>Operating System : </label></td>
            <td><form:input path="operatingSystem" /></td>
        </tr>
        <tr>
            <td><label>Domain Name : </label></td>
            <td><form:input path="domainName" /></td>
        </tr>

        <tr>
            <td><label>Lan Address : </label></td>
            <td><form:input path="lanAddress" /></td>
        </tr>
        <tr>
            <td><label>WLAN Address : </label></td>
            <td><form:input path="wlanAddress" /></td>
        </tr>
        <tr>
            <td><label>Antivirus : </label></td>
            <td><form:input path="antivirus" /></td>
        </tr>
        <tr>
            <td><label>License Number : </label></td>
            <td><form:input path="licenseNumber" /></td>
        </tr>
        <tr>
            <td><label>Office App Installation Status : </label></td>
            <td><form:input path="officeApp" /></td>
        </tr>

        <tr>
            <td><label>Information about the Seller : </label></td>
            <td><form:input path="seller" /></td>
        </tr>
        <tr>
            <td><label>Product Number : </label></td>
            <td><form:input path="productNumber" /></td>
        </tr>

        <tr>
            <td><label>Additional Note : </label></td>
            <td><form:input path="notes" cssClass="form-control"/></td>
        </tr>
        <tr>
            <td><label>Purchase Date (MM-dd-yyyy) : </label></td>
            <td><form:input path="purchaseDate" /></td>
        </tr>
        <tr>
            <td><label>Setup Date (MM-dd-yyyy) : </label></td>
            <td><form:input path="setupDate" /></td>
        </tr>
        <tr>
            <td><label>Setup Date for Windows (MM-dd-yyyy) : </label></td>
            <td><form:input path="setupDateForWindows" /></td>
        </tr>
        <tr>
            <td><label></label></td>
            <td><input type="submit" value="Save" class="save" /></td>
        </tr>
        </tbody>
    </table>
</form:form>
</body>
</html>
