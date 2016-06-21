<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bangae11
  Date: 2016-06-21
  Time: 오후 7:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="uk-container uk-container-center uk-margin-large-top uk-margin-large-bottom">
    <div class="row" style="padding-bottom:30px;">
        <h2 class="title">관리자</h2>
    </div>
    <c:forEach begin="1" end="10" var="idx">
        <div class="row" style="padding-top:10px; padding-bottom:10px;">
            <form>
                <div class="col-xs-1">1</div>
                <div class="col-xs-2">2</div>
                <div class="col-xs-2">3</div>
                <div class="col-xs-2">3</div>
                <div class="col-xs-2">3</div>
                <div class="col-xs-1"><button class="btn btn-danger btn-sm" type="button">삭제</button></div>
            </form>
        </div>
    </c:forEach>
    <div class="row pull-right" style="padding-top:30px;">
        <button id="excel_temp" type="button" class="btn btn-primary btn-sm">엑섹양식</button>
        <button id="excel_upload" type="button" class="btn btn-success btn-sm">엑셀업로드</button>
    </div>

    <form id="hiddenForm"></form>
    <form id="uploadForm" enctype="multipart/form-data">
        <input type="file" name="file" id="file" style="display:none;"/>
    </form>

    <script>
        $('#excel_upload').click(function() {
            $('#file').trigger('click');
        })

        $('#file').change(function() {
            var form = $('#uploadForm')[0];
            var formData = new FormData(form)
            $.ajax({
                url:'/admin/excel_up',
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
                'action':'/admin/excel_temp',
                'method':'post'
            }).submit();
        })
    </script>
</div>