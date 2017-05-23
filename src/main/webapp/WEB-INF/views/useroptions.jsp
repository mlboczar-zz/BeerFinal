<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Megan
  Date: 5/22/2017
  Time: 10:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Options</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

</head>
<body>
<%-- This will contain options to either Find A Beer or Add A Beer --%>




<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#" style="color:firebrick;"><i class="fa fa-beer" aria-hidden="true"></i> Pour Score</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="#" style="color: firebrick">Add A Beer <span class="sr-only">(current)</span></a></li>
                <li><a href="#" style="color: firebrick">Find A Beer</a></li>
            </ul>

            <%--<ul class="nav navbar-nav navbar-right">
                <li><a href="#">Find A Beer</a></li>
            </ul>--%>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<br>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="https://i.ytimg.com/vi/eEPSO7JpHRg/maxresdefault.jpg" alt="..." style="height: 500px;width: 100%;">
            <div class="carousel-caption">

            </div>
        </div>
        <div class="item">
            <img src="https://images.pexels.com/photos/8800/snow-restaurant-mountains-sky.jpg?w=940&h=650&auto=compress&cs=tinysrgb" alt="..." style="height: 500px;width: 100%;">
            <div class="carousel-caption">

            </div>
        </div>
        <div class="item">
            <img src="https://s-media-cache-ak0.pinimg.com/originals/82/18/8f/82188fc924cc756f55d6ca488a8d5ace.jpg" alt="..." style="height: 500px;width: 100%;">
            <div class="carousel-caption">

            </div>
        </div>

    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>





<%--
<h1>Welcome to your Page!</h1>

&lt;%&ndash;<p><a href="/addABeer">Add a Beer to your wishlist!</a></p><br>
<p><a href="/findABeer">Find a Beer you already tasted it!</a></p><br>&ndash;%&gt;

<p>Do you want to add a Beer? Click me! <button> <a href="/addABeer">Add A Beer</a></button></p><br>

<p>Do you want to find a Beer that you have already tasted it? Click me!<button> <a href="/findABeer">Find A Beer</a></button></p>

--%>





</body>
</html>
