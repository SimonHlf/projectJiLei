<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="merchantDetailsForm">
                <input type="hidden" name="id" value="${merchantInfo.id}">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" readOnly id="merchantName" name="merchantName" value="${merchantInfo.merchantName}" placeholder="名称" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">电话</label>
                        <div class="col-sm-9">
                            <input class="form-control" readOnly id="attr0" name="attr0" value="${merchantInfo.attr0}" placeholder="电话" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">门店图片</label>
                        <div class="col-sm-9">
                            <input type="file" readOnly name="file"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">地址</label>
                        <div class="col-sm-9">
                            <input class="form-control" readOnly id="address" name="address" value="${merchantInfo.address}" placeholder="地址" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">经度</label>
                        <div class="col-sm-9">
                            <input class="form-control" readOnly id="longitude" name="longitude" value="${merchantInfo.longitude}" placeholder="经度">

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">纬度</label>
                        <div class="col-sm-9">
                            <input class="form-control" readOnly id="latitude" name="latitude" value="${merchantInfo.latitude}" placeholder="纬度">
                        </div>
                    </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">网址</label>
                        <div class="col-sm-9">
                            <input class="form-control" readOnly value="http://localhost:8080/windy/weChat/detail_.htm?shopid=${merchantInfo.id}">
                        </div>
                    </div>	
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">描述</label>
                        <div class="col-sm-9">
                            	<textarea id="container" name="remark">${merchantInfo.remark }</textarea>
                        </div>
                    </div>
                </div>
            </form>
        </div>
         <a class="btn btn-info" onclick="ajaxLoad('shop/merchant/list.htm','门店管理')">返回</a>
         <script>
			//由于控制的内容在<div class="widget-body">，所以将script标签放在这里，不然无法出现
			$(function() {
				var height = ($(document).height() - 430);
				UE.getEditor('container', {
					initialFrameHeight : height,
					autoHeightEnabled : false
				});
			});
			
		</script>
    </div>
</div>
