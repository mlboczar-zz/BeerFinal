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

    <link href="../resources/styles.css" rel="stylesheet">

</head>
<body>

<script>
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);
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
        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });
    }

    window.fbAsyncInit = function () {
        FB.init({
            appId: '300195257082047',
            cookie: true,  // enable cookies to allow the server to access
                           // the session
            xfbml: true,  // parse social plugins on this page
            version: 'v2.9' // use graph api version 2.8
        });

        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });

    };

    // Load the SDK asynchronously
    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    function testAPI() {
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me', function (response) {
            console.log('Successful login for: ' + response.name);
            document.getElementById('ourDiv').innerHTML ="Name: " + response.name + "<br>" +  "Id: " +
                response.id;

            document.getElementById('see').setAttribute("href","/seemybeers1?status=" +response.id
                +"&name=" + response.name);
            document.getElementById('add').setAttribute("href","/addabeer1?status=" + response.id
                +"&name=" + response.name);
            document.getElementById('find').setAttribute("href","/findabeer1?status=" + response.id
                +"&name=" + response.name);
            document.getElementById('review').setAttribute("href","/reviewabeer1?status=" +response.id
                +"&name=" + response.name);


        });
    }

</script>

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
            <a id="brand" class="navbar-brand" href="/useroptions2"><i class="fa fa-beer" aria-hidden="true"></i> Pour
                Score</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a id="add" href="/addabeer">Add A Beer</a></li>
                <li><a id="review" href="/reviewabeer">Review A Beer</a></li>
                <li><a id="find" href="/findabeer">Find A Beer</a></li>
                <li><a id="see" href="/seemybeers">See What I've Rated</a></li>
            </ul>

            <%--<ul class="nav navbar-nav navbar-right">
                <li><a href="#">Find A Beer</a></li>
            </ul>--%>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<table border="1">
    <tr>
        <td>Brewer</td>
        <td>Beer Name</td>
        <td>Beer Type</td>
        <td>Beer Description</td>
        <td>Beer Rating</td>
    </tr>
    <c:forEach var="beerreview" items="${bList}">
        <tr>
            <td>${beerreview.brewer}</td>
            <td>${beerreview.beerName}</td>
            <td>${beerreview.beerType}</td>
            <td>${beerreview.beerDescription}</td>
            <td>${beerreview.beerRating}</td>
        </tr>
    </c:forEach>
</table>

<div class="page-header">
    <h3>Share PourScore with your friends</h3>
</div>

<p>Like our app? Share it with your friends!</p>

<div id="shareBtn" class="btn btn-success clearfix">Share</div>

<p style="margin-top: 50px">
<hr/>
<a class="btn btn-small" href="https://developers.facebook.com/docs/sharing/reference/share-dialog">Share Dialog
    Documentation</a>

<script>
    document.getElementById('shareBtn').onclick = function () {
        FB.ui({
            method: 'share',
            display: 'popup',
            //replace with actual website Link
            href: document.URL
        }, function (response) {
        });
    }
</script>

</body>
</html>

