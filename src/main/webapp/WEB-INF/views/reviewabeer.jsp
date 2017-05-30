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

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <link href="../../resources/styles.css" rel="stylesheet">

    <style>
        select {
            padding: 8px 8px 8px 8px;
        }

        form {
            margin: 0 auto;
            width: 50%;
            border: 5px solid firebrick;
            padding: 15px;
        }

        h1 {
            text-align: center;
        }

        h1, h4{
            color: firebrick;
        }
        #find, #see{
            color: firebrick;
        }
    </style>

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
                <li class="active"><a id="add" href="/reviewabeer">Review A Beer <span
                        class="sr-only">(current)</span></a></li>
                <li><a id="find" href="/findabeer">Find A Beer</a></li>
                <li><a id="see" href="/seemybeers">See What I've Rated</a></li>
            </ul>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<form action="/reviewabeersuccess" method="post">

    <h1>Choose A Beer to Rate</h1>

    <fieldset>
        <h4>Choose a Beer :</h4>

        <select name="beerID">
            <option value="4">Oberon</option>
            <option value="5">Fat Tire</option>
            <option value="6">All Day IPA</option>
            <option value="7">Two-Hearted Ale</option>
            <option value="8">Bell's Amber Ale</option>
            <option value="9">Kentucky Breakfast Stout</option>
            <option value="10">Dirty Bastard</option>
        </select>
    </fieldset>
    <br>
    <fieldset>
        <h4>Beer Description :</h4>
        <label for="checkbox-1">Bold</label>
        <input type="checkbox" name="beerDescription" value="Bold" id="checkbox-1">

        <label for="checkbox-2">Hoppy</label>
        <input type="checkbox" name="beerDescription" value="Hoppy" id="checkbox-2">

        <label for="checkbox-3">Light</label>
        <input type="checkbox" name="beerDescription" value="Light" id="checkbox-3">

        <label for="checkbox-4">Zesty</label>
        <input type="checkbox" name="beerDescription" value="Zesty" id="checkbox-4">

        <label for="checkbox-5">Creamy</label>
        <input type="checkbox" name="beerDescription" value="Creamy" id="checkbox-5">

        <label for="checkbox-6">Fruity</label>
        <input type="checkbox" name="beerDescription" value="Fruity" id="checkbox-6">

        <label for="checkbox-7">Smooth</label>
        <input type="checkbox" name="beerDescription" value="Smooth" id="checkbox-7">
        <br>
        <label for="checkbox-8">Rich</label>
        <input type="checkbox" name="beerDescription" value="Rich" id="checkbox-8">

        <label for="checkbox-9">Malty</label>
        <input type="checkbox" name="beerDescription" value="Malty" id="checkbox-9">

        <label for="checkbox-10">Crisp</label>
        <input type="checkbox" name="beerDescription" value="Crisp" id="checkbox-10">

        <label for="checkbox-11">Bitter</label>
        <input type="checkbox" name="beerDescription" value="Bitter" id="checkbox-11">

        <label for="checkbox-12">Floral</label>
        <input type="checkbox" name="beerDescription" value="Floral" id="checkbox-12">

        <label for="checkbox-13">Delicate</label>
        <input type="checkbox" name="beerDescription" value="Delicate" id="checkbox-13">

        <label for="checkbox-14">Refreshing</label>
        <input type="checkbox" name="beerDescription" value="Refreshing" id="checkbox-14">
    </fieldset>
    <br>
    <fieldset>
        <h4>Beer Rating :</h4>
        <label for="radio-1">5 Star</label>
        <input type="radio" name="beerRating" value="5" id="radio-1">
        <label for="radio-2">4 Star</label>
        <input type="radio" name="beerRating" value="4" id="radio-2">
        <label for="radio-3">3 Star</label>
        <input type="radio" name="beerRating" value="3" id="radio-3">
        <label for="radio-4">2 Star</label>
        <input type="radio" name="beerRating" value="2" id="radio-4">
        <label for="radio-5">1 Star</label>
        <input type="radio" name="beerRating" value="1" id="radio-5">
    </fieldset>
    <table>
        <tr>
            <td><input type="hidden" name="userID" value="userId"></td>
            <td></td>
            <td>
                <button type="submit" class="btn btn-primary" name="Add Beer">Submit</button>
            </td>
        </tr>
    </table>
</form>

</body>

<script>
    $(function () {
        $("input").checkboxradio();
    });
</script>
</html>
