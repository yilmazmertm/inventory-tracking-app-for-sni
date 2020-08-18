<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Item Detail Page</title>
    <link href="../resources/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/static/new-style.css" rel="stylesheet">

    <style>
        p{
            color: red;
        }
    </style>
</head>
<body>
<div class="container">
    <h3 class="my-4">${theProduct.productName}</h3>
    <div class="row">
        <div class="col-md-4">
            <h5 class="my-3">Manufacturer of the product</h5>
            <p>${theProduct.manufacturer}</p>
            <h5 class="my-3">Creation Time</h5>
            <p>${theProduct.create_time}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Owner of the product</h5>
            <p>${theProduct.owner}</p>
            <h5 class="my-3">Update Time</h5>
            <p>${theProduct.update_time}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Created By</h5>
            <p>${theProduct.createdBy}</p>
            <h5 class="my-3">Updated By</h5>
            <p>${theProduct.updatedBy}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Old Product Name</h5>
            <p>${theProduct.oldProductName}</p>
            <h5 class="my-3">Serial Number</h5>
            <p>${theProduct.serialNo}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Model</h5>
            <p>${theProduct.model}</p>
            <h5 class="my-3">Memory (GB)</h5>
            <p>${theProduct.memoryGb}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Operating System</h5>
            <p>${theProduct.operatingSystem}</p>
            <h5 class="my-3">Domain Name</h5>
            <p>${theProduct.domainName}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Setup Date</h5>
            <p>${theProduct.setupDate}</p>
            <h5 class="my-3">LAN Address</h5>
            <p>${theProduct.lanAddress}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">WLAN Address</h5>
            <p>${theProduct.wlanAddress}</p>
            <h5 class="my-3">Antivirus installation status</h5>
            <p>${theProduct.antivirus}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">License Number</h5>
            <p>${theProduct.licenseNumber}</p>
            <h5 class="my-3">Office installation status</h5>
            <p>${theProduct.officeApp}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Purchase Date</h5>
            <p>${theProduct.purchaseDate}</p>
            <h5 class="my-3">Seller</h5>
            <p>${theProduct.seller}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Setup Date for Windows</h5>
            <p>${theProduct.setupDateForWindows}</p>
            <h5 class="my-3">Notes</h5>
            <p>${theProduct.notes}</p>
        </div>
        <div class="col-md-4">
            <div class="my-3">
                <a href="${pageContext.request.contextPath}/list" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Geri Dön</a>
            </div>
            <div class="my-3">
                <a href="${pageContext.request.contextPath}/" class="btn btn-danger btn-lg" role="button" aria-pressed="true">Ana Sayfaya Dön</a>
            </div>
        </div>
    </div>
</div>
</body>
<footer>
    <script src="../resources/static/jquery/jquery.min.js"></script>
    <script src="../resources/static/bootstrap/js/bootstrap.bundle.min.js"></script>
</footer>
</html>
