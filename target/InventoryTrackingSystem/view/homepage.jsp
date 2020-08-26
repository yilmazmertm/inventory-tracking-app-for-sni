<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SNI Envanter Takip Sistemi</title>

    <script src="../resources/static/jquery/jquery.js" ></script>
    <script src="../resources/static/jquery/jquery-ui-1.12.1/jquery-ui.js"></script>
    <script src="../resources/static/js/homepage.js"></script>
    <link href="../resources/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/static/new-style-homepage.css" rel="stylesheet">

</head>
<body>
<!-- Navigation Bar -->
<!-- Navigation Bar -->
<nav id="navbar-example2" class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">Envanter Takip Sistemi</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="btn btn-primary" id="scrollToTop" href="#">Yukarıya Kaydır</a>
            </li>
            <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                    <p class="nav-link"> Hoşgeldin <sec:authentication property="name"/></p>
                </li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link" href='<spring:url value="/perform_logout"/>'>Çıkış Yap</a>
                </li>
            </sec:authorize>
        </ul>
    </div>
</nav>
<!-- Navigation Bar -->
<!-- Navigation Bar -->
<header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner" role="listbox">
            <div class="carousel-item active" style="background-image: url('../resources/static/SNIwallpaper - Copy2.jpg'); height: 400px; width: 1900px;">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Envanter Takip Sistemi</h3>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="container">
    <p style="text-align: center">
        <c:if test="${not empty message}">
            <span style="color:green"><c:out value="${message}"/></span>
            <c:remove var="message" scope="session" />
            <br><br>
        </c:if>
    </p>
    <h1 class="my-4" style="text-align: center">SNI Envanter Takip Sistemine Hoşgeldiniz</h1>
    <div class="row">
        <sec:authorize access="hasRole('ADMIN')">
            <div class="col-lg-3 mb-3">
                <div class="card h-100">
                    <h4 class="card-header">Ürün Ekleyebilirsiniz</h4>
                    <div class="card-body">
                        <p class="card-text">Eğer yeni bir ürün alındıysa, lütfen sisteme girişini yapınız. Ürün ile ilgili bilgileri dikkatle doldurmaya özen gösteriniz.</p>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/addProduct" class="btn btn-primary">Ürün Ekle !</a>
                    </div>
                </div>
            </div>
        </sec:authorize>
        <sec:authorize access="hasRole('ADMIN')">
        <div class="col-lg-3 mb-3">
            </sec:authorize>
            <sec:authorize access="hasRole('USER')">
            <div class="col-lg-6 mb-6">
                </sec:authorize>
                <div class="card h-100">
                    <h4 class="card-header">Bulunan Ürünleri Listeleyebilirsiniz</h4>
                    <div class="card-body">
                        <p class="card-text">Bu sekmeden şirkette bulunan bütün ürünleri listeleyebilirsiniz. Bu liste hangi kullanıcının hangi ürüne sahip olduğu hakkında fikir verecektir.</p>
                    </div>
                    <div class="card-footer">
                        <a href="#listProductsContainer" class="btn btn-primary">Hemen Listele !</a>
                    </div>
                </div>
            </div>
            <sec:authorize access="hasRole('ADMIN')">
                <div class="col-lg-3 mb-3">
                    <div class="card h-100">
                        <h4 class="card-header">Kullanıcı Ekleyebilirsiniz</h4>
                        <div class="card-body">
                            <p class="card-text">Eğer şirkete yeni gelen bir çalışan var ise, sisteme kullanıcı girişi yapmalısınız. Yeni kullanıcının yetkinliğini ve durumunu dikkatle seçiniz.</p>
                        </div>
                        <div class="card-footer">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addUserModal">Kullanıcı Ekle !</button>
                        </div>
                    </div>
                </div>
            </sec:authorize>


            <!-- Add User Modal -->
            <!-- Add User Modal -->
            <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Kullanıcı Eklemek için lütfen formu doldurun</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="inputFirstName" class="col-form-label">İsim</label>
                                <input type="email" id="inputFirstName" class="form-control" required autofocus>
                            </div>
                            <div class="form-group">
                                <label for="inputLastName" class="col-form-label">Soyisim</label>
                                <input type="email" id="inputLastName" class="form-control" required autofocus>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="col-form-label">Kullanıcının Yetkinliği</label>
                                <select class="form-control" id="inputRole">
                                    <option value="ROLE_ADMIN">Admin</option>
                                    <option value="ROLE_USER">Kullanıcı</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="inputTeamRole" class="col-form-label">Şirketteki takımı</label>
                                <select class="form-control" id="inputTeamRole">
                                    <option value="Java">Java</option>
                                    <option value="Abap">Abap</option>
                                    <option value="Destek">Destek</option>
                                    <option value="Bilgi Islem">Bilgi Islem</option>
                                    <option value="IK">IK</option>
                                    <option value="Stajyer">Stajyer</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="col-form-label">Email adresi</label>
                                <input type="email" id="inputEmail" name="changedUsername" class="requiredField form-control" placeholder="lütfen geçerli bir e-mail adresi girin" required autofocus>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword" class="col-form-label" >Şifre</label>
                                <input type="password" id="inputPassword" class="form-control" name="changedPassword" placeholder="Şifre" required>
                            </div>
                            <div class="form-group">
                                <label for="inputActive" class="col-form-label">Aktiflik durumu</label>
                                <select class="form-control" id="inputActive">
                                    <option value="true">Aktif</option>
                                    <option value="false">Hizmet Dışı</option>
                                </select>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                                <button id="submitButtonForForm" type="button" class="btn btn-primary">Değişiklikleri Kaydet</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Add User Modal -->
            <!-- Add User Modal -->
            <sec:authorize access="hasRole('ADMIN')">
            <div class="col-lg-3 mb-3">
                </sec:authorize>
                <sec:authorize access="hasRole('USER')">
                <div class="col-lg-6 mb-6">
                    </sec:authorize>

                    <div class="card h-100">
                        <h4 class="card-header">Kullanıcıları Listeyebilirsiniz</h4>
                        <div class="card-body">
                            <p class="card-text">Eğer bir kullanıcı hakkında daha detaylı bilgiye ulaşmak isterseniz, kullanıcıları listeyebilirsiniz.</p>
                        </div>
                        <div class="card-footer">
                            <a href="#listUserContainer" class="btn btn-primary" type="button">Kullanıcıları Listele !</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- User List Scroll -->
<!-- User List Scroll -->
<div data-spy="scroll" data-target="#navbar-example2" data-offset="100">
    <div class="container" style="padding-top: 500px; margin-bottom: 500px" id="listUserContainer">
        <div class="contentContainer">
            <p>
                <sec:authorize access="hasRole('ADMIN')">
                    <button id="addUseratTable" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Kullanıcı Ekle</button>
                </sec:authorize>
            </p>
            <table class="table table-hover" style="border-spacing: 10px;">
                <thead>
                <tr>
                    <th scope="col">Tam İsim</th>
                    <th><br/></th>
                    <th scope="col">Takımı</th>
                    <th><br/></th>
                    <th scope="col">Yetkinliği</th>
                    <th><br/></th><th><br/></th><th><br/></th><th><br/></th><th><br/></th><th><br/></th>
                    <th scope="col">Aksiyon</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${users}">
                    <c:url var="updateLink" value="/user/showFormForUpdate">
                        <c:param name="userId" value="${user.id}" />
                    </c:url>
                    <c:url var="deleteLink" value="/user/delete">
                        <c:param name="userId" value="${user.id}" />
                    </c:url>
                    <c:url var="detailLink" value="/user/detail">
                        <c:param name="userId" value="${user.id}" />
                    </c:url>
                    <tr>
                        <th scope="row">${user.fullName}</th>
                        <td><br/></td>
                        <td>${user.teamMember}</td>
                        <td><br/></td>
                        <td>${user.userRole}</td>
                        <td><br/></td><td><br/></td><td><br/></td><td><br/></td><td><br/></td><td><br/></td>
                        <td>
                            <sec:authorize access="hasRole('ADMIN')">
                                <a href="${updateLink}" class="btn btn-outline-success" role="button" aria-pressed="true">Güncelle</a>
                            </sec:authorize>
                            <a href="${detailLink}" class="btn btn-outline-info" role="button" aria-pressed="true">Detay</a>
                            <sec:authorize access="hasRole('ADMIN')">
                                <a href="${deleteLink}" onclick="if (!(confirm('Kullanıcıyı silmek istediğinizden emin misiniz?'))) return false" class="btn btn-outline-danger" role="button" aria-pressed="true">Sil</a>
                            </sec:authorize>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <form:form method="get" action="/hello">
                Kullanıcı Adı Araması: <input class="form-control" id="User_Name">
            </form:form>
        </div>
    </div>
</div>
<!-- User List Scroll -->
<!-- User List Scroll -->

<!-- Product List Scroll -->
<!-- Product List Scroll -->
<div data-spy="scroll" data-target="#navbar-example2" data-offset="0">
    <div class="container" style="padding-top: 500px; padding-bottom: 500px;" id="listProductsContainer">
        <div class="contentContainer">
            <div class="row">
                <div class="col-sm-12" id="container" style="border-left: 1px">
                    <p>
                        <sec:authorize access="hasRole('ADMIN')">
                            <a href="${pageContext.request.contextPath}/addProduct" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Ürün Ekle</a>
                        </sec:authorize>
                    </p>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th scope="col">Ürün İsmi</th>
                            <th scope="col">Sahibi</th>
                            <th scope="col">Modeli</th>
                            <th scope="col">Bellek (GB)</th>
                            <th scope="col">Alım Tarihi</th>
                            <th scope="col">Aksiyon</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="product" items="${products}">
                            <c:url var="updateLink" value="/showFormForUpdate">
                                <c:param name="productId" value="${product.id}" />
                            </c:url>
                            <c:url var="detailLink" value="/detail">
                                <c:param name="productId" value="${product.id}" />
                            </c:url>
                            <c:url var="deleteLink" value="/delete">
                                <c:param name="productId" value="${product.id}" />
                            </c:url>
                            <tr>
                                <td>${product.productName}</td>
                                <th>${product.owner}</th>
                                <td>${product.model}</td>
                                <td>${product.memoryGb}</td>
                                <td>${product.purchaseDate}</td>
                                <td>
                                    <sec:authorize access="hasRole('ADMIN')">
                                        <a href="${updateLink}" class="btn btn-outline-success" role="button" aria-pressed="true">Güncelle</a>
                                    </sec:authorize>
                                    <a href="${detailLink}" class="btn btn-outline-info" role="button" aria-pressed="true">Detay</a>
                                    <sec:authorize access="hasRole('ADMIN')">
                                        <a href="${deleteLink}" onclick="if (!(confirm('Bu ürünü silmek istediğinizden emin misiniz ?'))) return false" class="btn btn-outline-danger" role="button" aria-pressed="true">Sil</a>
                                    </sec:authorize>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Product List Scroll -->
<!-- Product List Scroll -->
</body>
<script src="../resources/static/bootstrap/js/bootstrap.bundle.min.js"></script>

</html>
