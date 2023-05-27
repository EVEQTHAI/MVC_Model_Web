<%-- 
    Document   : Cart
    Created on : May 14, 2023, 5:32:14 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <link type="text/css" rel="stylesheet" href="css/cart.css">
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
    <body data-new-gr-c-s-check-loaded="14.1029.0" data-gr-ext-installed="">
        <!-- HEADER -->
        <c:set var="user" value="${sessionScope.USER}"/>
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> email@email.com</a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <li><a href="#"><i class="fa fa-dollar"></i> USD </a></li>
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

                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Wishlist -->

                                <!-- /Wishlist -->

                                <!-- Cart -->

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
                    <div class="col-md-12 your_cart">
                        <h3 class="breadcrumb-header">Your Cart</h3>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <div class="container-fluid cart-session ">
                <div class="row">
                    <div class="col-lg-10 offset-lg-1">
                        <div class="cart_container">

                            <div class="cart_items">


                                <c:set var="cart" value="${sessionScope.CART.cart}"/>
                                <ul class="cart_list">
                                    <c:if test="${not empty cart}">
                                        <c:forEach var="entry" items="${cart.entrySet()}">
                                            <c:set var="value" value="${entry.value}"/>
                                            <form action="DispatcherController">
                                                <li class="cart_item clearfix  ">
                                                    <div class="cart_item_image"><img src="${value.getProduct().getImage()}" alt=""></div>

                                                    <div class=" cart_info_col  ">

                                                        <div class="cart_item_name  ">
                                                            Name : <div class="cart_item_title"> ${value.getProduct().getName()}</div>                                                        
                                                        </div>

                                                        <div class="cart_item_quantity  ">
                                                            Quantity: <div class="cart_item_title"> ${value.getQuanity()}</div>
                                                            <button class="" name="btAction" value="remove">
                                                                <i class="fa fa-minus"></i>
                                                            </button>                                                       
                                                            <input type="hidden" name="selectedItems" value="${entry.key}" />
                                                        </div>

                                                        <div class="cart_item_price  ">
                                                            Price: <div class="cart_item_title"> ${value.getProduct().getPrice()}</div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </form>

                                        </c:forEach>
                                    </c:if>
                                </ul>

                            </div>

                            <div class="order_total">
                                <c:set var="total" value="${sessionScope.TOTAL}"/>
                                <c:if test="${empty cart}">
                                    <div class="order_total_content text-md-right">
                                        <div class="order_total_title">Order Total:</div>
                                        <div class="order_total_amount">0 $</div>
                                    </div>
                                </c:if>
                                <c:if test="${not empty cart}">
                                    <div class="order_total_content text-md-right">
                                        <div class="order_total_title">Order Total:</div>
                                        <div class="order_total_amount">${total} $</div>
                                    </div>
                                </c:if>

                            </div>


                            <form action="DispatcherController">
                                <div class="cart_buttons">
                                    <input type="submit" class="button cart_button_clear" value="Continue Shopping" name="btAction" />
                                    <a href="<c:url value="Checkout.jsp"/>" class="button cart_button_checkout">Check Out</a>
                                </div>
                            </form>


                        </div>
                    </div>
                </div>
            </div>
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

