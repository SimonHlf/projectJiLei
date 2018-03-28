<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget">
    <div class="widget-header  with-footer">
        <span class="widget-caption">
            <i class="fa fa-list"></i>
            单页详情</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <div id="horizontal-form">
                <form class="form-horizontal" method="post" id="newsDetailsForm">
                    <input type="hidden" name="id" value="${news.id}">
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">标题</label>
                        <div class="col-sm-9">
                            <input class="form-control" readOnly id="title" name="title" value="${news.title}" placeholder="标题" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">分类</label>
                        <div class="col-sm-9">
                            <v:newsType vid="${news.type}" id="type"></v:newsType>
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
         <a class="btn btn-info" onclick="ret()">返回</a>
        <script>//由于控制的内容在<div class="widget-body">，所以将script标签放在这里，不然无法出现
        $(function(){
            var height = ($(document).height() - 430);
            UE.delEditor('content');UE.getEditor('content',{
                initialFrameHeight : height,
                autoHeightEnabled: false
            });
        })
        function ret(){
        	$.ajax({
        		method:'post',
        		url:'news/news/list.htm',
        		data:{
        			attr0:1
        		},
        		success:function(data){
        			loadHtml(data);
        		}
        	})
        }
        </script>
    </div>
</div>
