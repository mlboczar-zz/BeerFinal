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
    <title>Add A Beer</title>
    <link href="../../resources/styles.css" rel="stylesheet">

</head>
<body>

<form action="/addabeersuccess" method="post">

    <h4>Choose a beer to rate</h4>

    <select name="beerID">
        <option value="4">Oberon</option>
        <option value="5">Fat Tire</option>
        <option value="6">All Day IPA</option>
        <option value="7">Two-Hearted Ale</option>
        <option value="8">Bell's Amber Ale</option>
        <option value="9">Kentucky Breakfast Stout</option>
        <option value="10">Dirty Bastard</option>
    </select>
    <br><br>

    Beer Description<br>
    <input type="checkbox" name="beerDescription" value="bitter">Bitter<br>
    <input type="checkbox" name="beerDescription" value="bold">Bold<br>
    <input type="checkbox" name="beerDescription" value="creamy">Creamy<br>
    <input type="checkbox" name="beerDescription" value="crisp">Crisp<br>
    <input type="checkbox" name="beerDescription" value="delicate">Delicate<br>
    <input type="checkbox" name="beerDescription" value="floral">Floral<br>
    <input type="checkbox" name="beerDescription" value="fruity">Fruity<br>
    <input type="checkbox" name="beerDescription" value="hoppy">Hoppy<br>
    <input type="checkbox" name="beerDescription" value="light">Light<br>
    <input type="checkbox" name="beerDescription" value="malty">Malty<br>
    <input type="checkbox" name="beerDescription" value="refreshing">Refreshing<br>
    <input type="checkbox" name="beerDescription" value="rich">Rich<br>
    <input type="checkbox" name="beerDescription" value="smooth">Smooth<br>
    <input type="checkbox" name="beerDescription" value="zesty">Zesty<br><br>
    Beer Rating<br>
    <input type="radio" name="beerRating" value="5"> 5<br>
    <input type="radio" name="beerRating" value="4"> 4<br>
    <input type="radio" name="beerRating" value="3"> 3<br>
    <input type="radio" name="beerRating" value="2"> 2<br>
    <input type="radio" name="beerRating" value="1"> 1<br>

    <input type="text" name="userID">

    <input type="submit" name="Add Beer"><br>
</form>

</body>
</html>
