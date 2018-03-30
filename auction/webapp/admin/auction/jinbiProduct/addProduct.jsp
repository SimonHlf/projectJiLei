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
  	.selProType{height:35px;line-height:35px;}
  	.typeLabel{width:70px;height:100%;display:inline-block;line-height:35px;position:relative;text-indent:25px;cursor:pointer;}
  	.typeLabel:last-child{margin-left:10px;}
  	.typeLabel span{width:20px;height:20px;border:1px solid #ccc;border-radius:50%;position:absolute;left:0;top:7px;}
  	.typeLabel span em{width:8px;height:8px;border-radius:50%;position:absolute;left:5px;top:5px;}
 	.typeLabel .selAct em{background:#2dc3e8;}
  </style> 
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" id="addProductDetailsForm"
				>
				<input type="hidden" name="id" value="${rmbProduct.id}">
				<input type="hidden" name="type" id="type" value="${rmbProduct.type}">
				<div class="row">
					<p class="basicInfoTxt"><span></span>商品基本信息</p>
					
						<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">类别</label>
						<div class="categoryDiv col-sm-4">
							<select name="categoryId1" id="s1"
								onchange="sc(this.options[this.options.selectedIndex].value)" disabled>
								<option>一级分类</option>
								<c:forEach var="c" items="${category}">
								<c:if test="${pcCategory.parentId == c.id}">
									<option value="${c.id}" selected>${c.shopTypeName}</option>
								</c:if>
								<c:if test="${pcCategory.parentId != c.id}">
									<option value="${c.id}">${c.shopTypeName}</option>
								</c:if>
								
								</c:forEach>
							</select> <select id="s2" name="categoryId1" disabled>
							
								<c:forEach var="c" items="${erpc}">                                                                    }">
								<c:if test="${rmbProduct.categoryid == c.id}">
									<option value="${c.id}" selected>${c.shopTypeName}</option>
								</c:if>
								
								
								</c:forEach>
							
							</select>
							<a href="javascript:backEditCate('${rmbProduct.id}')">&lt;&lt;返回修改</a>
						</div>
						
					</div>
					
					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">商品名</label>
						<div class="col-sm-6">
							<input class="form-control" id="name" name="name"
								placeholder="商品名" onblur="checkNameNum()" required>
							<span style="color:#2dc3e8">商品名称组成：商品名称+规则</span>
						</div>
					</div>
					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">市场价</label>
						<div class="col-sm-6">
							<input class="form-control" id="marketprice" name="marketprice"
								placeholder="市场价" type="number" required>
							<span style="color:#2dc3e8">单位：金币；市场价应高于下方商品规格中的最高价；</span>
						</div>
					</div>
					
					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">现价</label>
						<div class="col-sm-6">
							<input class="form-control" id="price" name="price"
								placeholder="现价" type="number" required>
							<span style="color:#2dc3e8">单位：金币</span>
						</div>
					</div>
					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">成本价</label>
						<div class="col-sm-6">
							<input class="form-control" id="costprice" name="costprice"
								placeholder="成本价" type="number" required>
							<span style="color:#2dc3e8">单位：金币</span>
						</div>
					</div>
					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label">商品主图</label>
						<div class="upLoadImgDiv col-sm-5">
							<div class="fileupload fileupload-new" data-provides="fileupload">
								<div class="fileupload-new thumbnail"
									style="width: 200px; height: 150px;">
									<img src="${pageContext.request.contextPath}/admin/assets/img/noimage.png" alt="" />
								</div>
								<div class="fileupload-preview fileupload-exists thumbnail" 
								style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
								<div>
									<span class="btn btn-default btn-file"> 
										<span class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
										<span class="fileupload-exists">
											<i class="fa fa-undo"></i>
											替换
										</span> 
										上传图片 <input type="file" class="default" name="fff" id="files" />
									</span> 
									<a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">
										<i class="fa fa-trash"></i> 移除图片
									</a>
								</div>
							</div>
							<div class="tipInfoTxt left1">
								<strong>商品图片：首页区域显示</strong>
								<p>a.&nbsp;尺寸<span style="color:red;">250*350px(宽*高)</span></p>
								<p>b.&nbsp;图片大小<span style="color:red;">不超过1M</span></p>
								<!-- p id="pictureSpan" style="color:red">提示:图片大小不能超过1M,否则不能上传!</p -->
							</div>
						</div>
					</div>
					
					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">用户搜索关键字</label>
						<div class="col-sm-6">
							<input class="form-control" id="keywords" name="keywords"
								placeholder="用户搜索关键字" required>
						</div>
					</div>

					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">评价标签</label>
						<div class="col-sm-6">
							<div class="checkbox" id="tag">
								<v:Tag></v:Tag>
							</div>
						</div>
					</div>
					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">服务标签</label>
						<div class="col-sm-6">
							<div class="checkbox" id="tagservice">
								<v:AService></v:AService>
							</div>
						</div>
					</div>
					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">单位</label>
						<div class="col-sm-6">
							<input class="form-control" id="unit" name="unit"
								placeholder="单位" required>
							<span style="color:#2dc3e8">单位：如/个，/件</span>
						</div>
					</div>
					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">重量</label>
						<div class="col-sm-6">
							<input class="form-control" id="weight" name="weight"
								placeholder="重量" type="number" required>
							<span style="color:#2dc3e8">单位：g(克)</span>
						</div>
					</div>
					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">运费</label>
						<div class="col-sm-6">
							<input class="form-control" id="trans" name="trans"
								placeholder="运费" type="number" required>
							<span style="color:#2dc3e8">单位：金币</span>
						</div>
					</div>
					
					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">上市时间</label>
						<div class="col-sm-2">
							<input class="form-control" type="date" id="markettime" name="markettime"
								placeholder="上市时间" required>
						</div>
					</div>
					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">品牌</label>
						<div class="col-sm-6">
							<select name="brandid" id="brandid">
								<option value="">选择品牌</option>
								<c:forEach var="b" items="${brands}">
									<option value="${b.id}">${b.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">产地</label>
						<div class="col-sm-6">
							<select name="provinceid" id="provinceid">
								<option value="">选择产地</option>
								<c:forEach var="r" items="${regions}">
									<option value="${r.regionid}">${r.regionname}</option>
								</c:forEach>
							</select>
							
						</div>
					</div>
					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">是否可以退换货</label>
						<div class="col-sm-6">
							<v:items type="isreturned" id="isreturned" name="isreturned"/>
						</div>
					</div>

					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">商品简介</label>
						<div class="col-sm-6">
							<textarea class="form-control" id="briefly" name="briefly"  onblur="panduan()" required></textarea>
							<span style="color:#2dc3e8">字数限制：不超过500字</span>	
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
								<div id="img-container_det" class="clearfix"></div>
								<span id="addBtn_flash" class="btn btn-default btn-file"> 
									<span class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
									上传图片 <input id="upMultipImgs_detail" type="file" class="default" name="pictures"  multiple="multiple"/>
								</span>
							</div>
							<div class="tipInfoTxt left2">
								<strong>商品详情图：商品详情展示</strong>
								<p>a.&nbsp;尺寸<span style="color:red;">宽1060px(高不限制)</span></p>
								<p>b.&nbsp;图片大小<span style="color:red;">不超过1M</span></p>
								<!-- p id="pictureSpan" style="color:red">提示:图片大小不能超过1M,否则不能上传!</p -->
							</div>
						</div>
					</div>
					<p class="basicInfoTxt"><span></span>商品规格</p>
						<div class="selProType comMargBot">
							<div class="comMargBot">
								<label class="col-sm-2 control-label no-padding-right" style="padding:0px;">商品类型</label>
								<div class="col-sm-6">
									<input type="hidden" id="proTypeInp" value="0"/>
									<label class="typeLabel" onclick="getProType(this)">
										单品
										<span class="radiusSp selAct" attr="0"><em></em></span>
									</label>
									<label class="typeLabel" onclick="getProType(this)">
										非单品
										<span class="radiusSp" attr="1"><em></em></span>
									</label>
								</div>
							</div>
						</div>
						<div class="singlePro">
							<div class="comMargBot clearfix">
								<label class="col-sm-2 control-label no-padding-right">库存</label>
								<div class="col-sm-6">
									<input class="form-control" id="attr2" name="attr2"
										placeholder="库存" value="" type="number" required>
									<span style="color:#2dc3e8">单品需要填写库存</span>
								</div>
							</div>
						</div>
						<div class="noSinglePro clearfix" style="display:none;">
					
							<div class="comMargBot clearfix">
								<label class="col-sm-2 control-label no-padding-right">属性名</label>
								<div class="col-sm-6">
									<div class="checkbox" id="attrIds">
										<v:attribute cid="${rmbProduct.categoryid}"></v:attribute>
										<span style="color:#2dc3e8">非单品需要选择属性名</span>
									</div>
								</div>
							</div>
							<div class="comMargBot clearfix col-sm-8" style="margin-left:16.6%;posiiton:relative;">
								<div class="addListTable">
									<a class="btn btn-success" onclick="addPAttrValues('${rmbProduct.id}')">添加规格</a>
								</div>
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
									      <th align="center">属性及名称规格</th>
									      <th align="center">库存</th>
									      <th align="center">价格</th>
									      <th align="center">操作</th>
									    </tr>
								    </thead>
									<tbody id="pro_attrs"></tbody>
								</table>	
							</div>
						</div>
				</div>
			</form>
			<div class="comMargBot clearfix col-sm-8 saveProInfoBtn" style="margin-left:16.6%;float:none;">
				<button class="btn btn-danger" onclick="addProductDetails()">保存商品信息</button>
			</div>
		</div>
	</div>
</div>
<script>
	var tmpUploadImg = [];
	var tmpUploadImg_det = [];
	
	function getProType(obj){
		$(".radiusSp").removeClass("selAct");
		$(obj).find("span").addClass("selAct");
		$("#proTypeInp").val($(obj).find("span").attr("attr"));
		if($(obj).find("span").attr("attr") == "0"){
			$(".singlePro").show();
			$(".noSinglePro").hide();
		}else{
			$(".noSinglePro").show();
			$(".singlePro").hide();
		}
	}
	function handleFileSelect() {
		var formData=new FormData();
        for(var i=0;i<$("#upMultipImgs_flash")[0].files.length;i++){
           //var imgSize = f.size/(1024*1024).toFixed(2);
           formData.append('pictures', $("#upMultipImgs_flash")[0].files[i]);
        }
        formData.append('type',1);
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
  function checkNameNum(){
	//限制100字
 	var introduction = $("#name").val();
 	if(introduction.length!=0){
 		if(introduction.length>100){
 			layer.msg("输入文字不能超过100个字");
 			$("#name").val(introduction.substring(0,100))
     		
     	}
 	} 
  }
    
    function panduan(){
    	//限制500字
    	 var introduction = $("#briefly").val();
    	if(introduction.length!=0){
    		if(introduction.length>500){
    			layer.msg("输入文字不能超过500个字");
    			$("#briefly").val(introduction.substring(0,500))
        		
        	}
    	} 	
    }
    //大于0小于1
    function checkXS(obj){
	    var testXS=/^-?(0(\.\d*)?)$/;
	    if(!testXS.test(obj.value)){
	    	layer.msg("数据格式不正确")
	    	flag=false;
	    }else{
	    	flag=true;
	    }
    }
//保存商品信息
    function addProductDetails(){
    	//checkFormParams();
		var name=$("#name").val();
		var marketprice=$("#marketprice").val();
		var price=$("#price").val();
		var costprice=$("#costprice").val();
		var files=$("#files").val();
		var keywords=$("#keywords").val();
		var unit=$("#unit").val();
		var weight=$("#weight").val();
		var trans=$("#trans").val();
		var markettime=$("#markettime").val();
		var brandid=$("#brandid").val();
		var provinceid=$("#provinceid").val();
		var briefly=$("#briefly").val();
		var briefly=$("#briefly").val();
		var briefly=$("#briefly").val();
		var briefly=$("#briefly").val();
		var tags=$("#tag input:checked");
		var tagservice=$("#tagservice input:checked");
		var attr1=$("#proTypeInp").val();
		if(attr1==""){
			layer.msg("请选择商品规格");
    		return;
		}else{
			if(attr1=="0"){
				var attrIds=0;
				var attr2=$("#attr2").val();
				if(attr2=='' || attr2 == null ){
		    		layer.msg("库存不能不能为空");
		    		return;
				}
			}else{
				var attrIds=$("#attrIds input:checked");
				if(attrIds.length==0){
					layer.msg("请选择属性名");
		    		return;
				}else{
					attrIds="-1";
			    	$("#attrIds input:checked").each(function() {
			    		attrIds = attrIds + "," + $(this).val();
			    	});
				}
			}
			
		}
		
		if(tags.length==0){
			layer.msg("请选择评价标签");
    		return;
		}
		if(tagservice.length==0){
			layer.msg("请选择服务标签");
    		return;
		}
		
		if(name=='' || name == null ){
    		layer.msg("商品名不能为空");
    		return;
    	}
		if(marketprice=='' || marketprice == null ){
    		layer.msg("市场价不能为空");
    		return;
    	}
		if(price=='' || price == null ){
    		layer.msg("价格不能为空");
    		return;
    	}
		if(costprice=='' || costprice == null ){
    		layer.msg("原价不能为空");
    		return;
    	}
		if(files=='' || files == null ){
    		layer.msg("商品主图不能为空");
    		return;
    	}
		if(keywords=='' || keywords == null ){
    		layer.msg("搜索关键字不能为空");
    		return;
    	}
		if(unit=='' || unit == null ){
    		layer.msg("单位不能为空");
    		return;
    	}
		if(weight=='' || weight == null ){
    		layer.msg("重量不能为空");
    		return;
    	}
		if(trans=='' || trans == null ){
    		layer.msg("运费不能为空");
    		return;
    	}
		if(markettime=='' || markettime == null ){
    		layer.msg("上市时间不能为空");
    		return;
    	}
		if(brandid=='' || brandid == null ){
    		layer.msg("品牌不能为空");
    		return;
    	}
		if(brandid=='' || brandid == null ){
    		layer.msg("品牌不能为空");
    		return;
    	}
		if(provinceid=='' || provinceid == null ){
    		layer.msg("产地不能为空");
    		return;
    	}
		if(briefly=='' || briefly == null ){
    		layer.msg("商品简介不能为空");
    		return;
    	}
    	var type=$("#type").val();
    	if(flag==false){
			layer.msg("请按规范填写信息");
			return;
		}
    	/* var sids = "-1";
    	//服务说明
		$("#sd input:checked").each(function() {
			sids = sids + "," + $(this).val();
		}); */
		//评价标签
		var tids = "-1";
		$("#tag input:checked").each(function() {
			tids = tids + "," + $(this).val();
		});
		var tagservice = "-1";
    	$("#tagservice input:checked").each(function() {
    		tagservice = tagservice + "," + $(this).val();
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
			url : 'auction/rmbProductController/addProductDetails.htm?attrIds='+attrIds+'&tids='+tids+'&tagservice='+tagservice+'&pictures1='+pictures1+'&pictures2='+pictures2,  
            contentType:false,
            processData:false,
			data : new FormData($("#addProductDetailsForm")[0]),
			success : function(data) {
				
				 $.ajax({
					method : 'post',
					url : 'auction/rmbProductController/list.htm?type='+type,
					success : function(html) {
						loadHtml(html);	
					}
				}) 
				layer.msg("添加成功");
				
			}
		})
    	
    }
    function checkFormParams(){

		
	}
</script>

