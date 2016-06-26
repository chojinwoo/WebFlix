<%--
  Created by IntelliJ IDEA.
  User: bangae1
  Date: 2016-06-21
  Time: 오후 2:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Webflix - Streaming Media Theme - Log in</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="/resources/img/x-icon"/>
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png"/>

    <!--     Include UIKit CSS   -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/uikit.css"/>

    <!--     Theme CSS   -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.css"/>
</head>
<body  class="uk-height-1-1" cz-shortcut-listen="true">



<!--     start Top Navbar   -->

<div class="tm-navbar tm-navbar-overlay tm-navbar-transparent tm-navbar-contrast">
    <nav class="uk-navbar uk-margin-top">
        <div class="uk-container-center uk-container">
            <ul class="uk-navbar-nav">
                <li><a href="${pageContext.request.contextPath}/"><i class="uk-icon-medium uk-icon-arrow-left"></i></a></li>

            </ul>
            <div class="uk-navbar-flip">
                <ul class="uk-navbar-nav">
                    <%--<li><a href="${pageContext.request.contextPath}/signup ">Sign up</a></li>--%>
                </ul>
            </div>
        </div>
    </nav>
</div>

<!--     ./ Top Navbar   -->


<!--     Start Main Content  -->

<div class="uk-overlay uk-text-center uk-vertical-align uk-height-1-1">
    <img class="uk-animation-fade tm-bg-cover" src="${pageContext.request.contextPath}/resources/img/bg.jpg" width="100%" height="100%" alt=""/>
    <div class="uk-vertical-align  uk-overlay-panel uk-overlay-background">
        <div class=" uk-vertical-align-middle uk-text-center  uk-width-medium-3-10 uk-width-large-2-10 uk-container-center">

            <div class="uk-margin-large-bottom  uk-animation-reverse uk-animation-scale uk-animation-hover">
                <img class="uk-margin uk-margin-remove" width="200" height="40" alt="logo" src="${pageContext.request.contextPath}/resources/img/logo.svg"/>
            </div>
            <form  class=" uk-form" action="${pageContext.request.contextPath}/loginProcess" method="POST">
                <h2 class="uk-margin-large-bottom uk-text-muted">Log in</h2>
                <div class="uk-form-row">
                    <div class="uk-form-icon uk-form-icon-flip uk-width-1-1">
                        <input type="text" class="uk-width-1-1" name="id" placeholder="ID"/>
                        <i class="uk-icon-user"></i>
                    </div>                    </div>
                <div class="uk-form-row">
                    <div class="uk-form-icon uk-form-icon-flip uk-width-1-1" >
                        <input type="password"  class="uk-width-1-1" name="password" placeholder="Password"/>
                        <i class="uk-icon-lock "></i>
                    </div>                    </div>
                <div class="uk-form-row uk-text-small">
                    <label class="uk-float-left"><input type="checkbox" name="remember-me"/> Remember Me</label>
                    <a class="uk-float-right uk-link " href="${pageContext.request.contextPath}/forgotPassword">비밀번호찾기</a>
                </div>
                <div class="uk-form-row">
                    <button class="uk-width-1-1 uk-button uk-button-success uk-button-large">Log in</button>
                </div>

            </form>
        </div>
    </div>
</div>
<!-- ./ Main Content  -->


<!--   Include JS  -->

<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.4.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/uikit.min.js"></script>

</body>
</html>
