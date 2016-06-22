<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: bangae1
  Date: 2016-06-21
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!--     start Offcanvas Menu   -->

<div id="offcanvas" class="uk-offcanvas">
    <div class="uk-offcanvas-bar">
        <div class="uk-panel">
            <form class="uk-search">
                <input class="uk-search-field" type="search" placeholder="Search..."/>
            </form>
            <sec:authorize access="isAnonymous()">
            <div class="uk-button-group">
                <a class="uk-button uk-button-link uk-button-large uk-text-muted" href="signup.html">Sign up</a>
                <a class="uk-button uk-button-success uk-button-large uk-margin-left" href="login.html"><i class="uk-icon-lock uk-margin-small-right"></i> Log in</a>
            </div>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <div class="uk-button-group">
                    <span data-toggle="dropdown" class="uk-button uk-button-link uk-button-large dropdown-toggle"><sec:authentication property="principal.name"/> </span>
                </div>
            </sec:authorize>
        </div>
        <ul class="uk-nav uk-nav-offcanvas uk-nav-parent-icon" data-uk-nav="data-uk-nav">
            <li href="#">
                <a href="#"><i class="uk-icon-heart uk-margin-small-right"></i>Favourites</a>
            </li>
            <li class="uk-active">
                <a href="#">All</a>
            </li>
            <li>
                <a href="#">Featured</a>
            </li>
            <li>
                <a href="#">Movies</a>
            </li>
            <li>
                <a href="index.html">TV Shows</a>
            </li>

            <li>
                <a href="index.html.html">Music</a>
            </li>
            <li class="uk-parent">
                <a href="#">Genre</a>
                <ul class="uk-nav-sub">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Animation</a> </li>
                    <li><a href="#">Anime</a> </li>
                    <li><a href="#">Adventure</a> </li>
                    <li><a href="#">Biography</a> </li>
                    <li><a href="#">Comedy</a> </li>
                    <li><a href="#">Crime</a> </li>
                    <li><a href="#">Romance</a> </li>
                    <li><a href="#">Documentary</a> </li>
                </ul>
            </li>
            <li class="uk-nav-divider"></li>
            <li class="uk-nav-header">Pages</li>
            <li><a href=""> Home</a></li>
            <li><a href=""> FAQ's</a></li>
            <li><a href=""> TermsConditions</a></li>
            <li><a href=""> Privacy Policy</a></li>
            <li><a href=""> Contact Us</a></li>
        </ul>
        <div class="uk-panel uk-text-center">
            <ul class="uk-subnav">
                <li><a href="#" class="uk-icon-hover uk-icon-medium uk-icon-facebook-square"></a></li>
                <li><a href="#" class="uk-icon-hover uk-icon-medium uk-icon-twitter"></a></li>
                <li><a href="#" class="uk-icon-hover uk-icon-medium uk-icon-instagram"></a></li>
                <li><a href="#" class="uk-icon-hover uk-icon-medium uk-icon-pinterest"></a></li>
            </ul>
        </div>
    </div>
</div>

<!--     ./ Offcanvas Menu   -->
<!--     Include JS   -->


</body>
</html>
