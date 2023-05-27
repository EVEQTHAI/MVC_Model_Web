    <%-- 
    Document   : AddServlet
    Created on : Mar 1, 2023, 1:49:30 PM
    Author     : PC
--%>

<%@page import="thainq.cart.Cart"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Book Store!</h1>
        <c:set var="cart" value="${sessionScope.CART.items}"/>
        <c:if test="${not empty cart}">


            <form action="removeItemFromCart">

                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Name</th>
                            <th>Quantity</th>
                            <th>Action</th> 
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach var="items" items="${cart.entrySet()}" varStatus="counter">
                            <c:set var="Key" value="${items.value}"/>
                            
                            <tr>
                                <td>${counter.count}
                                    .</td>
                                <td>
                                    ${Key.getName()}
                                    <input type="hidden" name="txtProName" value="${Key.getName()}" />
                                </td>
                                <td>
                                    ${Key.getQuantity()}
                                </td>
                                <td>
                                    <input type="checkbox" name="chkItem" value="${items.key}" />
                                    
                                </td>
                            </tr>   
                        </c:forEach>
                        <tr>
                            <td colspan="3">
                                <a href="linkToCartAction">Link to cart again :)</a>
                            </td>
                            <td>
                                <input type="submit" value="Remove Select Item" name="btAction" />
                            </td>
                        </tr>

                    </tbody>
                </table> <br>
<!--                <input type="submit" value="CheckOut" name="btAction" />-->
                <a href="checkOutAction">check out</a>

            </form>

        </c:if>
        <c:if test="${empty cart}">
            <h2>No Item into Cart!!!</h2>
            <a href="linkToCartAction">lick here to back </a>
        </c:if>

            
 <%--       <c:set var="pCART" value="${sessionScope.pCART}"/>
        <c:if test="${not empty pCart}">
            <table border="1">
                <thead>
                    <tr>
                        <th>ID Product</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="p" items="${pCART}">
                        <tr>
                            <td>
                                ${p.getSku()}
                            </td>
                            <td>
                                ${p.getName()}
                            </td>
                            <td>
                                ${items.value}
                            </td>
                            <td>
                                ${p.getPrice()}
                            </td>
                            <td>
                                ${p.getPrice()*items.value}
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>

        </c:if>

--%>
        <%--        
        <%

            //1.Customer gose to cart place ==> session Scope
            //session Scope da co o jsp page
            //check ton tai 
            if (session != null) {
                //2.Customer take cart
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null) {
                    //3.Customer gets all items
                    //ngan chua do kieu Map
                    Map<String, Integer> items = cart.getItems();
                    if (items != null) {
                        //4.Customer review item
        %>

        <form action="DispatchServlet">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Action</th>


                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 0;
                        for (String key : items.keySet()) {
                    %>
                    <tr>
                        <td>
                            <%= ++count%>
                        </td>
                        <td>
                            <%= key%>
                            <input type="hidden" name="txtNameBook" value="<%= key%>" />
                        </td>
                        <td>
                            <%= items.get(key)%>
                            <input type="hidden" name="txtQuantity" value="<%= items.get(key)%>" />
                        </td>
                        <td>

                            <input type="checkbox" name="chkItem" 
                                   value="<%= key%>" />
                        </td>
                    </tr>
                    <%
                        }//end traverse Map basd on key
                    %>
                    <tr>

                        <td colspan="3">
                            <input type="submit" value="Link to cart" name="btAction" />
                        </td>
                        <td>
                            <input type="submit" value="Remove Select Item" name="btAction" />
                        </td>
                    </tr>

                <input type="submit" value="CheckOut" name="btAction" />

                </tbody>
            </table>
        </form>

        <%
                        return;
                    }//item have existed
                }//cart has existed
            }//sesion has existed


        %>
        <h2>No Item into Cart!!!</h2>
        --%>
    </body>
</html>
