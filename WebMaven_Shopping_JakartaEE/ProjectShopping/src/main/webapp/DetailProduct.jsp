<%-- 
    Document   : DetailProduct
    Created on : May 24, 2023, 10:24:41 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Item - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->


        <link href="css/stylesDetail.css" rel="stylesheet" />
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>


    </head>
    <body data-new-gr-c-s-check-loaded="14.1030.0" data-gr-ext-installed="">
        <c:set var="user" value="${sessionScope.USER}"/>
        <div id="top-header">
            <div class="container">
                <ul class="header-links pull-left">
                    <li><a href="#"><i class="fa fa-phone"></i> +84 37999 0249</a></li>
                    <li><a href="#"><i class="fa fa-envelope-o"></i> thainguyendcs@email.com</a></li>
                    <li><a href="#"><i class="fa fa-map-marker"></i> 1412 </a></li>
                </ul>
                <ul class="header-links pull-right">
                    <li><a href="#"><i class="fa fa-dollar"></i> Dolar  </a></li>
                    <li>
                        <c:if test="${not empty user}">
                            <a href="#"><i class="fa fa-user-o"></i>${user.username}</a>
                            </c:if>
                            <c:if test="${empty user}">
                            <a href="Login.html"><i class="fa fa-user-o"></i>Login</a>
                        </c:if>
                    </li>
                </ul>
            </div>
        </div>
        <div id="header">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- LOGO -->
                    <div class="col-md-3">
                        <div class="header-logo">
                            <a href="DispatcherController" class="logo">
                                <img src="./img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <!-- /LOGO -->

                    <!-- SEARCH BAR -->
                    <div class="col-md-6">
                        <div class="header-search">

                        </div>
                    </div>
                    <!-- /SEARCH BAR -->

                    <!-- ACCOUNT -->
                    <div class="col-md-3 clearfix">
                        <div class="header-ctn">
                            <!-- Cart -->
                            <c:set var="user" value="${sessionScope.USER}"/>
                            <c:set var="cart" value="${sessionScope.CART.cart}"/>
                            <c:set var="qty" value="${sessionScope.QTY}"/>
                            <div class="dropdown">
                                <c:if test="${empty user}">
                                    <a href="Login.html">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>

                                    </a>
                                </c:if>
                                <c:if test="${not empty user}">
                                    <a class="dropdown-toggle" href="<c:url value="Cart.jsp"/>" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>
                                        <c:if test="${not empty cart}">
                                            <div class="qty">${qty}</div> 
                                        </c:if> 
                                    </a>
                                </c:if>
                            </div>
                            <!-- /Cart -->

                            <!-- Menu Toogle -->
                            <div class="menu-toggle">
                                <a href="#">
                                    <i class="fa fa-bars"></i>
                                    <span>Menu</span>
                                </a>
                            </div>
                            <!-- /Menu Toogle -->
                        </div>
                    </div>
                    <!-- /ACCOUNT -->
                </div>
                <!-- row -->
            </div>
            <!-- container -->
        </div>
        <!-- Navigation-->
        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="breadcrumb-header">Checkout</h3>
                        <ul class="breadcrumb-tree">
                            <li> <a href="<c:url value="dispatchercontroller"/>" >Home</a> </li>
                            <li class="active">Checkout</li>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->
        <!-- Product section-->
        <form action="DispatcherController">
            <c:set value="${sessionScope.DETAIL}" var="detail"/>
            <section class="py-5">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="row gx-4 gx-lg-5 align-items-center">
                        <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${detail.getImage()}" alt="..."></div>
                        <div class="col-md-6">
                            <div class="small mb-1">SKU: ${detail.code}</div>
                            <h1 class="display-5 fw-bolder">${detail.name}</h1>
                            <div class="fs-5 mb-5">
                                <span class="text-decoration-line-through">$45.00</span>
                                <span>${detail.price}</span>
                            </div>
                            <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?</p>
                            <div class="d-flex">

                                <c:if test="${empty user}">
                                    <div class="add-to-cart">
                                        <a href="Login.html"<input type="submit" class="add-to-cart-btn fa fa-shopping-cart" value="Add to Cart"/>
                                        ADD
                                        </a>
                                    </div>
                                </c:if>    
                                <c:if test="${not empty user}">
                                    <div class="add-to-cart">
                                        <input type="submit" class="add-to-cart-btn fa fa-shopping-cart" value="BUY" name="btAction"/>
                                        <input type="hidden" name="txtCodeDetail" value="${detail.getCode()}" />
                                    </div>
                                </c:if> 
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </form>
        <!-- Related items section-->

        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright © Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>




    </body>
</html>
