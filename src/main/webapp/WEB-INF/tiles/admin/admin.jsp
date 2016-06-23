<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bangae11
  Date: 2016-06-21
  Time: 오후 7:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <td>${video.title3}</td>
                <td>${video.genre}</td>
                <td>${video.file_name}</td>
                <td>${video.start_date}</td>
                <td>${video.reg_date}</td>
                <td><button type="button" class="uk-button uk-button-danger uk-align-right">삭제</button></td>
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
                        <ul class="uk-pagination">
                            <li id="prev" class="uk-disabled"><a href="#"><i class="uk-icon-angle-double-left"></i></a></li>
                            <c:forEach begin="1" end="${tbodyIdx}" varStatus="idx">
                                <c:if test="${idx.count < 5 }">
                                    <c:if test="${idx.first}">
                                        <li id="pageFirst" class="uk-active" data-paging="${idx.count}"><span style="cursor:pointer;">${idx.count}</span></li>
                                    </c:if>
                                    <c:if test="${!idx.first}">
                                        <li data-paging="${idx.count}"><span href="#" style="cursor:pointer;">${idx.count}</span></li>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                            <c:if test="${tbodyIdx > 4}">
                                <li id="empty"><span>...</span></li>
                                <li id="pagingMax" data-paging="${tbodyIdx}"><span style="cursor:pointer;">${tbodyIdx}</span></li>
                            </c:if>
                            <li id="next"><a href="#"><i class="uk-icon-angle-double-right"></i></a></li>
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
                </td>
            </tr>
        </tfoot>
    </table>
</div>

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

        $(document).on('click','#next:not(.uk-disabled)',function() {
            var firstPaging = $('#pageFirst span').text();
            var lastPaging = $('#pagingMax span').text();
            var page = Number(firstPaging) + 1;
            if(lastPaging < '${tbodyIdx}') {
                var target = $('.uk-pagination li:not(#prev, #next, #empty)');
                $(target).each(function() {
                    $(this).find('span').text(page);
                    page++;
                })
            }

            firstPaging = $('#pageFirst span').text();
            if(firstPaging > 1) {
                $('#prev').removeClass('uk-disabled')
            }
            if(firstPaging == 1) {
                $('#prev').addClass('uk-disabled')
            }
        })

        $('.uk-pagination li:not(#prev, #next, #empty)').click(function() {
            var page = $(this).attr('data-paging');
            $('.uk-table tbody:not(.tbody-paging)').hide();
            $('.tbody-'+page).show();
            var target = $('.uk-pagination li:not(#prev, #next, #empty)');
            if('${tbodyIdx}' > target.length) {
                if($('#pagingMax').attr('data-paging') != '${tbodyIdx}') {
                    $(target).each(function() {
                        $(this).find('span').text(page);
                        page++;
                    })
                }
            } else {
                $('.uk-pagination li:not(#prev, #next, #empty)').removeClass('uk-active');
                $(this).addClass('uk-active');
            }
        })
    </script>