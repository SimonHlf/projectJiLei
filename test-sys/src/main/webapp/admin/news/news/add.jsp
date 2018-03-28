<%@page pageEncoding="utf-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget">
    <div class="widget-header  with-footer">
        <span class="widget-caption">
            <i class="fa fa-list"></i>添加新闻</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <div id="horizontal-form">
                <form class="form-horizontal" method="post" id="addNewsForm" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">标题</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="title" name="title" placeholder="标题" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">分类</label>
                        <div class="col-sm-9">
                            <v:newsType vid="0" id="type"></v:newsType>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-11">
                            <textarea id="container" name="content"></textarea>
                        </div>
                    </div>
                </form>
                <a class="btn btn-info" onclick="add()">确认</a> <a
				class="btn btn-default"
				onclick="ajaxLoad('news/news/list.htm?attr0=0','信息列表')">返回</a>
            </div>
        </div>
        <script>//由于控制的内容在<div class="widget-body">，所以将script标签放在这里，不然无法出现
        $(function() {
            var height = ($(document).height() - 430);
            UE.getEditor('container', {
                initialFrameHeight: height,
                autoHeightEnabled: false
            });
        });
        
        function add(){
        	   var result = required("addNewsForm");
		        if(result){//提交表单
		            $.ajax({
		                method:'post',
		                url:'news/news/add.htm?attr0=0',
		                cache:false,
		                contentType:false,
		                processData:false,
		                data:new FormData($("#addNewsForm")[0]),
		                success:function (data) {
		                    loadHtml(data);
		                    layer.msg("发布信息完成");
		                    layer.closeAll();
		                }
		            })
		        }
        }
        </script>
    </div>
</div>