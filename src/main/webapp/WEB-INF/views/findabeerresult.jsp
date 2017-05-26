<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Find A Beer Result</title>

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

    <style>
        a {
            text-decoration: none;
            color: firebrick;
        }

        .well {
            text-align: center;
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

<div class="container">
    <div class="col-md-2">

    </div>
    <div class="col-md-6 col-md-offset-1">
        <table border="1">
            <c:forEach var="beer" items="${bList}">
                <tr>
                    <td>${beer.brewer}</td>
                    <td>${beer.beerName}</td>
                    <td>${beer.beerType}</td>
                    <td>${beer.beerFlavors}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-2">

    </div>

</div>
<br>
<div class="well">
    Here's the information on your beer!
</div>
<div class="well">
    <a href="/useroptions2">Back to Main Page</a>
</div>
<div class="well" style="text-align: center;">
    <a href="/findabeer">Search for another beer</a>
</div>

</body>
</html>
