<%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="http:////at.alicdn.com/t/font_486497_hl2e4pr88k1hh0k9.css"/>	 
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-fileupload.min.css" />
<script src="auction/rmbproduct/rmbproduct.js"></script> 
<script type="text/javascript" src="assets/js/bootstrap-fileupload.min.js"></script>	

 <style>
 	.categoryDiv a{color:#666;}
 	.categoryDiv a:hover{color:#d73d32;}
  .demo-input{padding-left: 10px; height: 38px; min-width: 262px; line-height: 38px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;}
	.basicInfoTxt{width:100%;height:30px;padding-left:8px;line-height:30px;margin:15px 0;font-size:16px;color:#666;position:relative;text-indent:100px;}
	.basicInfoTxt span{width:3px;height:20px;background:#2dc3e8;position:absolute;left:100px;top:5px;}
	.comMargBot{margin-bottom:15px;}
	.upLoadImgDiv,.upLoadFlashImgDiv,.upLoadDetailImgDiv{position:relative;}
	.tipInfoTxt{position:absolute;top:0px;color:#666;}
	.left1{left:240px;}.left2{right:18px;}
	.tipInfoTxt strong{font-weight:normal;display:inline-block;margin-bottom:10px;}
	#img-container,#img-container_det{width:100%;min-height:150px;border:1px solid #ccc;padding-top:15px;margin-bottom:15px;}
	.img-thumb{float:left;margin:0 0px 10px 0;position:relative;height:150px;}
	.img-thumb:nth-of-type(4n){float:right;}
	.img-thumb:nth-of-type(3n-1),.img-thumb:nth-of-type(3n-2){margin-left:19px;}
	.img-thumb img{width:180px;height:150px;}
	.img-remove,.img-removes{position:absolute;right:0;top:0;cursor:pointer;}
	.icon-close{color:red;font-size:20px;}
	.addListTable{width:100%;height:35px;line-height:35px;text-align:right;}
	.addListTable button{width:100px;height:35px;background:#2dc3e8;color:#fff;border:none;}
  	.addListTable button:hover{background:#22a7c7;}
  	.saveProInfoBtn{height:40px;line-height:40px;margin-left:16.6%;text-align:center;}
  	.saveProInfoBtn button{display:inline-block;}
  </style> 
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" id="editAuction" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${api.id}">
				<input type="hidden" name="integralId" value="${api.integralId}">
				<input type="hidden" name="certificate" value="${api.certificate}">
				<input type="hidden" name="certificateSide" value="${api.certificateSide}">
				<div class="row">
					<p class="basicInfoTxt"><span></span>商品竞拍信息</p>
					
					<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">证书机构名称</label>
					<div class="col-sm-9">
						<input class="form-control" id="organization" name="organization"
							placeholder="证书机构名称" value="${api.organization}"  disabled>
					</div>
				</div> 
				
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">证书机构网站</label>
					<div class="col-sm-9">
						<input class="form-control" id="website" name="website"
							placeholder="证书机构网站" value="${api.website}" disabled>
					</div>
				</div> 
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">证书号</label>
					<div class="col-sm-9">
						<input class="form-control" id="certifi" name="certifi"
							placeholder="证书号" value="${api.certifi}" disabled>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">产地</label>
					<div class="col-sm-9">
						<input class="form-control" id="origin" name="origin"
							placeholder="产地" value="${api.origin}" disabled>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">重量</label>
					<div class="col-sm-9">
						<input class="form-control" id="weight" name="weight"
							placeholder="重量" value="${api.weight}" disabled>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">尺寸</label>
					<div class="col-sm-9">
						<input class="form-control" id="size" name="size"
							placeholder="尺寸" value="${api.size}" disabled>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">宝贝描述</label>
					<div class="col-sm-9">
						<textarea class="form-control" id="describes" name="describes"
							placeholder="宝贝描述" disabled onblur="panduan()">${api.describes}</textarea>
					</div>
				</div> 
					
				 
				<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label">竞拍证书正面</label>
						<div class="upLoadImgDiv col-sm-5">
							<div class="fileupload fileupload-new" data-provides="fileupload">
								<div class="fileupload-new thumbnail"
									style="width: 200px; height: 150px;">
									<img src="/${api.certificate}" alt="" />
								</div>
								<div class="fileupload-preview fileupload-exists thumbnail" 
								style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
								<!-- <div>
									<span class="btn btn-default btn-file"> 
										<span class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
										<span class="fileupload-exists">
											<i class="fa fa-undo"></i>
											替换
										</span> 
										上传图片 <input type="file" class="default" name="f1" id="files" />
									</span> 
									<a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">
										<i class="fa fa-trash"></i> 移除图片
									</a>
								</div> -->
							</div>
							<div class="tipInfoTxt left1">
								<strong>商品图片：首页区域显示</strong>
								<p>a.&nbsp;尺寸<span style="color:red;">宽1060px(高不限制)</span></p>
								<p>b.&nbsp;图片大小<span style="color:red;">不超过1M</span></p>
								
							</div>
						</div>
				</div>
				<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label">竞拍证书反面</label>
						<div class="upLoadImgDiv col-sm-5">
							<div class="fileupload fileupload-new" data-provides="fileupload">
								<div class="fileupload-new thumbnail"
									style="width: 200px; height: 150px;">
									<img src="/${api.certificateSide}" alt="" />
								</div>
								<div class="fileupload-preview fileupload-exists thumbnail" 
								style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
								<!-- <div>
									<span class="btn btn-default btn-file"> 
										<span class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
										<span class="fileupload-exists">
											<i class="fa fa-undo"></i>
											替换
										</span> 
										上传图片 <input type="file" class="default" name="f2" id="files" />
									</span> 
									<a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">
										<i class="fa fa-trash"></i> 移除图片
									</a>
								</div> -->
							</div>
							<div class="tipInfoTxt left1">
								<strong>商品图片：首页区域显示</strong>
								<p>a.&nbsp;尺寸<span style="color:red;">宽1060px(高不限制)</span></p>
								<p>b.&nbsp;图片大小<span style="color:red;">不超过1M</span></p>
								
							</div>
						</div>
				</div>
				<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label">商品轮播图</label>
						<div class="upLoadFlashImgDiv col-sm-9 col-lg-8">
							<div id="upLoadFlashImgDiv" class="fileupload fileupload-new col-sm-9 col-lg-9">
								<div id="img-container" class="clearfix">
								<c:forEach var="n" items="${imgLunbo}">
									<div class='img-thumb img-item'>
										<img width='180' class='thumb-icon' src='/${n.picture}'/>
										<!-- <i class='iconfont img-remove icon-close'></i> -->
									</div>
								</c:forEach>
								
								
								</div>
								<!-- <span id="addBtn_flash" class="btn btn-default btn-file"> 
									<span class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
									上传图片 <input id="upMultipImgs_flash" type="file" class="default" name="pictures" multiple="multiple"/>
									
								</span> -->
							</div>
							<div class="tipInfoTxt left2">
								<strong>商品轮播图：商品详情顶部展示</strong>
								<p>a.&nbsp;尺寸<span style="color:red;">800*800px(宽*高)</span></p>
								<p>b.&nbsp;图片大小<span style="color:red;">不超过1M</span></p>
								<!-- p id="pictureSpan" style="color:red">提示:图片大小不能超过1M,否则不能上传!</p -->
							</div>
						</div>
					</div>
					
					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label">商品详情图</label>
						<div class="upLoadDetailImgDiv col-sm-9 col-lg-8">
							<div id="upLoadFlashImgDiv" class="fileupload fileupload-new col-sm-9 col-lg-9">
								<div id="img-container_det" class="clearfix">
								<c:forEach var="n" items="${imgDetails}">
									<div class='img-thumb img-item'>
										<img width='180' class='thumb-icon' src='/${n.picture}'/>
										<!-- <i class='iconfont img-removes icon-close'></i> -->
									</div>
								</c:forEach>
								</div>
							<!-- 	<span id="addBtn_flash" class="btn btn-default btn-file"> 
									<span class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
									上传图片 <input id="upMultipImgs_detail" type="file" class="default" name="pictures"  multiple="multiple"/>
								</span> -->
							</div>
							<div class="tipInfoTxt left2">
								<strong>商品详情图：商品详情展示</strong>
								<p>a.&nbsp;尺寸<span style="color:red;">宽1060px(高不限制)</span></p>
								<p>b.&nbsp;图片大小<span style="color:red;">不超过1M</span></p>
								<!-- p id="pictureSpan" style="color:red">提示:图片大小不能超过1M,否则不能上传!</p -->
							</div>
						</div>
					</div>

					
				</div>
			</form>
			<!-- <div class="comMargBot clearfix col-sm-8 saveProInfoBtn" style="margin-left:16.6%;float:none;">
				<button class="btn btn-danger" onclick="editAuction()">保存竞拍信息</button>
			</div> -->
		</div>
	</div>
</div>
<script>
var detailImgList = '${imgDetailsJson}';
var flashImgList='${imgLunboJson}';
var tmpUploadImg = [];
var tmpUploadImg_det = [];
$(function(){
	tmpUploadImg = eval("("+ flashImgList +")");
	tmpUploadImg_det = eval("("+ detailImgList +")")
});
	function handleFileSelect() {
		var formData=new FormData();
        for(var i=0;i<$("#upMultipImgs_flash")[0].files.length;i++){
           //var imgSize = f.size/(1024*1024).toFixed(2);
           formData.append('pictures', $("#upMultipImgs_flash")[0].files[i]);
        }
        $.ajax({
			method : 'post',
			url : 'auction/rmbProductController/uploadImg.htm',
			cache : false,
			contentType : false,
			processData : false,
			data : formData,
			success : function(data) {
				var str = "";
				// data=eval("("+data+")");
				console.log(data);
				for(var i=0;i<data.length;i++){
					str += "<div class='img-thumb img-item'>";
					str += "<img width='180' class='thumb-icon' src='/"+ data[i] +"'/>";
					str += "<i class='iconfont img-remove icon-close'></i>"
					str += "</div>"
					tmpUploadImg.push(data[i]);
				}
				/*var strUrl = "";
				strUrl = JSON.stringify(tmpUploadImg);
				console.log(strUrl + typeof(strUrl))*/
				$('#img-container').append(str);
			}
		}) 
    }
	function handleFileSelect_det() {
		var formData=new FormData();
        for(var i=0;i<$("#upMultipImgs_detail")[0].files.length;i++){
        	formData.append('pictures', $("#upMultipImgs_detail")[0].files[i]);
        }
        $.ajax({
			method : 'post',
			url : 'auction/rmbProductController/uploadImg.htm',
			cache : false,
			contentType : false,
			processData : false,
			data : formData,
			success : function(data) {
				var str = "";
				// data=eval("("+data+")");
				console.log(data);
				for(var i=0;i<data.length;i++){
					str += "<div class='img-thumb img-item'>";
					str += "<img width='180' class='thumb-icon' src='/"+ data[i] +"'/>";
					str += "<i class='iconfont img-removes icon-close'></i>"
					str += "</div>"
						tmpUploadImg_det.push(data[i]);
				}
				/*var strUrl = "";
				strUrl = JSON.stringify(tmpUploadImg);
				console.log(strUrl + typeof(strUrl))*/
				$('#img-container_det').append(str);
			}
		}) 
    }
	/* document.querySelector('#upMultipImgs_flash').addEventListener('change', handleFileSelect, false);
	document.querySelector('#upMultipImgs_detail').addEventListener('change', handleFileSelect_det, false); */
	
    // 获取删除的节点的索引
    function getIndex(ele){
        if(ele && ele.nodeType && ele.nodeType == 1) {
            var oParent = ele.parentNode;
            var oChilds = oParent.children;
            for(var i = 0; i < oChilds.length; i++){
                if(oChilds[i] == ele)
                    return i;
            }
        }else {
            return -1;
        }
    }
    // 删除图片
    function removeImg(evt) {
    	var ele = document.querySelector('#img-container');
        if(evt.target.className.match(/img-remove/)){
            // 根据索引删除指定的文件对象
            var index = getIndex(evt.target.parentNode);
            ele.removeChild(evt.target.parentNode);
            if(index < 0){
                return;
            }else {
            	tmpUploadImg.splice(index, 1);
            }
        }
    }
    // 删除图片
    function removeImg_det(evt) {
    	var ele = document.querySelector('#img-container_det');
        if(evt.target.className.match(/img-removes/)){
            // 根据索引删除指定的文件对象
            var index = getIndex(evt.target.parentNode);
            ele.removeChild(evt.target.parentNode);
            if(index < 0){
                return;
            }else {
            	tmpUploadImg_det.splice(index, 1);
            }
        }
    }
    document.querySelector("#img-container").addEventListener('click', removeImg, false);
    document.querySelector("#img-container_det").addEventListener('click', removeImg_det, false);

    function panduan(){
    	//限制500字
    	 var introduction = $("#describes").val();
    	if(introduction.length!=0){
    		if(introduction.length>500){
    			layer.msg("输入文字不能超过500个字");
    			$("#describes").val(introduction.substring(0,500))
        		
        	}
    	} 	
    }
    
//保存竞拍信息
    function editAuction(){
    	var f1=$("#f1").val();
		var f2=$("#f2").val();
		var organization=$("#organization").val();
		var website=$("#website").val();
		var certifi=$("#certifi").val();
		var origin = $("#origin").val();//产地
    	var weight = $("#weight").val();//重量
    	var size = $("#size").val();//尺寸
    	var describes=$("#describes").val();
		if(f1==""){
			layer.msg("竞拍证书正面不能为空");
			return false;
		}
		if(f2==""){
			layer.msg("竞拍证书反面不能为空");
			return false;
		}
		if(organization==""){
			layer.msg("整数据构名称不能为空");
			return false;
		}
		if(certifi==""){
			layer.msg("证书号不能为空");
			return false;
		}
		if(website==""){
			layer.msg("证书机构网站不能为空");
			return false;
		}
		if(origin=='' || origin==null){
    		layer.msg("产地不能为空");
    		return false;
    	}
    	if(weight=='' || weight==null){
    		layer.msg("重量不能为空");
    		return false;
    	}
    	if(size=='' || size==null){
    		layer.msg("尺寸不能为空");
    		return false;
    	}
    	if(describes=='' || describes==null){
    		layer.msg("宝贝描述不能为空");
    		return false;
    	}
		//商品轮播图
		var pictures1 = "";
		pictures1 = JSON.stringify(tmpUploadImg);
		/* console.log(strUrl + typeof(strUrl)) */
		console.log(pictures1)
		//商品详情图
		var pictures2="";
		pictures2 = JSON.stringify(tmpUploadImg_det);
		console.log(pictures2)
		// 
    	$.ajax({
			method : 'post',
			url : 'auction/rmbProductController/addJinfenAuction.htm?pictures1='+pictures1+'&pictures2='+pictures2,  
            contentType:false,
            processData:false,
			data : new FormData($("#editAuction")[0]),
			success : function(data) {
				
				 $.ajax({
					method : 'post',
					url : 'auction/rmbProductController/list.htm?type=${type}',
					success : function(html) {
						loadHtml(html);	
					}
				}) 
				layer.msg("修改成功");
				
			}
		})
    	
    }


function checkFormParams(){
	
}
</script>

