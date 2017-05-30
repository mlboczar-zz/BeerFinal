<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/26/2017
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Age Verification</title>
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
    <style>
        form {
            margin: 0 auto;
            width: 35%;
        }
    </style>

</head>
<body>
<%--
<form:form name="myForm" method="POST" action="/verifyage">
    <h1>Welcome to The Pour Sour</h1>
    <fieldset>
    <legend>You Must Enter Your Age: </legend>
    <table>
    <tr>
    <td><form:label path="userage">Your Age: </form:label></td>
    <td><form:input path="userage"></form:input></td>
    </tr>
    <tr>
    <td></td>
    <td><input type="submit" value="Submit"/></td>
    </tr>
    </table>
    </fieldset>

</form:form>
--%>


<form name="myForm" method="POST" action="/verifyage">
    <div class="form-group" style="text-align: center;">
        <h1>Welcome to The Pour Score!</h1>
        <p>In order to get into this site you must enter your age!</p>
        <input type="number" name="age" class="form-control" placeholder="Enter your age!">
        <br>
        <button type="submit" class="btn btn-info">Submit</button>
    </div>
</form>

<%-- JS--
<script>
    function validateForm() {
        var yourAge = document.forms["myForm"]["age"].value;
        if (yourAge < 21) {
            alert("Your age is not enough");
            return false;
        }
        if (yourAge >= 21){
            alert("Way to go! You can add your beer!");
            return false;
        }
    }
</script>--%>
</body>
</html>
