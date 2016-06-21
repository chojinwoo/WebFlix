<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: bangae1
  Date: 2016-06-21
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .dropdown-menu {
        display:none;
    }
</style>
<!--     start Header Section   -->
<nav id="tm-header" class="uk-navbar">
    <div class="uk-container uk-container-center ">
        <a class="uk-navbar-brand uk-hidden-small" href="/"><i class="uk-icon-small uk-text-primary uk-margin-small-right uk-icon-play-circle"></i> WEBFLIX</a>

        <form class="uk-search uk-margin-small-top uk-margin-left uk-hidden-small">
            <input class="uk-search-field" type="search" placeholder="Search..." autocomplete="off"/>
            <div class="uk-dropdown uk-dropdown-flip uk-dropdown-search" aria-expanded="false"></div>
        </form>

        <sec:authorize access="isAnonymous()">
            <div class="uk-navbar-flip uk-hidden-small">
                <div class="uk-button-group">
                    <a class="uk-button uk-button-link uk-button-large" href="/signup">Sign up</a>
                    <a class="uk-button uk-button-success uk-button-large uk-margin-left" href="/login"><i class="uk-icon-lock uk-margin-small-right"></i> Log in</a>
                </div>
            </div>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <div class="uk-navbar-flip uk-hidden-small" >
                <div class="uk-button-group">
                    <button data-toggle="dropdown" class="uk-button uk-button-link uk-button-large dropdown-toggle"><sec:authentication property="principal.name"/> <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <li><a href="#">HTML</a></li>
                        <li><a href="#">CSS</a></li>
                        <li class="divider"></li><li>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <a href="/admin/main">ADMIN</a></li>
                            <li class="divider"></li>
                        </sec:authorize>

                        <li><a href="/logout">로그아웃</a></li>
                    </ul>
                </div>
            </div>
        </sec:authorize>
        <a href="#offcanvas" class="uk-navbar-toggle uk-visible-small uk-icon-medium" data-uk-offcanvas="data-uk-offcanvas"></a>
        <div class="uk-navbar-flip uk-visible-small">
            <a href="#offcanvas" class="uk-navbar-toggle uk-navbar-toggle-alt uk-icon-medium" data-uk-offcanvas=""></a>
        </div>
        <div class="uk-navbar-brand uk-navbar-center uk-visible-small"><i class="uk-icon-small uk-text-primary uk-margin-small-right uk-icon-play-circle"></i> Webflix</div>
    </div>
</nav>
<!--     ./ Header Section   -->
