<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script type="text/javascript" charset="utf-8"
	src="assets/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="assets/ueditor/ueditor.all.min.js">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="assets/ueditor/lang/zh-cn/zh-cn.js"></script>
	<div class="btn-group">
    <button type="button" onclick="addAboutUs()" class="btn btn-primary">
        <i class="fa fa-pencil"></i> 保存
    </button>
</div>
<div class="widget">
    <div class="widget-header  with-footer">
        <span class="widget-caption">
            <i class="fa fa-list"></i>
            关于我们</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <div id="horizontal-form">
                <form class="form-horizontal" method="post" id="newsDetailsForm">
                    <input type="hidden" name="id" value="${news.id}">
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">标题</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="title" name="title" value="${news.title}" placeholder="标题" required>
                        </div>
                    </div>
                     <%--  <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">作者</label>
                        <div class="col-sm-9">
                            <input class="form-control" value="${user.name}" placeholder="作者" required>
                        </div>
                    </div> --%>
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
<script>
    function addAboutUs() {
            $.ajax({
                method: 'post',
                url: 'news/news/detail.htm',
                data:new FormData($("#newsDetailsForm")[0]),
                cache: false,
                contentType: false,
                processData: false,
                success: function () {
                    layer.msg("保存成功");
                }
            });
    }
</script>