<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <title>Ürün Detayları</title>
    <link href="../resources/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/static/new-style-homepage.css" rel="stylesheet">

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
            <h5 class="my-3">Ürünün üretici</h5>
            <p>${theProduct.manufacturer}</p>
            <h5 class="my-3">Ürünün eklenme Tarihi</h5>
            <p>${theProduct.create_time}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Ürünün şu an ki sahibi</h5>
            <p>${theProduct.owner}</p>
            <h5 class="my-3">Ürünün güncellenme Tarihi</h5>
            <p>${theProduct.update_time}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Ekleyen Kullanıcı</h5>
            <p>${theProduct.createdBy}</p>
            <h5 class="my-3">Güncelleyen Kullanıcı</h5>
            <p>${theProduct.updatedBy}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Ürünün Eski Adı</h5>
            <p>${theProduct.oldProductName}</p>
            <h5 class="my-3">Seri Numarası</h5>
            <p>${theProduct.serialNo}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Model</h5>
            <p>${theProduct.model}</p>
            <h5 class="my-3">Belleği (GB)</h5>
            <p>${theProduct.memoryGb}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">İşletim Sistemi</h5>
            <p>${theProduct.operatingSystem}</p>
            <h5 class="my-3">Domain İsmi</h5>
            <p>${theProduct.domainName}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Kurulum Tarihi</h5>
            <p>${theProduct.setupDate}</p>
            <h5 class="my-3">LAN Adresi</h5>
            <p>${theProduct.lanAddress}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">WLAN Adresi</h5>
            <p>${theProduct.wlanAddress}</p>
            <h5 class="my-3">Antivirus Yüklenme Durumu</h5>
            <p>${theProduct.antivirus}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Lisans Numarası</h5>
            <p>${theProduct.licenseNumber}</p>
            <h5 class="my-3">Office Kurulum Durumu</h5>
            <p>${theProduct.officeApp}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Alım Tarihi</h5>
            <p>${theProduct.purchaseDate}</p>
            <h5 class="my-3">Satıcı</h5>
            <p>${theProduct.seller}</p>
        </div>
        <div class="col-md-4">
            <h5 class="my-3">Windows Kurulum Tarihi</h5>
            <p>${theProduct.setupDateForWindows}</p>
            <h5 class="my-3">Ekstra Notlar</h5>
            <p>${theProduct.notes}</p>
        </div>
        <div class="col-md-4">
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
