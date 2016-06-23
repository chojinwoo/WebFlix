<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--
  Created by IntelliJ IDEA.
  User: bangae1
  Date: 2016-06-21
  Time: 오후 2:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(document).ready(function() {
        $('.uk-search').css('display','inline-block');
    })
</script>
<!--     start Main Section   -->
<div class="uk-container uk-container-center uk-margin-large-top uk-margin-large-bottom">

    <div class="uk-grid">
        <div id="tm-left-section" class="uk-width-medium-3-10 uk-width-large-2-10 uk    -hidden-small">
            <div class="uk-panel">
                <ul class="uk-nav  uk-nav-side uk-nav-parent-icon uk-margin-bottom" data-uk-nav="">
                    <li id="favorites"><a href="#"><i class="uk-icon-heart uk-margin-small-right"></i>즐겨찾기</a></li>
                    <li id="all" class="uk-active"><a href="#">전체</a></li>
                    <li id="featured"><a href="#">추천</a></li>
                    <li><a href="#">영화</a></li>
                    <li><a href="#">드라마</a></li>
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
                </ul>
                <ul class="uk-nav uk-nav-comments uk-nav-side" data-uk-nav="">
                    <li class="uk-nav-header uk-margin-small-bottom">Latest Comments</li>
                    <li><a href="#">Media title goes here<div> Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam </div></a></li>
                    <li><a href="#">Media title goes here<div> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium </div></a></li>
                    <li><a href="#">Media title goes here<div> vel illum qui dolorem eum fugiat quo voluptas nulla pariatu </div></a></li>

                    <li class="uk-nav-divider" sec:authorize="isAnonymous()"></li>
                </ul>
                <sec:authorize access="isAnonymous()">
                    <div class="uk-panel">
                        <h5 class="uk-panel-header uk-margin-top widget-header">Quick Login</h5>
                        <form class="uk-form ">
                            <fieldset>
                                <div class="uk-form-row">
                                    <input type="text" placeholder="Username" class="uk-width-1-1"/>
                                </div>
                                <div class="uk-form-row">
                                    <input type="password" placeholder="Password" class="uk-width-1-1"/>
                                </div>

                                <div class="uk-form-row">
                                    <label><input type="checkbox"/> Remember me</label>
                                </div>
                                <div class="uk-form-row">
                                    <button class="uk-button uk-button-success uk-width-1-1">log in</button>
                                    <a href="/forgotPassword" class="uk-button uk-button-link uk-button-small uk-margin-top ">비밀번호찾기</a>
                                    <a href="/signup" class="uk-button uk-button-link uk-button-small uk-margin-top uk-text-muted uk-float-right">Sign up</a>
                                </div>

                            </fieldset>
                        </form>
                    </div>
                </sec:authorize>
            </div>
        </div>
        <div id="tm-right-section" class="uk-width-large-8-10 uk-width-medium-7-10"  data-uk-scrollspy="{cls:'uk-animation-fade', target:'img'}">
        </div>
    </div>
</div>
<!--     ./ Main Section   -->