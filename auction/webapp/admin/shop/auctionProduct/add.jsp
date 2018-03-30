 <%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="assets/js/My97DatePicker/WdatePicker.js"></script>
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
			<form class="form-horizontal" method="post" id="addAuctionForm">
			<input type="hidden" value="${cid }" name="categoryId">
			<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">商品名</label>
					<div class="col-sm-9">
						<input class="form-control" id="name" maxlength="100" name="name"
							placeholder="商品名" required>
					</div>
				</div>
			
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">商品图片</label>
					<div class="col-sm-9">
					<div class="fileupload fileupload-new" data-provides="fileupload">
							<div class="fileupload-new thumbnail"
								style="width: 200px; height: 150px;">
									<img
										src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
										alt="" />
							</div>
							<div class="fileupload-preview fileupload-exists thumbnail"
								style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
							<div>
								<span class="btn btn-default btn-file"> <span
									class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
									<span class="fileupload-exists"><i class="fa fa-undo"></i>
										替换</span> 上传图片 <input type="file" class="default"
									name="headImage" id="imgs" />
								</span> <a href="#" class="btn btn-danger fileupload-exists"
									data-dismiss="fileupload"><i class="fa fa-trash"></i>
								删除 </a>
							</div>
							<span id="pictureSpan"></span> 
						</div>
					</div>
				</div> 
			
				<div class="comMargBot clearfix">
					<label class="col-sm-2 control-label">商品轮播图</label>
					<div class="upLoadFlashImgDiv col-sm-9 col-lg-8">
						<div id="upLoadFlashImgDiv" class="fileupload fileupload-new col-sm-9 col-lg-9">
							<div id="img-container" class="clearfix"></div>
							<span id="addBtn_flash" class="btn btn-default btn-file"> 
								<span class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
								上传图片 <input id="upMultipImgs_flash" type="file" class="default" name="pictures" multiple="multiple"/>
								
							</span>
						</div>
						<div class="tipInfoTxt left2">
							<strong>商品轮播图：商品首页顶部展示</strong>
							<p>a.&nbsp;尺寸<span style="color:red;">800*800px</span></p>
							<p>b.&nbsp;图片大小<span style="color:red;">不超过1M</span></p>
							<!-- p id="pictureSpan" style="color:red">提示:图片大小不能超过1M,否则不能上传!</p -->
						</div>
					</div>
				</div>
					
				<div class="comMargBot clearfix">
					<label class="col-sm-2 control-label">商品详情图</label>
					<div class="upLoadDetailImgDiv col-sm-9 col-lg-8">
						<div id="upLoadFlashImgDiv" class="	 fileupload-new col-sm-9 col-lg-9">
							<div id="img-container_det" class="clearfix"></div>
							<span id="addBtn_flash" class="btn btn-default btn-file"> 
								<span class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
								上传图片 <input id="upMultipImgs_detail" type="file" class="default" name="pictures"  multiple="multiple"/>
							</span>
						</div>
						<div class="tipInfoTxt left2">
							<strong>商品详情图：商品详情展示</strong>
							<p>a.&nbsp;尺寸<span style="color:red;">768*384px</span></p>
							<p>b.&nbsp;图片大小<span style="color:red;">不超过1M</span></p>
							<!-- p id="pictureSpan" style="color:red">提示:图片大小不能超过1M,否则不能上传!</p -->
						</div>
					</div>
				</div>
						
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">竞拍证书正面</label>
					<div class="col-sm-9">
					<div class="fileupload fileupload-new" data-provides="fileupload">
							<div class="fileupload-new thumbnail"
								style="width: 200px; height: 150px;">
									<img
										src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
										alt="" />
							</div>
							<div class="fileupload-preview fileupload-exists thumbnail"
								style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
							<div>
								<span class="btn btn-default btn-file"> <span
									class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
									<span class="fileupload-exists"><i class="fa fa-undo"></i>
										替换</span> 上传图片 <input type="file" class="default"
									name="headImage1" id="imgs1" />
								</span> <a href="#" class="btn btn-danger fileupload-exists"
									data-dismiss="fileupload"><i class="fa fa-trash"></i>
								删除 </a>
							</div>
							<span id="pictureSpan1"></span> 
						</div>
					</div>
				</div> 		
				
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">竞拍证书反面</label>
					<div class="col-sm-9">
					<div class="fileupload fileupload-new" data-provides="fileupload">
							<div class="fileupload-new thumbnail"
								style="width: 200px; height: 150px;">
									<img
										src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
										alt="" />
							</div>
							<div class="fileupload-preview fileupload-exists thumbnail"
								style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
							<div>
								<span class="btn btn-default btn-file"> <span
									class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
									<span class="fileupload-exists"><i class="fa fa-undo"></i>
										替换</span> 上传图片 <input type="file" class="default"
									name="headImage2" id="imgs2" />
								</span> <a href="#" class="btn btn-danger fileupload-exists"
									data-dismiss="fileupload"><i class="fa fa-trash"></i>
								删除 </a>
							</div>
							<span id="pictureSpan2"></span> 
						</div>
					</div>
				</div>
						
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">产地</label>
					<div class="col-sm-9">
					<!-- <input type="button" onclick="%%%%()" value="创建Input"/> -->
						<input class="form-control" id="origin" maxlength="100" name="origin"
							placeholder="产地" required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">重量</label>
					<div class="col-sm-9">
					<!-- <input type="button" onclick="%%%%()" value="创建Input"/> -->
						<input class="form-control" id="weight" maxlength="50" name="weight"
							placeholder="重量" required>
					</div>
				</div> 
				
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">尺寸</label>
					<div class="col-sm-9">
					<!-- <input type="button" onclick="%%%%()" value="创建Input"/> -->
						<input class="form-control" id="size" maxlength="100" name="size"
							placeholder="尺寸" required>
					</div>
				</div>  
						
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">证书机构名称</label>
					<div class="col-sm-9">
					<!-- <input type="button" onclick="%%%%()" value="创建Input"/> -->
						<input class="form-control" id="organization" maxlength="100" name="organization"
							placeholder="证书机构名称" required>
					</div>
				</div> 
				
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">证书机构网站</label>
					<div class="col-sm-9">
					<!-- <input type="button" onclick="%%%%()" value="创建Input"/> -->
						<input class="form-control" id="website" onblur="checkXS(this.value)" maxlength="100" name="website"
							placeholder="证书机构网站" required>
					</div>
					<div class="col-sm-9" style="padding-left: 223px;"><span style="color: red;">网站开头为(https://或者http://)</span></div>
				</div> 
				
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">宝贝描述</label>
					<div class="col-sm-9">
					<!-- <input type="button" onclick="%%%%()" value="创建Input"/> -->
						<input class="form-control" id="describes" maxlength="120" name="describes"
							placeholder="宝贝描述" required>
					</div>
				</div> 
					
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">证书号</label>
					<div class="col-sm-9">
					<!-- <input type="button" onclick="%%%%()" value="创建Input"/> -->
						<input class="form-control" id="certifi" maxlength="100" name="certifi"
							placeholder="证书号" required>
					</div>
				</div> 
						
		  		<!-- <div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">上传人</label>
					<div class="col-sm-9">
					<input type="button" onclick="%%%%()" value="创建Input"/>
						<input class="form-control" id="userName" maxlength="100" name="userName"
							placeholder="上传人" required>
					</div>
				</div>   -->
				<input type="hidden" id="thisStatus" name="thisStatus" value="2">
				<!-- <div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">起拍价</label>
					<div class="col-sm-9">
						<input class="form-control" id="startPrice" onkeyup="clearNoNum(this)" maxlength="15" name="startPrice" 
							placeholder="起拍价" required>
						 
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">最高价</label>
					<div class="col-sm-9">
						<input class="form-control" id="hightPrice" maxlength="15" name="hightPrice" onkeyup="clearNoNum(this)"
							placeholder="最高价" required>
						 
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">每次出价增加幅度</label>
					<div class="col-sm-9">
						<input class="form-control" id="ladder"  maxlength="15" name="ladder"  onkeyup="clearNoNum(this)"
							placeholder="每次出价增加幅度" required>
						 
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">保证金</label>
					<div class="col-sm-9">
						<input class="form-control" id="bond" name="bond" maxlength="15"  onkeyup="clearNoNum(this)"
							placeholder="保证金" required>
					</div>
				</div>
              
                <div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">竞拍开始时间</label>
					<div class="col-sm-9">
						<input type="date" class="form-control" id=""startTime"" name="startTime"
							placeholder="竞拍开始时间" required>
						<input class="form-control" name="startTime" id="startTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" style="z-index:999;" placeholder="竞拍开始时间" required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">竞拍结束时间</label>
					<div class="col-sm-9">
						<input class="form-control" id="endTime" name="endTime"
							placeholder="竞拍结束时间" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" required>
					</div>
				</div> -->
				<div class="widget-buttons">
                		<button type="button" onclick="addProductDetails()" class="btn btn-info btn-ok">保存商品信息</button>
            	</div>
			</form>
		</div>
	</div>
</div>
<script>
	var tmpUploadImg = [];
	var tmpUploadImg_det = [];
	function handleFileSelect() {
		var formData=new FormData();
		var fileLength = $("#upMultipImgs_flash")[0].files.length;
		if(fileLength + tmpUploadImg.length>5){
			layer.msg("图片最多上传5张");
			return ;
		}
        for(var i=0;i<fileLength;i++){
           formData.append('pictures', $("#upMultipImgs_flash")[0].files[i]);
        }
        formData.append('type','1');
        $.ajax({
			method : 'post',
			url : 'product/productInfo/uploadImg.htm',
			cache : false,
			contentType : false,
			processData : false,
			data : formData,
			success : function(data) {
				var str = "";
				// data=eval("("+data+")");
				console.log(data);
				for(var i=0;i<data.length;i++){
					if(data[i].indexOf("small")!=-1){
						str += "<div style='display: none;' class='img-thumb img-item'>";
						str += "<img width='180' class='thumb-icon' src='/"+ data[i] +"'/>";
						str += "<i class='iconfont img-remove icon-close'></i>"
						str += "</div>"
						tmpUploadImg.push(data[i]);
					}else{
						str += "<div class='img-thumb img-item'>";
						str += "<img width='180' class='thumb-icon' src='/"+ data[i] +"'/>";
						str += "<i class='iconfont img-remove icon-close'></i>"
						str += "</div>"
						tmpUploadImg.push(data[i]);
					}
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
		var filesLength = $("#upMultipImgs_detail")[0].files.length;
		if(filesLength + tmpUploadImg_det.length> 10){
			layer.msg("图片最多可以上传10张")
			return ;
		}
        for(var i=0;i<filesLength;i++){
        	formData.append('pictures', $("#upMultipImgs_detail")[0].files[i]);
        }
        $.ajax({
			method : 'post',
			url : 'product/productInfo/uploadImg.htm',
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
	document.querySelector('#upMultipImgs_flash').addEventListener('change', handleFileSelect, false);
	document.querySelector('#upMultipImgs_detail').addEventListener('change', handleFileSelect_det, false);
	
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
    var flag=true;
    
    function checkXS(obj){
    	if(obj!=""){
    		var reg=/(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/;
    		if(!reg.test(obj)){
    			layer.msg("不是正确的网址吧，请注意检查一下");
    			$("#website").focus();
    		}
    	}
    }
//保存商品信息
    function addProductDetails(){
    	var name = $("#name").val();//商品名
    	var origin = $("#origin").val();//产地
    	var weight = $("#weight").val();//重量
    	var size = $("#size").val();//尺寸
    	var organization = $("#organization").val();//证书机构名称
    	var website = $("#website").val();//证书机构网站
    	var describes = $("#describes").val();//描述
    	var certifi = $("#certifi").val();//证书号
    	//var userName = $("#userName").val();//上传人
    	//var startPrice = $("#startPrice").val();//起拍价
    	//var ladder = $("#ladder").val();//每次加价幅度
    	//var bond = $("#bond").val();//保证金
    	//var startTime = $("#startTime").val();//竞拍开始时间
    	//var endTime = $("#endTime").val();//竞拍结束时间
    	if(name=='' || name == null ){
    		layer.msg("商品名不能为空");
    		return;
    	}
    	if(origin=='' || origin==null){
    		layer.msg("产地不能为空");
    		return;
    	}
    	if(weight=='' || weight==null){
    		layer.msg("重量不能为空");
    		return;
    	}
    	if(size=='' || size==null){
    		layer.msg("尺寸不能为空");
    		return;
    	}
    	if(organization=='' || organization==null){
    		layer.msg("证书机构名称不能为空");
    		return;
    	}
    	if(website=='' || website==null){
    		layer.msg("证书机构网站不能为空");
    		return;
    	}
    	if(describes=='' || describes==null){
    		layer.msg("描述不能为空");
    		return;
    	}
    	if(certifi=='' || certifi==null){
    		layer.msg("证书号不能为空");
    		return;
    	}
    	/*if(startPrice=='' || startPrice==null){
    		layer.msg("起拍价不能为空");
    		return;
    	}
    	if(ladder=='' || ladder==null){
    		layer.msg("每次加价幅度不能为空");
    		return;
    	}
    	if(bond=='' || bond==null){
    		layer.msg("保证金不能为空");
    		return;
    	}
    	if(startTime=='' || startTime==null){
    		layer.msg("竞拍开始时间不能为空");
    		return;
    	}
    	if(endTime=='' || endTime==null){
    		layer.msg("竞拍结束时间不能为空");
    		return;
    	}*/
    	if(flag==false){
			layer.msg("请按规范填写信息");
			return;
		}
		var tids = "-1";
		$("#tag input:checked").each(function() {
			tids = tids + "," + $(this).val();
		});
		
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
			url : 'product/productInfo/addProductDetails.htm?tids='+tids+'&pictures1='+pictures1+'&pictures2='+pictures2,  
            contentType:false,
            processData:false,
			data : new FormData($("#addAuctionForm")[0]),
			success : function(data) {
				
				 $.ajax({
					method : 'post',
					url : 'product/productInfo/list.htm',
					success : function(html) {
						loadHtml(html);	
					}
				}) 
				layer.msg("添加成功");
				
			}
		})
    	
    }
    function clearNoNum(obj) {  
        obj.value = obj.value.replace(/[^\d.]/g,""); //清除"数字"和"."以外的字符  
            obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字而不是  
            obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的  
            obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");  
            obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'); //只能输入两个小数  

    }  
</script>