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
                <th>제목</th>
                <th>장르</th>
                <th>파일명</th>
                <th>반영일</th>
                <th>등록일</th>
                <th>삭제</th>
            </tr>
        </thead>

        <c:set var="tbodyIdx" value="1"/>
        <c:forEach var="video" items="${videos}" varStatus="idx">
            <c:if test="${idx.count % 8 == 1}">
                <c:if test="${tbodyIdx == 1}">
                    <tbody class="tbody-${tbodyIdx}">
                </c:if>
                <c:if test="${tbodyIdx != 1}">
                    <tbody class="tbody-${tbodyIdx}" style="display:none;">
                </c:if>
            </c:if>
            <tr>
                <input type="hidden" id="video_seq" value="${video.video_seq}">
                <td>${video.title3}</td>
                <td>${video.videoKindEntity.genre}</td>
                <td>${video.file_name}</td>
                <td class="uk-text-center">${video.videoKindEntity.start_date}</td>
                <td class="uk-text-center">${video.reg_date}</td>
                <td class="uk-text-center"><button type="button" class="delete_btn uk-button uk-button-danger">삭제</button></td>
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
                <td colspan="6">
                    <button type="button" id="excel_temp" class="uk-button uk-button-primary uk-align-right">샘플다운</button>
                    <button type="button" id="excel_upload" class="uk-button uk-button-success uk-align-right" style="margin-right:10px;">엑셀업로드</button>
                    <button type="button" id="file_upload" name="file_upload" class="uk-button uk-align-right" style="margin-right:10px;" data-uk-modal="{target:'#upload-modal',bgclose:false}">파일업로드</button>
                </td>
            </tr>
        </tfoot>
    </table>
</div>
<div class="uk-modal" id="upload-modal">
    <div class="uk-modal-dialog">
        <button type="button" class="uk-modal-close uk-close"></button>
        <div class="uk-modal-header"><h2>영화업로드</h2></div>
        <p>
        <form id="movieUploadForm" enctype="multipart/form-data">
            <div class="uk-form">
                <label class="uk-form-label">카테고리</label>
                <%--<input type="text" class="uk-width-1-1" name="filePath"/>--%>
                <select name="video_kind_seq" class="uk-width-1-1">
                    <c:forEach items="${videoKinds}" var="videoKind">
                        <option value="${videoKind.videoKindSeq}">${videoKind.title1}${videoKind.title2}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="uk-form">
                <label class="uk-form-label">제목</label>
                <input type="text" class="uk-width-1-1" name="title3" placeholder="다중업로드시 /// 로  구분해주세요."/>
            </div>
            <div class="uk-form">
                <label class="uk-form-label">줄거리</label>
                <textarea class="uk-width-1-1" name="story" rows="4" style="resize:none;" placeholder="다중업로드시 /// 로  구분해주세요."></textarea>
            </div>
            <div class="uk-form">
            <div id="upload-drop" class="uk-placeholder uk-text-center">
                <i class="uk-icon-cloud-upload uk-icon-medium uk-text-muted uk-margin-small-right"></i> 영화업로드 : <a class="uk-form-file">파일선택<input id="upload-select" name="files" type="file" multiple="multiple" accept="video/*"></a>.
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
            $.ajax({
                url:'${pageContext.request.contextPath}/admin/video_up',
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
        })


        $('#excel_upload').click(function() {
            $('#file').trigger('click');
        })

        $('#file').change(function() {
            var form = $('#uploadForm')[0];
            var formData = new FormData(form)
            $.ajax({
                url:'${pageContext.request.contextPath}/admin/video_excel_up',
                type:'post',
                processData:false,
                contentType:false,
                data:formData,
                success:function(data) {
                    alert(data);
                }, error:function(xhr, status, error) {
                    alert(error);
                }
            })
        })

        $('#excel_temp').click(function() {
            $('#hiddenForm').attr({
                'action':'${pageContext.request.contextPath}/admin/video_excel_temp',
                'method':'post'
            }).submit();
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

        $('.uk-pagination').on('select.uk.pagination', function(e, pageIndex){
            $('.uk-table tbody:not(.tbody-paging)').hide();
            $('.tbody-'+(Number(pageIndex)+1)).show();
        });

        $(document).on('click', '.delete_btn', function() {
            var _this = $(this).closest('tr');
            var video_seq = _this.find('#video_seq').val();
            if(confirm("삭제 하시겠습니까?")){
                $.ajax({
                    url:'${pageContext.request.contextPath}/admin/video_delete/'+video_seq,
                    type:'post',
                    success:function(data) {
                        alert(data);
                        _this.remove();
                    }, error:function(xhr, status, error) {
                        alert(error);
                    }
                })
            }
        })
    </script>