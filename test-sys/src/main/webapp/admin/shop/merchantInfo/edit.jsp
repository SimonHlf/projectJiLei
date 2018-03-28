<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editMerchantForm">
                <input type="hidden" name="id" value="${merchantInfo.id}">
                <div >
                 <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">门店分类</label>
                        <div class="col-sm-9">
                           <v:items type="merchantInfoType" id="merchantInfoType" name="attr3" value="${merchantInfo.attr3 }" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="merchantName" name="merchantName" value="${merchantInfo.merchantName}" placeholder="名称" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">电话</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="attr0" name="attr0" value="${merchantInfo.attr0}" placeholder="电话" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">门店图片</label>
                        <div class="col-sm-9">
                            <input type="file" id="imgs" name="file" multiple data-min-file-count="1"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">地址</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="address" name="address" value="${merchantInfo.address}" placeholder="地址" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">经度</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="longitude" name="longitude" value="${merchantInfo.longitude}" placeholder="经度">
                            <a href="http://lbs.qq.com/tool/getpoint/"
								target="_blank">获取位置坐标</a><!--http://api.map.baidu.com/lbsapi/getpoint/index.html  -->
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">纬度</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="latitude" name="latitude" value="${merchantInfo.latitude}" placeholder="纬度">
                        </div>
                    </div>
                       <div class="form-group">
                        <div class="col-sm-11">
                        <textarea id="content" name="remark">${merchantInfo.remark }</textarea>
                        </div>
                    </div>
                </div>
            </form>
        </div>
         <script>//由于控制的内容在<div class="widget-body">，所以将script标签放在这里，不然无法出现
        $(function(){
            var height = ($(document).height() - 430);
            UE.delEditor('content');UE.getEditor('content',{
                initialFrameHeight : height,
                autoHeightEnabled: false
            });
        })
         
        /*  function getLength(){
        	
        	 alert(this.files[0]);
        	 var length = obj.files.length;
        	   if(fileCount > 3){
        	    window.alert('文件数不能超过3个，你选择了' + fileCount + '个');
        	   } 
         } */
         var file_num;
          $("#imgs").change(function (e) {
        	 file_num = this.files.length;
        	if(file_num>5){
        		alert("上传的门店图片个数不能大于5,您选择了"+file_num+"个");
        		$("#imgs").val("");
        	}
        	
        });

        </script>
    </div>
</div>
