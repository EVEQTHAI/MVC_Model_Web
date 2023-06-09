<%-- 
    Document   : createNewAcc
    Created on : Mar 15, 2023, 12:46:36 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Create new account</h1>

        <form action="createNewAccAction" method="POST">
            <c:set var="errors" value="${requestScope.CREATE_ERROR}"/>
            Username* <input type="text" name="txtUsername" 
                             value="${param.txtUsername}" size="20"/>(e.g 6-20 chars)<br>
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
            Password* <input type="password" name="txtPassword" value="" size="30"/>(e.g 6-30 chars)<br>
            <c:if test="${not empty errors.passwordLengthError}">
                <font color="red">
                ${errors.passwordLengthError}
                </font><br/>
            </c:if>
            Confirm *   <input type="password" name="txtConfirm" value="" size="30"/><br>
            <c:if test="${not empty errors.confirmNotMatched}">
                <font color="red">
                ${errors.confirmNotMatched}
                </font><br/>
            </c:if>
            Full name <input type="text" name="txtFullname" 
                             value="${param.txtFullname}" size="50"/>(e.g 6-30 chars)<br>
            <c:if test="${not empty errors.fullnameLengthError}">
                <font color="red">
                ${errors.fullnameLengthError}
                </font><br/>
            </c:if>
            <input type="submit" value="Create new Account" name="btAction" />
            <input type="reset" value="Reset" />

        </form>

    </body>
</html>
