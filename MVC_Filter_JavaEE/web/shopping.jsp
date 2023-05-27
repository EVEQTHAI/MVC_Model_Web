<%-- 
    Document   : shopping
    Created on : Mar 8, 2023, 6:35:06 PM
    Author     : PC
--%>

<%@page import="thainq.registration.RegistrationDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="books" value="${requestScope.BOOK}"/>
        <c:if test="${not empty books}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>ID Book</th>
                        <th>Name Book</th>
                        <th>Price Book</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="book" items="${books}" varStatus="counter">
                    <form action="addToCartAction">
                        <tr>
                            <td>${counter.count}
                                .</td>
                            <td>
                                ${book.getSku()}
                                <input type="hidden" name="txtSku" value="${book.getSku()}" />
                            </td>
                            <td>
                                ${book.getName()}
                                <input type="hidden" name="txtName" value="${book.getName()}" />
                            </td>
                            <td>
                                ${book.getPrice()}
                                <input type="hidden" name="txtPrice" value="${book.getPrice()}" />
                            </td>
                            <td>
                                <input type="number" name="txtQuantity" value="1" min="1"/>
                            </td>
                            <td>
                                <input type="submit" value="Add book to cart" name="btAction" />
                                <input type="hidden" name="id" value="${book.getSku()}" />
                            </td>
                        </tr>
                    </form> 
                </c:forEach>
                <a href="viewCartPage">View your Cart</a>
            </tbody>
        </table>
    </c:if>
    <c:if test="${ empty books}">
        <h2>
            Book Store is run out of money!!!
        </h2>
    </c:if>

    <%--
            <%

            List<RegistrationDTOcart> result = (List<RegistrationDTOcart>) request.getAttribute("NAME");
            if (result != null) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>ID Book</th>
                    <th>Name Book</th>
                    <th>Price Book</th>
                    

                </tr>
            </thead>

            <tbody>
                <%
                    int count = 0;
                    for (RegistrationDTOcart dto : result) {

                %>
            <form action="DispatchServlet">

                <tr>
                    <td><%= ++count%></td>
                    <td>
                        <%= dto.getSku() %>
                        <input type="hidden" name="txtSku" value="<%= dto.getSku() %>" />
                    </td>
                
                    <td>
                        <%= dto.getName()%>
                        <input type="hidden" name="txtName" value="<%= dto.getName()%>" />
                    </td>
                    <td>
                        <%= dto.getPrice() %>
                        <input type="hidden" name="txtPrice" value="<%= dto.getPrice() %>" />
                    </td>
                    <td>
                        <input type="submit" value="Add book to cart" name="btAction" />
                    </td>
                </tr> 
            </form>

            <%
                }//end traverse DTO
            %>
            <form action="DispatchServlet"> 
                <input type="submit" value="View your cart" name="btAction" /> 
            </form>


        </tbody>
    </table>


    <%
        }//end result ton tai 
    %>
    --%>
</body>
</html>
