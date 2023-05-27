<%-- 
    Document   : search
    Created on : Feb 18, 2023, 1:15:27 PM
    Author     : PC
--%>

<%--<%@page import="thainq.registration.RegistrationDTO"%>
<%@page import="java.util.List"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body>
        <h1>Search Page</h1>

        <font color="red">
        welcome, ${sessionScope.USER.fullname}
        </font>

        <form action="searchAction">
            Search Value <input type="text" name="SearchValue" value="${param.SearchValue}" /><br>
            <input type="submit" value="Search" name="btAction" /><br>
  
        </form>
        <form action="logoutAction">
            <input type="submit" value="Logout" name="btAction" />
        </form>
            



        <c:set var="searchValue" value="${param.SearchValue}"/>
        <c:if test="${not empty searchValue}">
            <c:set var="result" value="${requestScope.SEARCH_RESULT}"/>
            <c:if test="${not empty result}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Full name</th>
                            <th>Role</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${result}" varStatus="counter">
                        <form action="updateAction" method="POST">                        
                            <tr>
                                <td>
                                    ${counter.count}
                                    .</td>
                                <td>
                                    ${dto.username}
                                    <input type="hidden" name="txtUsername" value="${dto.username}" />
                                </td>
                                <td>
                                    <input type="text" name="txtPassword" value="${dto.password}" />                                    
                                </td>
                                <td>
                                    ${dto.fullname}
                                </td>

                                <td>
                                    <input type="checkbox" name="chkAdmin" value="ON" 
                                           <c:if test="${dto.role}">
                                               checked="checked"
                                           </c:if>
                                           />
                                </td>
                                <td>
                                    <c:url var="deleteLink" value="deleteAction">
                                        <c:param name="btAction" value="Delete"/>
                                        <c:param name="pk" value="${dto.username}"/>
                                        <c:param name="lastSearchValue" value="${searchValue}"/>
                                    </c:url>
                                    <a href="${deleteLink}">Delete</a>

                                    <!-- parameter is variable => need to $(no space){} to declare -->

                                </td>
                                <td>
                                    <input type="submit" name="btAction" value="Update" />
                                    <input type="hidden" name="lastSearchValue" value="${searchValue}" />
                                </td>
                            </tr>
                        </form>   
                    </c:forEach>
                </tbody>
            </table>

        </c:if>
        <c:if test="${empty result}">
            <h2> null </h2>
        </c:if>
    </c:if>
    <%--
            <%  
                String url = "login.html";
                String searchValueInput = request.getParameter("SearchValue");
                if(searchValueInput==null){
                    searchValueInput="";
                }
                //khi cookie that su ton tai
                //request.getSession();
                Cookie[] cookies = request.getCookies();
                String usernameAcceding = "";
                if (cookies != null) {
                    Cookie lastCookie = cookies[cookies.length - 1];
                    if (!lastCookie.getName().equals("JSESSIONID")) {
                        usernameAcceding = lastCookie.getName();
                    }
                    else{
                       response.sendRedirect(url);
                    }

        %>

        <font color ="red">
        Welcome , <%= usernameAcceding%>
        </font>

        <%
            }
        %>
        <h1>Search Page</h1>
        <form action="DispatchServlet">
            Search Value <input type="text" name="SearchValue" 
                                value="<%= searchValueInput %>" /><br>
            <input type="submit" value="Search" name="btAction" /><br>
            <input type="submit" value="Logout" name="btAction" />
        </form>
        <%
            String searchValue = request.getParameter("SearchValue");
//          khi goi truc tiep .jsp ==> null
            if (searchValue != null) {
                //ep kieu tuong minh khi getAtribute
                List<RegistrationDTO> result = (List<RegistrationDTO>) request.getAttribute("SEARCH_RESULT");

                if (result != null) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Full name</th>
                    <th>Role</th>
                    <th>Delete</th>
                    <th>Update</th>


                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    for (RegistrationDTO dto : result) {
                        //%20 %f is error khoang trang hoac thieu dau ?,&
                        String urlRewriting = "DispatchServlet"
                                + "?btAction=Delete"
                                + "&pk=" + dto.getUsername()
                                + "&lastSearchValue=" + searchValue;
                %>
            <form action="DispatchServlet" method="POST">
                <tr>
                    <td>
                        <%= ++count%>
                    </td>
                    <td><%= dto.getUsername()%>
                        <input type="hidden" name="txtUsername"
                               value="<%= dto.getUsername()%>" />
                    </td>
                    <td>
                        <input type="text" name="txtPassword"
                               value="<%= dto.getPassword()%>" />
                    </td>
                    <td><%= dto.getFullname()%></td>
                    <td>
                        <input type="checkbox" name="chkAdmin" value="ON"
                               <%
                                   if (dto.isRole()) {
                               %>
                               checked="checked"
                               <%
                                   }//end check role admin
%>
                               />
                    </td>
                    <td>
                        <a href="<%= urlRewriting%>">Delete</a>
                    </td>
                    <td>
                        <input type="submit" value="Update" name="btAction" />
                        <input type="hidden" name="lastSearchValue" value="<%= searchValue%>" />
                    </td>
                </tr>
            </form>

            <%
                }//end traverse DTO
            %>
        </tbody>
    </table>

    <%
    } else {
    %>
    <h2>
        No record is matched!!!
    </h2>
    <%
            }//end no record is existed
        }//end search Value must have valid value
%>--%>
</body>
</html>
