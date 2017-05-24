<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Megan
  Date: 5/22/2017
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find A Beer Result</title>
</head>
<body>

<table border="1">
    <c:forEach var="beer" items="${bList}">
        <tr>
            <td>${beer.brewer}</td>
            <td>${beer.beerName}</td>
            <td>${beer.beerType}</td>
            <td>${beer.beerFlavors}</td>
        </tr>
    </c:forEach>
</table>
Here's the information on your beer! <br>

<a href="/">Back to List</a>


</body>
</html>
