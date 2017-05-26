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

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <link href="../../resources/styles.css" rel="stylesheet">

</head>
<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a id="brand" class="navbar-brand" href="/useroptions2"><i class="fa fa-beer" aria-hidden="true"></i> Pour
                Score</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a id="add" href="/addabeer">Add A Beer <span
                        class="sr-only">(current)</span></a></li>
                <li><a id="find" href="/findabeer">Find A Beer</a></li>
            </ul>

            <%--<ul class="nav navbar-nav navbar-right">
                <li><a href="#">Find A Beer</a></li>
            </ul>--%>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


<form action="/addabeersuccess" method="post">
    <fieldset>
        <legend>Choose a beer to rate</legend>
        <table>
            <tr>
                <td>Choose a beer:</td>
                <td>
                    <select name="beerID">
                        <option value="4">Oberon</option>
                        <option value="5">Fat Tire</option>
                        <option value="6">All Day IPA</option>
                        <option value="7">Two-Hearted Ale</option>
                        <option value="8">Bell's Amber Ale</option>
                        <option value="9">Kentucky Breakfast Stout</option>
                        <option value="10">Dirty Bastard</option>
                    </select>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>Beer Description:</td>
                <td>
                    <input type="checkbox" name="beerDescription" value="bitter"> Bold
                    <input type="checkbox" name="beerDescription" value="bold"> Hoppy
                    <input type="checkbox" name="beerDescription" value="creamy"> Light
                    <input type="checkbox" name="beerDescription" value="fruity"> Zesty
                    <input type="checkbox" name="beerDescription" value="hoppy"> Creamy
                    <input type="checkbox" name="beerDescription" value="light"> Fruity
                    <input type="checkbox" name="beerDescription" value="zesty"> Smooth
                </td>
            <tr>
                <td></td>
                <td>
                    <input type="checkbox" name="beerDescription" value="crisp"> Rich
                    <input type="checkbox" name="beerDescription" value="delicate"> Malty
                    <input type="checkbox" name="beerDescription" value="floral"> Crisp
                    <input type="checkbox" name="beerDescription" value="malty"> Bitter
                    <input type="checkbox" name="beerDescription" value="refreshing"> Floral
                    <input type="checkbox" name="beerDescription" value="rich"> Delicate
                    <input type="checkbox" name="beerDescription" value="smooth"> Refreshing
                </td>
            </tr>
            </tr>
            <br>
            <tr>
                <td>Beer Rating:</td>
                <td>
                    <input type="radio" name="beerRating" value="5"> 5
                    <input type="radio" name="beerRating" value="4"> 4
                    <input type="radio" name="beerRating" value="3"> 3
                </td>
            <tr>
                <td></td>
                <td>
                    <input type="radio" name="beerRating" value="2"> 2
                    <input type="radio" name="beerRating" value="1"> 1
                    <input type="radio" name="beerRating" value="0"> 0
                </td>
            </tr>
            </tr><br>
            <tr>
                <td><input type="hidden" name="userID" value="userId"></td>
                <td>
                    <input type="submit" name="Add Beer">
                </td>
            </tr>
        </table>
    </fieldset>

    <%--<h4>Choose a beer to rate</h4>

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

    <input type="hidden" name="userID" value="userId">

    <input type="submit" name="Add Beer"><br>--%>
</form>

</body>
</html>
