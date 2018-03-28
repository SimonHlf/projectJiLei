<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget">
    <div class="widget-header  with-footer">
        <span class="widget-caption">
            <i class="fa fa-list"></i>
            修改新闻</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <div id="horizontal-form">
                <form class="form-horizontal" method="post" id="editNewsForm">
                    <input type="hidden" name="id" value="${news.id}">
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">标题</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="title" name="title" value="${news.title}" placeholder="标题" required>
                              <input class="form-control" type="hidden" id="attr3" name="attr3" value="${news.attr3}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-11">
                            <textarea name="content" id="content">${news.content}</textarea>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script>//由于控制的内容在<div class="widget-body">，所以将script标签放在这里，不然无法出现
        $(function(){
            var height = ($(document).height() - 430);
            UE.delEditor('content');UE.getEditor('content',{
                initialFrameHeight : height,
                autoHeightEnabled: false
            });
        })
        </script>
    </div>
</div>
