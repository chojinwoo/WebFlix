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
            <sec:authorize access="isAuthenticated()">
                <li id="favorites">
                    <a href="/favorites_list"><i class="uk-icon-heart uk-margin-small-right"></i>즐겨찾기</a>
                </li>
            </sec:authorize>
            <li id="all" class="uk-active">
                <a href="/">전체</a>
            </li>
            <li id="featured">
                <a href="#">추천</a>
            </li>
            <li>
                <a href="#">영화</a>
            </li>
            <li>
                <a href="index.html">드라마</a>
            </li>

            <li class="uk-parent" id="genre">
                <a href="#">장르</a>
                <ul class="uk-nav-sub">
                    <li><a href="#">액션</a></li>
                    <li><a href="#">판타지</a></li>
                    <li><a href="#">애니메이션</a> </li>
                    <li><a href="#">SF</a> </li>
                    <li><a href="#">어드벤쳐</a> </li>
                    <li><a href="#">코믹</a> </li>
                    <li><a href="#">스릴러</a> </li>
                    <li><a href="#">로맨스</a> </li>
                    <li><a href="#">다큐</a> </li>
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
<script>
    $('.uk-nav li:not(#genre, #favorites, #all, #featured)').click(function(e) {
        var genre = $(this).find('a').text();
        $('.video_genre').closest('div').show();
        console.log(genre);
        $.each($('.video_genre'), function() {
            if($(this).val().indexOf(genre) < 0 ) {
                $(this).closest('div').hide();
            }
        })
    })
</script>

</body>
</html>
