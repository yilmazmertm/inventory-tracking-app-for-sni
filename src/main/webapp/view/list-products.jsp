<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Product List Page</title>
</head>
<body>

<table>
    <tr>
        <th>Product Id</th>
        <th>Product Manufacturer</th>
        <th>Product Name</th>
    </tr>

    <c:forEach var="product" items="${products}">
        <tr>
            <td> ${product.id} </td>
            <td> ${product.manufacturer} </td>
            <td> ${product.productName} </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
