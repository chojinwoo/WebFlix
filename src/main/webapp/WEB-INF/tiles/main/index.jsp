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
<%-- next video view --%>
<div id="next-container" class="mv-container">
    <div class="uk-container">
        <div class="uk-grid">
            <div class="uk-width-1-1">
                <h2 class="nc-title"></h2>
            </div>
            <div class="uk-width-1-1">
                <h3>줄거리</h3>
                <p class="nc-story"></p>
            </div>
            <div class="uk-width-1-1">
                <p>출연배우 : <span class="nc-actor"></span></p>
            </div>
            <div class="uk-width-1-1">
                <p>제작국가 : <span class="nc-country"></span></p>
            </div>
            </div>
            <div class="uk-width-1-1">
                <p>장르 : <span class="nc-genre"></span></p>
            </div>
            <div class="uk-width-1-1">
                <p>평점 : <span class="nc-star"></span></p>
            </div>
            <div class="uk-width-1-1" style="position: absolute;bottom: 10px;text-align: right;right: 10px;">
                <div class="nc-timer-panel">
                    <label>
                        <h4><span class="nc-timer">5</span>초후 자동재생 됩니다.</h4>
                    </label>
                </div>
                <div>
                    <i class="uk-icon-play-circle-o nc-play-icon"></i>
                    <img class="nc-play-img" src="">
                </div>
            </div>
        </div>
    </div>
</div>
<%--video view--%>
<div id="video" class="mv-container">
    <div id="video-cancel" class="mv-cancel"><i class="uk-icon-arrow-circle-left uk-icon-large"></i></div>
</div>
<!--     start Main Section   -->
<div id="main-container" class="uk-container uk-container-center uk-margin-large-top uk-margin-large-bottom">
    <div id="playList" class="uk-grid">
        <div class="uk-width-medium-2-3">
            <div style="height:90%">
                <ul id="subnav-pill-content" class="uk-switcher" id="info-switcher">
                    <li class="uk-active" id="playList-info">
                        <h2 id="playList-info-title3"></h2>
                        <p id="playList-info-story"></p>
                        <p>출연배우 : <span id="playList-info-actor"></span></p>
                        <p>제작국가 : <span id="playList-info-genre"></span></p>
                        <p>평점 : <span id="playList-info-star"></span></p>
                    </li>
                    <li class="slide-append-target">

                    </li>
                </ul>
            </div>
            <div style="height:10%; padding-bottom:10px;">
                <ul id="playList-nav" class="uk-subnav uk-subnav-pill" data-uk-switcher="{connect:'#subnav-pill-content', swiping:false}">
                    <li class="uk-active" id="movieInfo"><a href="#">영화정보</a></li>
                </ul>
            </div>
        </div>
        <div  class="uk-width-medium-1-3">
            <img id="playList-cover" src="" style="width:100%; height:400px;">
        </div>
    </div>
    <div class="uk-grid">
        <div id="tm-left-section" class="uk-width-medium-3-10 uk-width-large-2-10 uk    -hidden-small">
            <div class="uk-panel">
                <ul class="uk-nav  uk-nav-side uk-nav-parent-icon uk-margin-bottom" data-uk-nav="">
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
                            <li><a href="#documentary">다큐</a> </li>
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
        $('.uk-search').css('display','inline-block');

        function drawGridKind(rowCount, video_kind) {
            $('#tm-right-section').empty();
            var row = [];
            var pageMax = 1;
            row.push('<div class="uk-grid" data-uk-grid-margin>');
            $.each(video_kind, function(i) {
                row.push('<div class="video-row uk-width-large-1-4 uk-width-medium-1-3 uk-row-first" data-genre="'+this.genre+'" data-title3="'+this.title1+ " " +this.title2+'">');
                row.push('    <div class="uk-overlay uk-overlay-hover">');
                row.push('        <img class="video-thumbnail" src="${pageContext.request.contextPath}'+this.coverPath + this.coverName+'" alt="Image" />');
                row.push('        <div class="uk-overlay-panel uk-overlay-fade uk-overlay-background  uk-overlay-icon"></div>');
                row.push('        <a class="uk-position-cover video-media" data-kind-seq="'+this.videoKindSeq+'"></a>');
                row.push('    </div>');
                row.push('    <div class="uk-panel" >');
                row.push('        <h5 class="uk-panel-title video-title">'+this.title1+" "+this.title2+'</h5>');
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

        function draw(jsonKind) {
            drawGridKind(20, jsonKind);
        }

        draw(video_kind);


        $('.uk-nav li:not(#genre, #featured)').click(function(e) {
            var sortVideo = new Array();
            var genre = $(this).find('a').text();

            $('.uk-nav li').removeClass('uk-active');
            $(this).addClass('uk-active');
            if($(this).attr('id') != 'all') {
                $.each(video_kind, function() {
                    if(this.genre.indexOf(genre) > -1 ) {
                        sortVideo.push(this);
                    }
                })
                draw(sortVideo);
            } else if($(this).attr('id') == 'all') {
                draw(video_kind);
            }
        })

        var oldSearch = "";
        $('.uk-search-field').keyup(function() {
            var sortVideo = [];
            var search = $(this).val();

            if(search != oldSearch) {

                if(search != "" && search != null) {
                    $.each(video_kind, function() {
                        var title3 = this.title1 + " "+ this.title2;
                        if(title3.indexOf(search) > -1 ) {
                            sortVideo.push(this);
                        }
                    })

                    draw(sortVideo);
                } else {
                    draw(video_kind);
                }
            }
            oldSearch = search;
        });


        $(document).on('click', '#playList-info-play', function() {
            var _this = $(this);
            var video_seq = $(this).attr('data-video-seq');
            var movie_file = $(this).attr('data-movie-file');
            var movie_type = $(this).attr('data-movie-type');
            var video_kind_seq = $(this).attr('data-video-kind-seq');
            var video = '<video controls="controls" class="mv-video" data-video-seq="'+video_seq+'"  autoplay="autoplay">';
            video += '<source src="${pageContext.request.contextPath}'+movie_file+'" type="video/mp4"/>';
            video += '</video>'


            $('.mv-video').remove();
            $('#video').prepend(video);

            localStorage.setItem(video_kind_seq, video_seq);

            /* 재생종료시*/
            $('.mv-video').on('ended', function() {
                localStorage.removeItem(video_seq);
                var next_video_seq = _this.next().attr('data-video-seq');

                if(_this.next().attr('id') == 'playList-info-play') {
                    /* 다음 재생 정보 받아 오기 */
                    $.ajax({
                        url:'${pageContext.request.contextPath}/videoFindOne/'+next_video_seq,
                        type:'post',
                        success:function(data) {
                            $('#next-container').fadeIn(500);
                            $('#main-container').hide();
                            $('#video').hide();

                            /* 데이터 주입 */
                            $('.nc-title').text(data.title3);
                            $('.nc-story').text(data.story);
                            $('.nc-actor').text(data.videoKindEntity.actor);
                            $('.nc-genre').text(data.videoKindEntity.genre);
                            $('.nc-country').text(data.videoKindEntity.country);
                            $('.nc-star').text(data.videoKindEntity.star);
                            $('.nc-play-img').attr('src', '${pageContext.request.contextPath}'+data.file_path+'thumbnail/'+data.thumbnail);

                            var timerCount = 5;
                            function timerInterval() {
                                if(timerCount > 0) {
                                    $('.nc-timer').text(timerCount);
                                } else {
                                    clearInterval(inter);
                                    _this.next().trigger('click');
                                    $('#next-container').fadeOut(500);
                                }
                                timerCount--;
                            }
                            var inter = setInterval(timerInterval, 1000);

                        }, error:function(xhr, status, error) {
                            alert(error);
                        }
                    })

                }

            });

            /* 재생정지시 */
            $('.mv-video').on('pause', function() {
                localStorage.setItem(video_seq, $(this)[0].currentTime);
            });

            /* 이전 재생시점 로드 */
            if(localStorage.getItem(video_seq) != null) {
                $('.mv-video')[0].currentTime = localStorage.getItem(video_seq);
            }

            if(movie_type == 1) {
                $('#movieInfo').trigger('click');
            }

            $('.uk-navbar').css('opacity', 0.1);
            $('#video').show();
            $('#main-container').hide();
        })

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

        $(document).on('click','.video-media', function(e) {
            $('#playList').hide();
            var video_kind_seq = $(e.target).attr('data-kind-seq');
            $.ajax({
                url:"${pageContext.request.contextPath}/viewList/"+video_kind_seq,
                type:'post',
                dataType:'json',
                success:function(data) {
                    $('body, html').animate({scrollTop:0}, 500);

                    var _playList = $('#playList');
                    _playList.find('#playList-nav').find('#playList-info-play').closest('li').remove();
                    _playList.find('#playList-nav #videoList').remove();
                    _playList.find('.slide-main').remove();

                    if(data.length == 1) {

                        _playList.find('#playList-info-title3').text(data[0].title3);
                        _playList.find('#playList-info-story').text(data[0].story);
                        _playList.find('#playList-info-star').text(data[0].videoKindEntity.star);
                        _playList.find('#playList-info-genre').text(data[0].videoKindEntity.genre);
                        _playList.find('#playList-info-actor').text(data[0].videoKindEntity.actor);
                        _playList.find('#playList-cover').attr('src', '${pageContext.request.contextPath}'+data[0].videoKindEntity.coverPath+data[0].videoKindEntity.coverName);
                        _playList.find('#playList-nav').append('<li><a id="playList-info-play" data-movie-type="1" data-video-kind-seq="'+data[0].videoKindEntity.videoKindSeq+'" data-video-seq="'+data[0].video_seq+'" data-movie-file="'+data[0].file_path+data[0].file_name+'"><i class="uk-icon-play"></i> 재생</a></li>   ');
                        $('#video').css({
                            height:$(window).height()+'px'
                        })

                    } else {
                        var nav = '<li class="" id="videoList"><a href="#">회차정보</a></li>';

                        var flag = true;
                        $.each(data, function() {
                            var kind_seq = this.videoKindEntity.videoKindSeq;
                            if(this.video_seq == localStorage.getItem(kind_seq)) {
                                _playList.find('#playList-info-title3').text(this.title3);
                                _playList.find('#playList-info-story').text(this.story);
                                _playList.find('#playList-info-star').text(this.videoKindEntity.star);
                                _playList.find('#playList-info-genre').text(this.videoKindEntity.genre);
                                _playList.find('#playList-info-actor').text(this.videoKindEntity.actor);
                                _playList.find('#playList-cover').attr('src', '${pageContext.request.contextPath}'+this.videoKindEntity.coverPath+this.videoKindEntity.coverName);

                                _playList.find('#playList-nav').append(nav);
                                _playList.find('#playList-nav').append('<li><a id="playList-info-play" data-movie-type="1" data-video-kind-seq="'+this.videoKindEntity.videoKindSeq+'" data-video-seq="'+this.video_seq+'" data-movie-file="'+this.file_path+this.file_name+'"><i class="uk-icon-play"></i> 재생</a></li>   ');
                                flag = false;
                            }
                        })

                        if(flag) {
                            _playList.find('#playList-info-title3').text(data[0].title3);
                            _playList.find('#playList-info-story').text(data[0].story);
                            _playList.find('#playList-info-star').text(data[0].videoKindEntity.star);
                            _playList.find('#playList-info-genre').text(data[0].videoKindEntity.genre);
                            _playList.find('#playList-info-actor').text(data[0].videoKindEntity.actor);
                            _playList.find('#playList-cover').attr('src', '${pageContext.request.contextPath}'+data[0].videoKindEntity.coverPath+data[0].videoKindEntity.coverName);

                            _playList.find('#playList-nav').append(nav);
                            _playList.find('#playList-nav').append('<li><a id="playList-info-play" data-movie-type="1" data-video-kind-seq="'+data[0].videoKindEntity.videoKindSeq+'" data-video-seq="'+data[0].video_seq+'" data-movie-file="'+data[0].file_path+data[0].file_name+'"><i class="uk-icon-play"></i> 재생</a></li>   ');
                        }



                        var slide = [];
                        slide.push('<div class="uk-margin slide-main">')
                        slide.push('<div class="uk-slidenav-position uk-margin">')
                        slide.push('<ul id="playList-slide" class="uk-slideset uk-grid uk-flex-center uk-width-1-1-1 uk-grid-width-large-1-6 uk-grid-width-medium-1-4 uk-grid-width-small-1-2">')


                        $.each(data, function(i) {
                            if(i < 7) {
                                slide.push('<li class="uk-active slideView" id="playList-info-play" data-movie-type="2" data-video-kind-seq="'+data[0].videoKindEntity.videoKindSeq+'" data-video-seq="'+this.video_seq+'" data-movie-file="'+this.file_path+this.file_name+'"><img src="${pageContext.request.contextPath}'+this.file_path+'thumbnail/'+this.thumbnail+'" data-holder-rendered="true">'+this.title3+'</li>');
                            }else {
                                slide.push('<li style="display: none;" class="slideView" id="playList-info-play" data-movie-type="2" data-video-kind-seq="'+data[0].videoKindEntity.videoKindSeq+'" data-video-seq="'+this.video_seq+'"><img src="${pageContext.request.contextPath}'+this.file_path+'thumbnail/'+this.thumbnail+'" data-holder-rendered="true">'+this.title3+'</li>');
                            }
                        })
                        slide.push('</ul>');
                        slide.push('<a href="#" class="uk-slidenav uk-slidenav-previous" data-uk-slideset-item="previous"></a>');
                        slide.push('<a href="#" class="uk-slidenav uk-slidenav-next" data-uk-slideset-item="next"></a>');
                        slide.push('</div>');
                        slide.push('<ul class="uk-slideset-nav uk-dotnav uk-flex-center"><li data-uk-slideset-item="0" class="uk-active"><a></a></li><li data-uk-slideset-item="1" class=""><a></a></li></ul>');
                        slide.push('</div>');
                        _playList.find('.slide-append-target').append(slide.join(''));
                        var slideset = UIkit.slideset('.slide-main', {small: 1, medium: 2, large: 4, animation: "scale", duration:200});
                        $('#video').css({
                            height:$(window).height()+'px'
                        })
                    }


                }, error:function(xhr, status, error) {
                    console.log(error);
                }, complete:function() {
                    $('#playList').slideDown(800);
                    $('#movieInfo').trigger('click');
                }
            })
        })
    })
</script>