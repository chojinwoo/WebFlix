<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bangae11
  Date: 2016-06-21
  Time: 오후 7:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .progress-panel {
        position: absolute;
        width: 100%;
        height: 100%;
        text-align: center;
        top: 20%;
        z-index:3000;
    }

    .progress {
        width:30%;
    }
</style>
<div class="uk-overflow-container" style="padding:50px 50px 0px 50px;">
    <table class="uk-table">
        <thead>
            <tr>
                <th>KEY</th>
                <th>타이틀명</th>
                <th>시즌명</th>
                <th>커버 파일명</th>
                <th>배우</th>
                <th>사용여부</th>
                <th>삭제</th>
            </tr>
        </thead>

        <c:set var="tbodyIdx" value="1"/>
        <c:forEach var="videoKind" items="${videoKinds}" varStatus="idx">
            <c:if test="${idx.count % 8 == 1}">
                <c:if test="${tbodyIdx == 1}">
                    <tbody class="tbody-${tbodyIdx}">
                </c:if>
                <c:if test="${tbodyIdx != 1}">
                    <tbody class="tbody-${tbodyIdx}" style="display:none;">
                </c:if>
            </c:if>
            <tr>
                <input type="hidden" id="video_kind_seq" value="${videoKind.videoKindSeq}">
                <td class="uk-text-center">${videoKind.videoKindSeq}</td>
                <td>${videoKind.title1}</td>
                <td class="uk-text-center">${videoKind.title2}</td>
                <td>${videoKind.coverName}</td>
                <td>${videoKind.actor}</td>
                <td class="uk-text-center"><input type="checkbox" <c:if test="${videoKind.flag}">checked="checked"</c:if> disabled="disabled" ></td>
                <td class="uk-text-center">
                    <button type="button" class="thumbnail_btn uk-button uk-button-primary">썸네일</button>
                    <button type="button" class="delete_btn uk-button uk-button-danger">삭제</button>
                </td>
            </tr>
            <c:if test="${idx.count % 8 == 0 || idx.last}">
            </tbody>
                <c:if test="${!idx.last}">
                <c:set var="tbodyIdx"  value="${tbodyIdx+1}"/>
                </c:if>
            </c:if>
        </c:forEach>
        <tbody class="tbody-paging">
            <tr>
                <td rowspan="2" colspan="6">
                    <div class="uk-margin-large-top uk-margin-bottom">
                        <ul class="uk-pagination" data-uk-pagination="{items:${tbodyIdx}, itemsOnPage:1}">
                        </ul>
                    </div>
                </td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="7">
                    <button type="button" id="file_upload" name="file_upload" class="uk-button uk-align-right" style="margin-right:10px;" data-uk-modal="{target:'#upload-modal',bgclose:false}">파일업로드</button>
                </td>
            </tr>
        </tfoot>
    </table>
</div>
<div class="uk-modal" id="upload-modal">
    <div class="uk-modal-dialog">
        <button type="button" class="uk-modal-close uk-close"></button>
        <div class="uk-modal-header"><h2>카테고리등록</h2></div>
        <p>
        <form id="movieUploadForm" enctype="multipart/form-data">
            <div class="uk-form">
                <label class="uk-form-label">카테고리명</label>
                <input type="text" class="uk-width-1-1" name="title1" placeholder="ex) 히어로즈"/>
            </div>
            <div class="uk-form">
                <label class="uk-form-label">시즌</label>
                <input type="text" class="uk-width-1-1" name="title2" placeholder="ex) 시즌1 영화는 제외"/>
            </div>
            <div class="uk-form">
                <label class="uk-form-label">장르</label>
                <input type="text" class="uk-width-1-1" name="genre" placeholder="ex) 스릴러, 영화, 공포"/>
            </div>
            <div class="uk-form">
                <label class="uk-form-label">배우</label>
                <input type="text" class="uk-width-1-1" name="actor" placeholder="ex) 곽도원, 황정민, 쿠니무라준"/>
            </div>
            <div class="uk-form">
                <label class="uk-form-label">제작국가</label>
                <input type="text" class="uk-width-1-1" name="country"/>
            </div>
            <div class="uk-form">
                <label class="uk-form-label">평점</label>
                <input type="text" class="uk-width-1-1" name="star" placeholder="ex) 5.0"/>
            </div>
            <div class="uk-form">
                <label class="uk-form-label">제작년도</label>
                <input type="text" class="uk-width-1-1" name="start_date" placeholder="ex) 2015.05.12"/>
            </div>
            <div class="uk-form">
                <label class="uk-form-label">커버경로</label>
                <input type="text" class="uk-width-1-1" name="coverPath" placeholder="ex) GokSeong/cover/"/>
            </div>
            <div class="uk-form">
                <label class="uk-form-label">사용여부</label>
                <input type="checkbox" class="uk-width-1-1" id="flag_temp" name="flag_temp"/>
                <input type="hidden" id="flag" name="flag" value="false">
            </div>
            <div id="upload-drop" class="uk-placeholder uk-text-center">
                <i class="uk-icon-cloud-upload uk-icon-medium uk-text-muted uk-margin-small-right"></i> 커버사진 업로드 : <a class="uk-form-file">파일선택<input id="upload-select" name="file" type="file" accept="image/*"></a>.
            </div>
            <div id="progressbar" class="uk-progress uk-hidden">
                <div class="uk-progress-bar" style="width: 0%;">0%</div>
            </div>
        </form>
        </p>
        <div class="uk-modal-footer uk-text-right">
            <button type="button" class="uk-button uk-button-danger" onclick="UIkit.modal('#upload-modal').hide();">취소</button>
            <button type="button" id="btn-upload" class="uk-button uk-button-primary">저장</button>
        </div>
    </div>
</div>
<form id="hiddenForm"></form>
<form id="uploadForm" enctype="multipart/form-data">
    <input type="file" id="file" name="file" style="display:none; position:absolute; z-index:-1">
</form>
    <script>
        $('#flag_temp').click(function() {
            $('#flag').val($(this).prop('checked'));
        })

        $('#upload-select').change(function() {
            $('#movieUploadForm .uk-grid').remove();
            for(var i=0; i<$(this)[0].files.length; i++) {
                var file = $(this)[0].files[i];
                var name = file.name;
                var size = file.size;
                var html = [];
                html.push('<div class="uk-grid">');
                html.push('<div class="uk-width-1-2">'+name+'</div>');
                html.push('<div class="uk-width-1-2 uk-text-right">'+size+'</div>');
                html.push('</div>');
                $('#movieUploadForm').append(html.join(''));
            }
        })

        $('#btn-upload').click(function() {
            var progressbar = $("#progressbar");
            var formData = new FormData($('#movieUploadForm')[0]);
            var bar         = progressbar.find('.uk-progress-bar');
            var star = $('input[name=star]').val();
            var coverPath = $('input[name=coverPath]').val();
            var flag = true;
            if(Number(star) > 5) {
                alert("평점은 5이하로 작성해주세요");
                flag = false;
            } else if(coverPath.substring(coverPath.length-1, coverPath.length) != '/') {
                alert("커버 경로는 마지막을 / 로 작성되어야합니다.");
                flag = false;
            }

            if(flag) {
                $.ajax({
                    url:'${pageContext.request.contextPath}/admin/kind_up',
                    data:formData,
                    type:'post',
                    processData:false,
                    contentType:false,
                    beforeSend:function(xhr, setting) {
                        bar.css("width", "0%").text("0%");
                        progressbar.removeClass("uk-hidden");
                    }, error:function(xhr, status, error) {
                        alert(error)
                    }, success: function(data) {
                        bar.css("width", "100%").text("100%");

                        setTimeout(function(){
                            progressbar.addClass("uk-hidden");
                        }, 250);

                        $('#movieUploadForm').find('input').val("");
                        alert(data)
                        window.location.reload();
                    }, xhr: function () {
                        var xhr = new window.XMLHttpRequest();
                        console.log(1);
                        bar.css("width", '0%').text('0%');
                        xhr.upload.addEventListener("progress", function (evt) {
                            var percentComplete = evt.loaded / evt.total;
                            bar.css("width", percentComplete * 100 + '%').text(percentComplete * 100 + '%');
                            if (percentComplete === 1) {
                                progressbar.addClass("uk-hidden");
                            }
                        }, false);

                        xhr.addEventListener("progress", function (evt) {
                            if (evt.lengthComputable) {
                                var percentComplete = evt.loaded / evt.total;
                                bar.css("width", percentComplete * 100 + '%').text(percentComplete * 100 + '%');
                            }
                        }, false);
                        return xhr;
                    }
                })
            }
        })


        $(document).on('click', '#prev:not(.uk-disabled)',function() {
            var firstPaging = $('#pageFirst span').text();
            var lastPaging = $('#pagingMax span').text();
            var page = Number(firstPaging) - 1;

            if(lastPaging == '${tbodyIdx}') {
                $('#next').addClass('uk-disabled')
            }

            if(lastPaging < '${tbodyIdx}') {
                $('#next').removeClass('uk-disabled')
            }

            if(firstPaging > 1) {
                var target = $('.uk-pagination li:not(#prev, #next, #empty)');
                $(target).each(function() {
                    console.log(page);
                    $(this).find('span').text(page);
                    page++;
                })
            }
        })

        $('.thumbnail_btn').click(function() {
            var _this = $(this).closest('tr');
            if(confirm("썸네일을 생성하시겠습니까?")) {
                $.ajax({
                    url:'${pageContext.request.contextPath}/admin/kind_thumbnail/'+_this.find('#video_kind_seq').val(),
                    type:'post',
                    success:function(data) {
                        alert(data);
                    }, error:function(xhr, status, error) {
                        alert(error);
                    }
                })
            }
        });

        $('.delete_btn').click(function() {
            var _this = $(this).closest('tr');
            if(confirm("삭제하시겠습니까?")){
                $.ajax({
                    url:'${pageContext.request.contextPath}/admin/kind_delete/'+_this.find('#video_kind_seq').val(),
                    type:'post',
                    success:function(data) {
                        alert(data);
                        _this.remove();
                    }, error:function(xhr, status, error) {
                        alert(error)
                    }
                })
            }
        })

        $('.uk-pagination').on('select.uk.pagination', function(e, pageIndex){
            $('.uk-table tbody:not(.tbody-paging)').hide();
            $('.tbody-'+(Number(pageIndex)+1)).show();
        });
    </script>