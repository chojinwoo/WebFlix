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
<style>
    .slideView > img {
        width:100%;
    }
</style>
<!--     start Main Section   -->
<div class="uk-container uk-container-center uk-margin-large-top uk-margin-large-bottom">
    <div id="playList" class="uk-grid" style="width:100%;padding:10px 0px 10px 0px;">
        <div class="uk-width-medium-2-3">
            <div style="height:90%">
                <ul id="subnav-pill-content" class="uk-switcher" id="info-switcher">
                    <li class="uk-active">
                        <p>히어로즈시즌4</p>
                        <p>평화</p>
                        <p>평점: 9.5</p>
                    </li>
                    <li class="">
                        <div class="uk-margin" data-uk-slideset="{small: 2, medium: 4, large: 6, animation: 'scale', duration:200}">
                            <div class="uk-slidenav-position uk-margin">
                                <ul class="uk-slideset uk-grid uk-flex-center uk-grid-width-1-1 uk-grid-width-large-1-6 uk-grid-width-medium-1-4 uk-grid-width-small-1-2">
                                    <li class="uk-active slideView"><img src="${pageContext.request.contextPath}/resources/img/HeroesSeason4.png" data-holder-rendered="true">1화</li>
                                    <li class="uk-active slideView"><img src="${pageContext.request.contextPath}/resources/img/HeroesSeason4.png" data-holder-rendered="true">2화</li>
                                    <li class="uk-active slideView"><img src="${pageContext.request.contextPath}/resources/img/HeroesSeason4.png" data-holder-rendered="true">3화</li>
                                    <li class="uk-active slideView"><img src="${pageContext.request.contextPath}/resources/img/HeroesSeason4.png" data-holder-rendered="true"></li>
                                    <li class="uk-active slideView"><img src="${pageContext.request.contextPath}/resources/img/HeroesSeason4.png" data-holder-rendered="true"></li>
                                    <li class="uk-active slideView"><img src="${pageContext.request.contextPath}/resources/img/HeroesSeason4.png" data-holder-rendered="true"></li>
                                    <li style="display: none;" class="slideView"><img src="${pageContext.request.contextPath}/resources/img/HeroesSeason4.png" data-holder-rendered="true"></li>
                                    <li style="display: none;" class="slideView"><img src="${pageContext.request.contextPath}/resources/img/HeroesSeason4.png" data-holder-rendered="true"></li>
                                    <li style="display: none;" class="slideView"><img src="${pageContext.request.contextPath}/resources/img/HeroesSeason4.png" data-holder-rendered="true"></li>
                                    <li style="display: none;" class="slideView"><img src="${pageContext.request.contextPath}/resources/img/HeroesSeason4.png" data-holder-rendered="true"></li>
                                </ul>
                                <a href="#" class="uk-slidenav uk-slidenav-previous" data-uk-slideset-item="previous"></a>
                                <a href="#" class="uk-slidenav uk-slidenav-next" data-uk-slideset-item="next"></a>
                            </div>
                            <ul class="uk-slideset-nav uk-dotnav uk-flex-center"><li data-uk-slideset-item="0" class="uk-active"><a></a></li><li data-uk-slideset-item="1" class=""><a></a></li></ul>
                        </div>
                    </li>
                </ul>
            </div>
            <div style="height:10%;">
                <ul class="uk-subnav uk-subnav-pill" data-uk-switcher="{connect:'#subnav-pill-content'}">
                    <li class="uk-active" id="movieInfo"><a href="#">영화정보</a></li>
                    <li class="" id="videoList"><a href="#">회차정보</a></li>
                </ul>
            </div>
        </div>
        <div  class="uk-width-medium-1-3">
            <img src="${pageContext.request.contextPath}/resources/img/HeroesSeason4.png" style="width:100%; height:300px;">
        </div>
    </div>
    <div class="uk-grid">
        <div id="tm-left-section" class="uk-width-medium-3-10 uk-width-large-2-10 uk    -hidden-small">
            <div class="uk-panel">
                <ul class="uk-nav  uk-nav-side uk-nav-parent-icon uk-margin-bottom" data-uk-nav="">
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
<script>
    $(document).ready(function() {

        $(document).on('click',$('.video-media'), function(e) {
            var video_kind_seq = $(e.target).attr('data-kind-seq');
            $.ajax({
                url:"${pageContext.request.contextPath}/viewList/"+video_kind_seq,
                type:'post',
                dataType:'json',
                success:function(data) {
                    alert(data);
                }, error:function(xhr, status, error) {
                    console.log(error);
                }
            })
        })

        function drawGridKind(rowCount, video_kind) {
            $('#tm-right-section').empty();
            var row = [];
            var pageMax = 1;
            row.push('<div class="uk-grid" data-uk-grid-margin>');
            $.each(video_kind, function(i) {
                row.push('<div class="video-row uk-width-large-1-4 uk-width-medium-1-3 uk-row-first" data-genre="'+this.genre+'" data-title3="'+this.title1+this.title2+'">');
                row.push('    <div class="uk-overlay uk-overlay-hover">');
                row.push('        <img class="video-thumbnail" src="${pageContext.request.contextPath}'+this.coverPath + this.coverName+'" alt="Image" />');
                row.push('        <div class="uk-overlay-panel uk-overlay-fade uk-overlay-background  uk-overlay-icon"></div>');
                row.push('        <a class="uk-position-cover video-media" data-kind-seq="'+this.videoKindSeq+'"></a>');
                row.push('    </div>');
                row.push('    <div class="uk-panel" >');
                row.push('        <h5 class="uk-panel-title video-title">'+this.title1+this.title2+'</h5>');
                row.push('        <p>');
                row.push('            <span class="rating">');
                row.push('                <i class="uk-icon-star"></i>');
                row.push('                <i class="uk-icon-star"></i>');
                row.push('                <i class="uk-icon-star"></i>');
                row.push('                <i class="uk-icon-star"></i>');
                row.push('                <i class="uk-icon-star"></i>');
                row.push('            </span>');
                row.push('            <span class="video-start-date" class="uk-float-right">'+this.start_date.substr(0, 4)+'</span>');
                row.push('        </p>');
                row.push('    </div>');
                row.push('</div>');

                if (i % rowCount == (rowCount -1)) {
                    row.push('</div>');
                    $('#tm-right-section').append(row.join(''));
                    row = [];
                    row.push('<div class="uk-grid" data-uk-grid-margin  style="display:none;">');
                    pageMax++;
                }

                if((i+1) == Object.keys(video_kind).length) {
                    row.push('</div>');
                    $('#tm-right-section').append(row.join(''));
                    var paging = [];
                    paging.push('<div class="uk-margin-large-top uk-margin-bottom">');
                    paging.push('<ul class="uk-pagination">');
                    paging.push('</ul>');
                    paging.push('</div>');
                    $('#tm-right-section').append(paging.join(''));
                    var pagination = UIkit.pagination($('.uk-pagination'), {
                        items:pageMax,
                        itemOnPage:1
                    });

                    $('.uk-pagination').on('select.uk.pagination', function(e, pageIndex){
                        $('#tm-right-section .uk-grid').hide();
                        $('#tm-right-section .uk-grid:eq('+pageIndex+')').show();
                    });
                }
            });
        }


        var video_kind = JSON.parse('${json_videoKind}');
        <%--var favourite = JSON.parse('${json_video_favourite}');--%>

        function draw() {
            drawGridKind(20, video_kind);
        }

        draw();


        $('.uk-nav li:not(#genre, #featured)').click(function(e) {
            var sortVideo = new Array();
            var genre = $(this).find('a').text();

            $('.uk-nav li').removeClass('uk-active');
            $(this).addClass('uk-active');
            if($(this).attr('id') != 'all') {
                $.each(video, function() {
                    if(this.genre.indexOf(genre) > -1 ) {
                        sortVideo.push(this);
                    }
                })
                draw();
            } else if($(this).attr('id') == 'all') {
                draw();
            }
        })

        var oldSearch = "";
        $('.uk-search-field').keyup(function() {
            var sortVideo = [];
            var search = $(this).val();

            if(search != oldSearch) {

                if(search != "" && search != null) {
                    $.each(video, function() {
                        if(this.title3.indexOf(search) > -1 ) {
                            sortVideo.push(this);
                        }
                    })

                    draw();
                } else {
                    draw();
                }
            }
            oldSearch = search;
        });
    })
</script>