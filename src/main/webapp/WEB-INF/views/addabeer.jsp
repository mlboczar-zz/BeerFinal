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
</head>
<body>

<form action="/addabeersuccess" method="post">
    <table>
        <tr>
            <td>Beer Name</td>
            <td><input type="text" name="beerName"><br></td>
        </tr>
        <tr>
            <td>Location</td>
            <td><input type="text" name="location"><br></td>
        </tr>
        <tr>
            <td>Beer Type</td>
            <td><input type="text" name="beerType"><br></td>
        </tr>
        <tr>
            <td>Beer Flavors</td>
            <td><input type="text" name="beerFlavors"><br></td>
        </tr>
    </table>
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
    <input type="checkbox" name="beerDescription" value="zesty">Zesty<br>
    Beer Rating<br>
    <input type="radio" name="beerRating" value="5"> 5<br>
    <input type="radio" name="beerRating" value="4"> 4<br>
    <input type="radio" name="beerRating" value="3"> 3<br>
    <input type="radio" name="beerRating" value="2"> 2<br>
    <input type="radio" name="beerRating" value="1"> 1<br>

    <input type="submit" name="Add Beer"><br>

</form>
</body>
</html>
