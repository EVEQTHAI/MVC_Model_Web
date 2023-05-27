<%-- 
    Document   : checkOut
    Created on : Mar 14, 2023, 2:50:34 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <c:set var="cart" value="${sessionScope.CART.items}"/>
        <c:if test="${not empty cart}">
            <form action="removeItemFromCart">


                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Name</th>
                            <th>Quantity</th>
                            <th>Price</th> 
                            <th>Total</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="items" items="${cart.entrySet()}" varStatus="counter">
                            <c:set var="Key" value="${items.value}"/>
                            <c:set var="total" value="${Key.getQuantity()*Key.getPrice()}"/>
                            <tr>
                                <td>${counter.count}
                                    .</td>
                                <td>
                                    ${Key.getName()}

                                </td>
                                <td>
                                    ${Key.getQuantity()}
                                </td>
                                <td>
                                    ${Key.getPrice()}
                                </td>
                                <td>
                                    ${total}
                                </td>
                            </tr>   
                        </c:forEach>
                    <br>
                    <tr>
                        <td>
                            <c:set var="date" value="${requestScope.DATE}"/>
                            ${date}
                        </td>
                        <td colspan="3">
                            Total
                        </td>
                        <td>
                            <c:set var="total" value="${requestScope.TOTAL}"/>
                            ${total}    
                        </td>

                    </tr>
                    </tbody>
                </table> <br>


            </form>

        </c:if>
        <c:if test="${empty cart}">
            <div>
                mua do chua ma tinh tien
            </div>
        </c:if>


    </body>
</html>
