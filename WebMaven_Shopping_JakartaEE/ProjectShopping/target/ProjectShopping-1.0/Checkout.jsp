<%-- 
    Document   : Checkout
    Created on : May 15, 2023, 3:23:34 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Electro - HTML Ecommerce Template</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css">
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css">

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css">

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body data-new-gr-c-s-check-loaded="14.1030.0" data-gr-ext-installed="">
        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <c:set var="user" value="${sessionScope.USER}"/>
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i> 0379990249 </a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> email@email.com</a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i> EVE store</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <li><a href="#"><i class="fa fa-dollar"></i> USD $ </a></li>
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
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="<c:url value="DispatcherController"/>" class="logo">
                                    <img src="./img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">

                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->

            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->

        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="breadcrumb-header">Checkout</h3>
                        <ul class="breadcrumb-tree">
                            <li><a href="<c:url value="DispatcherController"/>">Home</a></li>
                            <li class="active">Checkout</li>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <form action="DispatcherController">
                    <div class="row">

                        <div class="col-md-7">
                            <!-- Billing Details -->
                            <div class="billing-details">
                                <div class="section-title">
                                    <h3 class="title">Billing address</h3>
                                </div>
                                <div class="form-group">
                                    <input class="input" required="required"   type="text" name="txtName" placeholder="Name">
                                </div>

                                <div class="form-group">
                                    <input class="input" required="required" type="email" name="txtEmail" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <input class="input" required="required" type="text" name="txtAddress" placeholder="Address">
                                </div>

                                <div class="form-group">
                                    <input class="input" required="required" type="tel" name="txtTelephone" placeholder="Telephone">
                                </div>
                            </div>
                            <!-- /Billing Details -->

                            <!-- Shiping Details -->
                            <!-- /Shiping Details -->

                            <!-- Order notes -->

                            <!-- /Order notes -->
                        </div>

                        <!-- Order Details -->
                        <c:set var="cart" value="${sessionScope.CART.cart}"/>
                        <div class="col-md-5 order-details">
                            <div class="section-title text-center">
                                <h3 class="title">Your Order</h3>
                            </div>
                            <div class="order-summary">
                                <div class="order-col">
                                    <div><strong>PRODUCT</strong></div>
                                    <div><strong>TOTAL</strong></div>
                                </div>
                                <div class="order-products">


                                    

                                    <c:if test="${not empty cart}">
                                        <c:forEach var="entry" items="${cart.entrySet()}">
                                            <c:set var="value" value="${entry.value}"/>

                                            <div class="order-col">
                                                <div>${value.getProduct().getName()}</div>
                                                <div>${value.getProduct().getPrice()}</div>
                                            </div>

                                        </c:forEach>
                                    </c:if>



                                </div>
                                <div class="order-col">
                                    <div>Shiping</div>
                                    <div><strong>FREE</strong></div>
                                </div>
                                <div class="order-col">
                                <c:set var="total" value="${sessionScope.TOTAL}"/>
                                <c:if test="${empty cart}">
                                    <div><strong>TOTAL</strong></div>
                                    <div><strong class="order-total"> 0 $</strong></div>
                                </c:if>
                                <c:if test="${not empty cart}">
                                    <div><strong>TOTAL</strong></div>
                                    <div><strong class="order-total">${total} $</strong></div>
                                </c:if>
                                    

                                </div>
                            </div>
                            <input type="submit" value="Place order" class="primary-btn order-submit" name="btAction" />


                        </div>
                        <!-- /Order Details -->
                    </div>
                </form>

                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->

        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer -->

            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="footer-payments">
                                <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                                <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                            </ul>
                            <span class="copyright">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright ©<script>document.write(new Date().getFullYear());</script>20232023 All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </span>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /bottom footer -->
        </footer>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>





    </body>
</html>
