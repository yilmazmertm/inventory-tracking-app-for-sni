<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<html>
<head>
    <style>
        table, th, td {
            border: 1px solid black;
            align-content: center;
        }
    </style>
    <title>Product List Page</title>
</head>
<body>
<table>
    <tr>
        <th>Product Name</th>
        <th>Owner</th>
        <th>Manufacturer</th>
        <th>Old Name</th>
        <th>Model</th>
        <th>Serial No</th>
        <th>Memory (GB)</th>
        <th>OS</th>
        <th>Domain</th>
        <th>LAN</th>
        <th>WLAN</th>
        <th>AntiVirus</th>
        <th>License No</th>
        <th>Office</th>
        <th>Seller</th>
        <th>Product No</th>
        <th>Additional Note</th>
        <th>Purchase D.</th>
        <th>Setup D.</th>
        <th>Setup D. for OS</th>
        <th>Action</th>
    </tr>

    <c:forEach var="product" items="${products}">
        <c:url var="updateLink" value="/showFormForUpdate">
            <c:param name="productId" value="${product.id}" />
        </c:url>
        <c:url var="deleteLink" value="/delete">
            <c:param name="productId" value="${product.id}" />
        </c:url>


        <tr>
            <td> ${product.productName} </td>
            <td> ${product.createdBy} </td>
            <td> ${product.manufacturer} </td>
            <td> ${product.oldProductName} </td>
            <td> ${product.model} </td>
            <td> ${product.serialNo} </td>
            <td> ${product.memoryGb} </td>
            <td> ${product.operatingSystem} </td>
            <td> ${product.domainName} </td>
            <td> ${product.lanAddress} </td>
            <td> ${product.wlanAddress} </td>
            <td> ${product.antivirus} </td>
            <td> ${product.licenseNumber} </td>
            <td> ${product.officeApp} </td>
            <td> ${product.seller} </td>
            <td> ${product.productNumber} </td>
            <td> ${product.notes} </td>
            <td> ${product.purchaseDate} </td>
            <td> ${product.setupDate} </td>
            <td> ${product.setupDateForWindows} </td>
            <td><a href="${updateLink}"> Update</a> -- <a href="${deleteLink}"> Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
