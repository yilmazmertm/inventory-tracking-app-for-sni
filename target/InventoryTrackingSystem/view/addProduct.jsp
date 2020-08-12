<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Product Page</title>
</head>
<body>
<h2>Add Product</h2>

<form:form action="saveProduct" modelAttribute="theProduct" method="POST">
    <p>
            ${theUsers}
    </p>
    <table>
        <tbody>
        <tr>
            <td><label>Product Name : </label></td>
            <td><form:input path="productName" /></td>
        </tr>
        <tr>
            <td><label>Manufacturer : </label></td>
            <td><form:input path="manufacturer" /></td>
        </tr>
        <tr>
            <td><label>Owner : </label></td>
            <td><form:input path="owner" /></td>
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
