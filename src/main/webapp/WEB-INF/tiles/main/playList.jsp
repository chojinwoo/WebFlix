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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom/index.css"/>
<%--video view--%>
<div id="video" class="mv-container">
    <div id="video-cancel" class="mv-cancel"><i class="uk-icon-arrow-circle-left uk-icon-large"></i></div>
    <div id="video-heart" class="mv-heart"><i class="uk-icon-heart-o uk-icon-large"></i></div>
</div>
<!--     start Main Section   -->
<div id="main-container" class="uk-container uk-container-center uk-margin-large-top uk-margin-large-bottom">
    <div class="uk-grid">
        <div id="tm-left-section" class="uk-width-medium-3-10 uk-width-large-2-10 uk    -hidden-small">
            <div class="uk-panel">
                <ul id="category" class="uk-nav  uk-nav-side uk-nav-parent-icon uk-margin-bottom" data-uk-nav="">
                    <li id="all" class="uk-active"><a href="#all">전체</a></li>
                    <li id="featured"><a href="#featured">추천</a></li>
                    <li><a href="#movie">영화</a></li>
                    <li><a href="#drama">드라마</a></li>
                    <li class="uk-parent" id="genre">
                        <a href="#">장르</a>
                        <ul class="uk-nav-sub">
                            <li><a href="#action">액션</a></li>
                            <li><a href="#fantasy">판타지</a></li>
                            <li><a href="#animation">애니메이션</a> </li>
                            <li><a href="#sf">SF</a> </li>
                            <li><a href="#advence">어드벤쳐</a> </li>
                            <li><a href="#comic">코믹</a> </li>
                            <li><a href="#horror ">스릴러</a> </li>
                            <li><a href="#romance">로맨스</a> </li>
                            <li><a href="#crime">범죄</a> </li>
                        </ul>
                    </li>
                    <li class="uk-nav-divider"></li>
                </ul>
                <ul class="uk-nav uk-nav-comments uk-nav-side" data-uk-nav="">
                    <li class="uk-nav-header uk-margin-small-bottom">최근 업로드</li>
                    <c:forEach items="${lastUpdate}" var="last">
                        <li><a href="#">${last.title3}<div> ${last.story} </div></a></li>
                    </c:forEach>
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
        /* 영상 종료시점 스케줄러 변수*/
        var playEndInterval;
        var playEndIntervalCount = 0;
        $('.uk-search').css('display','inline-block');

        function drawGridKind(rowCount, videos) {
            $('#tm-right-section').empty();
            var row = [];
            var pageMax = 1;
            row.push('<div class="uk-grid" data-uk-grid-margin>');
            $.each(videos, function(i) {
                row.push('<div class="video-row uk-width-large-1-4 uk-width-medium-1-3 uk-row-first">');
                row.push('    <div class="uk-overlay uk-overlay-hover">');
                row.push('        <img class="video-thumbnail" src="${pageContext.request.contextPath}'+this.file_path + 'thumbnail/' + this.thumbnail+'" alt="Image" />');
                row.push('        <div data-video-seq="'+this.video_seq+'" data-movie-file="'+this.file_path+this.file_name+'" class="uk-overlay-panel uk-overlay-fade uk-overlay-background uk-overlay-icon video_play"></div>');                row.push('    </div>');
                row.push('    <div class="uk-panel" >');
                row.push('        <h5 class="uk-panel-title video-title">'+this.title3+'</h5>');
                row.push('        <p>');
                row.push('            <span class="rating">');
                row.push('                <i class="uk-icon-star"></i>');
                row.push('                <i class="uk-icon-star"></i>');
                row.push('                <i class="uk-icon-star"></i>');
                row.push('                <i class="uk-icon-star"></i>');
                row.push('                <i class="uk-icon-star"></i>');
                row.push('            </span>');
                row.push('            <span class="video-start-date" class="uk-float-right">'+this.videoKindEntity.start_date.substr(0, 4)+'</span>');
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

                if((i+1) == Object.keys(videos).length) {
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


        var videos = JSON.parse('${json_videos}');
        <%--var favourite = JSON.parse('${json_video_favourite}');--%>

        function draw(jsonKind) {
            drawGridKind(20, jsonKind);
        }

        draw(videos);


        $('#category li:not(#genre, #featured)').click(function(e) {
            var sortVideo = new Array();
            var genre = $(this).find('a').text();

            $('.uk-nav li').removeClass('uk-active');
            $(this).addClass('uk-active');
            if($(this).attr('id') != 'all') {
                $.each(videos, function() {
                    if(this.genre.indexOf(genre) > -1 ) {
                        sortVideo.push(this);
                    }
                })
                draw(sortVideo);
            } else if($(this).attr('id') == 'all') {
                draw(videos);
            }
        })

        var oldSearch = "";
        $('.uk-search-field').keyup(function() {
            var sortVideo = [];
            var search = $(this).val();

            if(search != oldSearch) {

                if(search != "" && search != null) {
                    $.each(videos, function() {
                        var title3 = this.title1 + " "+ this.title2;
                        if(title3.indexOf(search) > -1 ) {
                            sortVideo.push(this);
                        }
                    })

                    draw(sortVideo);
                } else {
                    draw(videos);
                }
            }
            oldSearch = search;
        });

        $('.video_play').click(function() {
            var movie_file = $(this).attr('data-movie-file');
            var video_seq = $(this).attr('data-video-seq');
            /* video-heart css 제거*/
            $('#video-heart i').removeClass('uk-icon-heart').addClass('uk-icon-heart-o');

            var favourites = JSON.parse('${json_favorite}');
            $.each(favourites, function() {
                if(this.video_seq == video_seq) {
                    $('#video-heart i').removeClass('uk-icon-heart-o').addClass('uk-icon-heart');
                }
            })

            var video = '<video controls="controls" class="mv-video" data-video-seq="'+video_seq+'"  autoplay="autoplay">';
            video += '<source src="${pageContext.request.contextPath}'+movie_file+'" type="video/mp4"/>';
            video += '</video>'


            $('#video').prepend(video);

            $('.mv-video').on('pause', function() {
                localStorage.setItem(video_seq, $(this)[0].currentTime);
            });



            /* 이전 재생시점 로드 */
            if(localStorage.getItem(video_seq) != null) {
                $('.mv-video')[0].currentTime = localStorage.getItem(video_seq);
            }

            $('.uk-navbar').css('opacity', 0.1);
            $('#video').show(500);
            $('#main-container').hide();

        })

        /* 영상 보는중 뒤로가기시*/
        $(document).on('click', '#video-cancel', function() {
            var currentTime = $('.mv-video')[0].currentTime;
            var video_seq = $('.mv-video').attr('data-video-seq');
            localStorage.setItem(video_seq, currentTime);
            $('.uk-container').css('opacity', 1);
            $('.uk-navbar').css('opacity', 1);
            $('#video').hide();
            $('.mv-video')[0].pause();
            $('#main-container').show();
        })

        /*플레이리스트 추가*/
        $(document).on('click', '#video-heart', function() {
            var video_seq = $('.mv-video').attr('data-video-seq');
            $.ajax({
                url:'${pageContext.request.contextPath}/video_favourite/'+video_seq,
                type:'post',
                success:function(data) {
                    if(data == 1) {
                        $('#video-heart i').removeClass('uk-icon-heart-o').addClass('uk-icon-heart');
                    } else {
                        $('#video-heart i').removeClass('uk-icon-heart').addClass('uk-icon-heart-o');
                    }
                }, error:function(xhr, status, error) {
                    alert(error);
                }
            })
        })
    })
</script>