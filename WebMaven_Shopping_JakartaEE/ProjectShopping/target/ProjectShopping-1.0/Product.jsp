<%-- 
    Document   : Product
    Created on : May 13, 2023, 12:27:42 PM
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

        <!--         Google font 
                <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">-->

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
    <body data-new-gr-c-s-check-loaded="14.1029.0" data-gr-ext-installed="">
        <c:set var="user" value="${sessionScope.USER}"/>
        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
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
                            <div class="header-search">
                                <form action="">

                                    <input class="input" placeholder="Search here">
                                    <button class="search-btn">Search</button>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Wishlist -->

                                <!-- /Wishlist -->

                                <!-- Cart -->

                                <div class="dropdown">

                                    <c:set var="cart" value="${sessionScope.CART.cart}"/>
                                    <c:set var="qty" value="${sessionScope.QTY}"/>
                                    <c:if test="${empty user}">
                                        <a href="Login.html">
                                            <i class="fa fa-shopping-cart"></i>
                                            <span>Your Cart</span>

                                        </a>
                                    </c:if>
                                    <c:if test="${not empty user}">
                                        <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                            <i class="fa fa-shopping-cart"></i>
                                            <span>Your Cart</span>

                                            <c:if test="${not empty cart}">
                                                <div class="qty">${qty}</div> 
                                            </c:if>  
                                        </a>

                                        <div class="cart-dropdown">

                                            <div class="cart-list">




                                                <c:if test="${not empty cart}">
                                                    <c:forEach var="entry" items="${cart.entrySet()}">
                                                        <c:set var="value" value="${entry.value}"/>

                                                        <div class="product-widget">
                                                            <div class="product-img">
                                                                <img src="${value.getProduct().getImage()}" alt="">
                                                            </div>
                                                            <div class="product-body">
                                                                <h3 class="product-name"><a href="Cart.jsp">${value.getProduct().getName()}</a></h3>
                                                                <h4 class="product-price"><span class="qty">${value.getQuanity()}</span>${value.getProduct().getPrice()}</h4>
                                                            </div>
                                                            <button class="delete"><i class="fa fa-close"></i></button>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>




                                            </div>
                                            <div class="cart-summary">
                                                <small>${qty} Item(s) selected</small>
                                                <c:set var="total" value="${sessionScope.TOTAL}"/>

                                                <h5>SUBTOTAL: ${total}</h5>
                                            </div>

                                            <div class="cart-btns">
                                                <a href="Cart.jsp">View Cart</a>
                                                <a href="Checkout.jsp">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                            </div>


                                        </div>
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
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li class="active"><a href="ProductController">Home</a></li>
                        <li><a href="#">Hot Deals</a></li>
                        <li><a href="#">Categories</a></li>
                        <li><a href="#">Laptops</a></li>
                        <li><a href="#">Smartphones</a></li>
                        <li><a href="#">Cameras</a></li>
                        <li><a href="#">Accessories</a></li>
                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->

        <!-- BREADCRUMB -->

        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Categories</h3>
                            <div class="checkbox-filter">

                                <div class="input-checkbox">
                                    <input type="checkbox" id="category-1">
                                    <label for="category-1">
                                        <span></span>
                                        Laptops
                                        <small>(120)</small>
                                    </label>
                                </div>

                                <div class="input-checkbox">
                                    <input type="checkbox" id="category-2">
                                    <label for="category-2">
                                        <span></span>
                                        Smartphones
                                        <small>(740)</small>
                                    </label>
                                </div>

                                <div class="input-checkbox">
                                    <input type="checkbox" id="category-3">
                                    <label for="category-3">
                                        <span></span>
                                        Cameras
                                        <small>(1450)</small>
                                    </label>
                                </div>

                                <div class="input-checkbox">
                                    <input type="checkbox" id="category-4">
                                    <label for="category-4">
                                        <span></span>
                                        Accessories
                                        <small>(578)</small>
                                    </label>
                                </div>

                                <div class="input-checkbox">
                                    <input type="checkbox" id="category-5">
                                    <label for="category-5">
                                        <span></span>
                                        Laptops
                                        <small>(120)</small>
                                    </label>
                                </div>

                                <div class="input-checkbox">
                                    <input type="checkbox" id="category-6">
                                    <label for="category-6">
                                        <span></span>
                                        Smartphones
                                        <small>(740)</small>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Price</h3>
                            <div class="price-filter">
                                <div id="price-slider" class="noUi-target noUi-ltr noUi-horizontal"><div class="noUi-base"><div class="noUi-origin" style="left: 0%;"><div class="noUi-handle noUi-handle-lower" data-handle="0" tabindex="0" role="slider" aria-orientation="horizontal" aria-valuemin="0.0" aria-valuemax="100.0" aria-valuenow="0.0" aria-valuetext="1.00" style="z-index: 5;"></div></div><div class="noUi-connect" style="left: 0%; right: 0%;"></div><div class="noUi-origin" style="left: 100%;"><div class="noUi-handle noUi-handle-upper" data-handle="1" tabindex="0" role="slider" aria-orientation="horizontal" aria-valuemin="0.0" aria-valuemax="100.0" aria-valuenow="100.0" aria-valuetext="999.00" style="z-index: 4;"></div></div></div><div class="noUi-base"><div class="noUi-origin" style="left: 0%;"><div class="noUi-handle noUi-handle-lower" data-handle="0" tabindex="0" role="slider" aria-orientation="horizontal" aria-valuemin="0.0" aria-valuemax="100.0" aria-valuenow="0.0" aria-valuetext="1.00" style="z-index: 5;"></div></div><div class="noUi-connect" style="left: 0%; right: 0%;"></div><div class="noUi-origin" style="left: 100%;"><div class="noUi-handle noUi-handle-upper" data-handle="1" tabindex="0" role="slider" aria-orientation="horizontal" aria-valuemin="0.0" aria-valuemax="100.0" aria-valuenow="100.0" aria-valuetext="999.00" style="z-index: 4;"></div></div></div><div class="noUi-base"><div class="noUi-origin" style="left: 0%;"><div class="noUi-handle noUi-handle-lower" data-handle="0" tabindex="0" role="slider" aria-orientation="horizontal" aria-valuemin="0.0" aria-valuemax="100.0" aria-valuenow="0.0" aria-valuetext="1.00" style="z-index: 5;"></div></div><div class="noUi-connect" style="left: 0%; right: 0%;"></div><div class="noUi-origin" style="left: 100%;"><div class="noUi-handle noUi-handle-upper" data-handle="1" tabindex="0" role="slider" aria-orientation="horizontal" aria-valuemin="0.0" aria-valuemax="100.0" aria-valuenow="100.0" aria-valuetext="999.00" style="z-index: 4;"></div></div></div></div>
                                <div class="input-number price-min">
                                    <input id="price-min" type="number">
                                    <span class="qty-up">+</span>
                                    <span class="qty-down">-</span>
                                </div>
                                <span>-</span>
                                <div class="input-number price-max">
                                    <input id="price-max" type="number">
                                    <span class="qty-up">+</span>
                                    <span class="qty-down">-</span>
                                </div>
                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Brand</h3>
                            <div class="checkbox-filter">
                                <div class="input-checkbox">
                                    <input type="checkbox" id="brand-1">
                                    <label for="brand-1">
                                        <span></span>
                                        SAMSUNG
                                        <small>(578)</small>
                                    </label>
                                </div>
                                <div class="input-checkbox">
                                    <input type="checkbox" id="brand-2">
                                    <label for="brand-2">
                                        <span></span>
                                        LG
                                        <small>(125)</small>
                                    </label>
                                </div>
                                <div class="input-checkbox">
                                    <input type="checkbox" id="brand-3">
                                    <label for="brand-3">
                                        <span></span>
                                        SONY
                                        <small>(755)</small>
                                    </label>
                                </div>
                                <div class="input-checkbox">
                                    <input type="checkbox" id="brand-4">
                                    <label for="brand-4">
                                        <span></span>
                                        SAMSUNG
                                        <small>(578)</small>
                                    </label>
                                </div>
                                <div class="input-checkbox">
                                    <input type="checkbox" id="brand-5">
                                    <label for="brand-5">
                                        <span></span>
                                        LG
                                        <small>(125)</small>
                                    </label>
                                </div>
                                <div class="input-checkbox">
                                    <input type="checkbox" id="brand-6">
                                    <label for="brand-6">
                                        <span></span>
                                        SONY
                                        <small>(755)</small>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->

                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">
                        <!-- store top filter -->
                        <div class="store-filter clearfix">


                        </div>
                        <!-- /store top filter -->

                        <!-- store products -->
                        <div class="row">

                            <!-- product -->
                            <c:set var="products" value="${requestScope.PRODUCT}"/>

                            <c:if test="${not empty products}">
                                <c:forEach var="product" items="${products}">
                                    <div class="col-md-4 col-xs-6">


                                        <form action="DispatcherController">
                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="${product.getImage()}" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Category</p>
                                                    <h3 class="product-name"><a href="#">${product.getName()}</a></h3>
                                                    <h4 class="product-price">${product.getPrice()} </h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>

                                                        <button name="btAction" value="viewDetail" class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                        <input type="hidden" name="txtCode" value="${product.getCode()}" />

                                                    </div>
                                                </div>

                                                <c:if test="${empty user}">
                                                    <div class="add-to-cart">
                                                        <a href="Login.html"<input type="submit" class="add-to-cart-btn fa fa-shopping-cart" value="Add to Cart"/>
                                                        ADD
                                                        </a>
                                                    </div>
                                                </c:if>    
                                                <c:if test="${not empty user}">
                                                    <div class="add-to-cart">
                                                        <input type="submit" class="add-to-cart-btn fa fa-shopping-cart" value="Add to Cart" name="btAction"/>
                                                        <input type="hidden" name="txtCode" value="${product.getCode()}" />
                                                    </div>
                                                </c:if> 
                                            </div>
                                        </form>



                                    </div>
                                </c:forEach>
                            </c:if>

                            <!-- /product -->
                        </div>
                        <!-- /store products -->

                        <!-- store bottom filter -->

                        <!-- /store bottom filter -->
                    </div>
                    <!-- /STORE -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">

                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
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
