<%-- 
    Document   : Registration
    Created on : May 25, 2023, 9:52:54 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body data-new-gr-c-s-check-loaded="14.1030.0" data-gr-ext-installed="">
        <section class="vh-100">
            <div class="container py-5 h-100">
                <div class="row d-flex align-items-center justify-content-center h-100">
                    <div class="col-md-8 col-lg-7 col-xl-6">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg" class="img-fluid" alt="Phone image" style="
                             width: 50%;
                             ">
                    </div>
                    <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                        <form action="DispatcherController">
                            <c:set var="errors" value="${requestScope.ERROR}"/>
                            <!-- Email input -->
                            <div class="form-outline mb-4">
                                <input type="text" size="20" name="txtUsername" value="${param.txtUsername}" id="form1Example13" class="form-control form-control-lg" />
                                <label class="form-label" for="form1Example13">Username (e.g 6 - 20 chars)</label>
                                <div>
                                    <c:if test="${not empty errors.usernameLengthError}">
                                        <font color="red">
                                        ${errors.usernameLengthError}
                                        </font><br/>
                                    </c:if>
                                    <c:if test="${not empty errors.usernameIsExisted}">
                                        <font color="red">
                                        ${errors.usernameIsExisted}
                                        </font><br/>
                                    </c:if> 
                                </div>
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-4">
                                <input type="password" size="30" id="form1Example23"  class="form-control form-control-lg" name="txtPassword">
                                <label class="form-label" for="form1Example23">Password (e.g 6 - 30 chars)</label>
                                <div>
                                    <c:if test="${not empty errors.passwordLengthError}">
                                        <font color="red">
                                        ${errors.passwordLengthError}
                                        </font><br/>
                                    </c:if>
                                </div>

                            </div>

                            <div class="form-outline mb-4">
                                <input type="password" size="30" id="form1Example23" class="form-control form-control-lg" name="txtConfirmPassword">
                                <label class="form-label" for="form1Example23">Confirm Password </label>
                                <div>
                                    <c:if test="${not empty errors.confirmNotMatched}">
                                        <font color="red">
                                        ${errors.confirmNotMatched}
                                        </font><br/>
                                    </c:if>
                                </div>

                            </div>



                            <!-- Submit button -->

                            <button type="submit" class="btn btn-primary btn-lg btn-block" value="Registration" name="btAction"> Registration </button>


                        </form>
                    </div>
                </div>
            </div>
        </section>


    </body>
</html>
