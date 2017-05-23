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
    <style>
        .dropbtn {
            background-color: #4CAF50;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

        .dropbtn:hover, .dropbtn:focus {
            background-color: #3e8e41;
        }

        #myInput {
            border-box: box-sizing;
            background-image: url('searchicon.png');
            background-position: 14px 12px;
            background-repeat: no-repeat;
            font-size: 16px;
            padding: 14px 20px 12px 45px;
            border: none;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f6f6f6;
            min-width: 230px;
            overflow: auto;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown a:hover {
            background-color: #ddd
        }

        .show {
            display: block;
        }
    </style>
</head>
<body>

<form action="/addabeersuccess" method="post">
    <h2>Choose a beer to rate</h2>

    <div class="dropdown">
        <button onclick="toggleDropdownContent()" class="dropbtn">Dropdown</button>
        <div id="myDropdown" class="dropdown-content">
            <input type="text" placeholder="Search..." id="myInput" onkeyup="filterFunction()">
            <a>Oberon</a>
            <a>Fat Tire</a>
        </div>
    </div>

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

    <%--BeerID--%>
    <%--<input type="text" name="beerID"><br>--%>

    <input type="submit" name="Add Beer"><br>

</form>

<script>
    function toggleDropdownContent() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    function filterFunction() {
        var input, filter, ul, li, a, i;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        div = document.getElementById("myDropdown");
        a = div.getElementsByTagName("a");
        for (i = 0; i < a.length; i++) {
            if (a[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
                a[i].style.display = "";
            } else {
                a[i].style.display = "none";
            }
        }
    }
</script>

</body>
</html>
