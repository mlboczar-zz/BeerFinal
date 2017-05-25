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
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <link href="../../resources/styles.css" rel="stylesheet">
    <%--<style>
        #img1, #img2, #img3 {
            height: 500px;
            width: 100%;
        }
        #brand, #add, #find {
            color: firebrick;
        }


    </style>--%>

</head>
<body>
<%-- This will contain options to either Find A Beer or Add A Beer --%>

<table>
    <tr>
        <td>Hello,</td>
        <td>${loginName}</td>
    </tr>
</table>
<br>

<form action = "/useroptions" >
    <input type="hidden" name = "status" id="status" value='${status}'/>
    <input type="hidden" name = "userName" id="userName" value='${userName}'/>
    <input type="submit" value ="Refresh" name = "Submit" />

</form>
<%--<form action = "/redirect" >--%>
<%--<input type="hidden" name = "status" id="status2" value='${status}'/>--%>
<%--<input type="hidden" name = "userName" id="userName2" value='${userName}'/>--%>

<%--<input type="submit" action="/redirect" value ="Sign Up" name = "Submit" />--%>
<%--</form>--%>






<script>
    // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);
        // The response object is returned with a status field that lets the
        // app know the current login status of the person.
        // Full docs on the response object can be found in the documentation
        // for FB.getLoginStatus().
        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            testAPI();
        } else {
            // The person is not logged into your app or we are unable to tell.
            document.getElementById('status').innerHTML = 'Please log ' +
                'into this app.';
        }
    }

    function checkLoginState() {
        // This function is called when someone finishes with the Login
        // Button.  See the onlogin handler attached to it in the sample
        // code below.
        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });
    }

    window.fbAsyncInit = function() {
        FB.init({
            appId      : '300195257082047',
            cookie     : true,  // enable cookies to allow the server to access
                                // the session
            xfbml      : true,  // parse social plugins on this page
            version    : 'v2.9' // use graph api version 2.8
        });

        // Now that we've initialized the JavaScript SDK, we call
        // FB.getLoginStatus().  This function gets the state of the
        // person visiting this page and can return one of three states to
        // the callback you provide.  They can be:
        //
        // 1. Logged into your app ('connected')
        // 2. Logged into Facebook, but not your app ('not_authorized')
        // 3. Not logged into Facebook and can't tell if they are logged into
        //    your app or not.
        //
        // These three cases are handled in the callback function.

        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });

    };

    // Load the SDK asynchronously
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // Here we run a very simple test of the Graph API after login is
    // successful.  See statusChangeCallback() for when this call is made.
    function testAPI() {
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me', function(response) {
            console.log('Successful login for: ' + response.name);
            document.getElementById('ourDiv').innerHTML =
                response.id;

            document.getElementById('status').value = response.id;
            document.getElementById('userName').value = response.name;
//            document.getElementById('status2').value = response.id;
//            document.getElementById('userName2').value = response.name;

        });
    }





</script>


<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->

<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>

<div id="ourDiv">
</div>

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
            <a id="brand" class="navbar-brand" href="#"><i class="fa fa-beer" aria-hidden="true"></i> Pour Score</a>
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
            <img id="img1" src="https://i.ytimg.com/vi/eEPSO7JpHRg/maxresdefault.jpg" alt="...">
            <div class="carousel-caption">

            </div>
        </div>
        <div class="item">
            <img id="img2"
                 src="https://images.pexels.com/photos/8800/snow-restaurant-mountains-sky.jpg?w=940&h=650&auto=compress&cs=tinysrgb"
                 alt="...">
            <div class="carousel-caption">

            </div>
        </div>
        <div class="item">
            <img id="img3"
                 src="https://s-media-cache-ak0.pinimg.com/originals/82/18/8f/82188fc924cc756f55d6ca488a8d5ace.jpg"
                 alt="...">
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
