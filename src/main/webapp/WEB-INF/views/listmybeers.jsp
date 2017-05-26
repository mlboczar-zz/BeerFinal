<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: seandunn92
  Date: 5/25/17
  Time: 3:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List My Beers</title>
</head>
<body>


<table border="1">
    <c:forEach var="beerreview" items="${bList}">
        <tr>
            <td>${beerreview.userId}</td>
            <td>${beerreview.beerId}</td>
            <td>${beerreview.beerDescription}</td>
            <td>${beerreview.beerRating} Stars</td>

        </tr>
    </c:forEach>
</table>
<%--Beer Reference Chart--%>
<%--<table border="2">--%>
    <%--<c:forEach var="beer" items="${beerList}">--%>
        <%--<tr>--%>
            <%--<td>${beer.beerId}</td>--%>
            <%--<td>${beer.beerName}</td>--%>
            <%--&lt;%&ndash;<td>${beer.beerType}</td>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<td>${beer.brewer} </td>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<td>${beer.location} </td>&ndash;%&gt;--%>


        <%--</tr>--%>
    <%--</c:forEach>--%>
</table>
</body>
</html>
