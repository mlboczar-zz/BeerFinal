<%--
  Created by IntelliJ IDEA.
  User: Megan
  Date: 5/30/2017
  Time: 1:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add A Beer</title>
</head>
<body>
<form action="/addabeersuccess" method="post">
    Brewer <input type="text" name="brewer"><br>
    Beer Name <input type="text" name="beerName"><br>
    Beer Type <input type="text" name="beerType"><br>
    Primary Beer Flavor <input type="text" name="beerFlavors"><br>
    <button type="submit" name="Add Beer">Submit</button>
</form>
</body>
</html>
