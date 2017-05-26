<%--
  Created by IntelliJ IDEA.
  User: Megan
  Date: 5/25/2017
  Time: 4:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>See My Beers</title>
</head>
<body>
<table border="1">
    <c:forEach var="beerreview" items="${bList}">
        <tr>
            <td>User ID</td>
            <td>Beer ID</td>
            <td>Beer Description</td>
            <td>Beer Rating</td>
        </tr>
        <tr>
            <td>${beerreview.userId}</td>
            <td>${beerreview.beerId}</td>
            <td>${beerreview.beerDescription}</td>
            <td>${beerreview.beerRating}</td>

        </tr>
    </c:forEach>
</table>
</body>
</html>

