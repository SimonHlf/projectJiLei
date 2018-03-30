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
				<input type="hidden" value="${setUp.auctionId }" name="auctionId">
				<input type="hidden" value="${setUp.id }" name="id">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">起拍价</label>
					<div class="col-sm-9">
						<input class="form-control" id="startPrice" value="${setUp.startPrice }" onkeyup="clearNoNum(this)" maxlength="15" name="startPrice" 
							placeholder="起拍价" required>
						 
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">最高价</label>
					<div class="col-sm-9">
						<input class="form-control" id="hightPrice" value="${setUp.hightPrice }" maxlength="15" name="hightPrice" onkeyup="clearNoNum(this)"
							placeholder="最高价" required>
						 
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">每次出价增加幅度</label>
					<div class="col-sm-9">
						<input class="form-control" id="ladder" value="${setUp.ladder }"  maxlength="15" name="ladder"  onkeyup="clearNoNum(this)"
							placeholder="每次出价增加幅度" required>
						 
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">保证金</label>
					<div class="col-sm-9">
						<input class="form-control" id="bond" value="${setUp.bond}" name="bond" maxlength="15"  onkeyup="clearNoNum(this)"
							placeholder="保证金" required>
					</div>
				</div>
              
                <div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">竞拍开始时间</label>
					<div class="col-sm-9">
						<input class="form-control" name="startTime" value="${setUp.startTime }" id="startTime" onclick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm',minDate:'${start }'})" style="z-index:999;" placeholder="竞拍开始时间" required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">竞拍结束时间</label>
					<div class="col-sm-9">
						<input class="form-control" id="endTime" value="${setUp.endTime }" name="endTime"
							placeholder="竞拍结束时间" onclick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm',minDate:'${start }'})" required>
					</div>
				</div>
				<div class="widget-buttons">
                		<button type="button" onclick="addProductDetails(${setUp.auctionId })" class="btn btn-info btn-ok">保存拍卖设置信息</button>
            	</div>
			</form>
		</div>
	</div>
</div>
<script>
	//保存商品信息
    function addProductDetails(id){
    	var startPrice = $("#startPrice").val();//起拍价
    	var ladder = $("#ladder").val();//每次加价幅度
    	var bond = $("#bond").val();//保证金
    	var startTime = $("#startTime").val();//竞拍开始时间
    	var endTime = $("#endTime").val();//竞拍结束时间
    	if(startPrice=='' || startPrice==null){
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
    	}
		
    	$.ajax({
			method : 'post',
			url : 'product/productInfo/addSetUp.htm',  
            contentType:false,
            processData:false,
			data : new FormData($("#addAuctionForm")[0]),
			success : function(data) {
				if(data==0){
					layer.msg("修改成功");
					 $.ajax({
						method : 'post',
						url : 'product/productInfo/setting.htm',
						data:{id:id},
						success : function(html) {
							loadHtml(html);	
						}
					}) 
				}
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