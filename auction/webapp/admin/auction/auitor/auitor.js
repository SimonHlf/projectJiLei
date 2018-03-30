//平台审核
function updateVerify(id,verify){
	var message=$("#message").val();
    $.ajax({
        method:'post',
        url:'auction/auitorController/updateVerify.htm',
        data:{id:id,verify:verify,message:message},
        success:function (data) {
            loadHtml(data);
            
        }
    })
	
}   
//点击去审核
function auitorProduct(id) {

	$.ajax({
		method : 'post',
		url : 'auction/auitorController/toEditProductDetails.htm?productId=' + id,		
		success : function(data) {
			loadHtml(data);
		}
	})
}

//查询
function searchAuitorProduct(type) {
	var name = $("#name").val();
	var cid = $("#s2").val();
	var status = $("#status option:selected").val();
	var verify=$("#verify option:selected").val();
	$.ajax({
		method : 'post',
		url : 'auction/auitorController/list.htm',
		data : {
			"name" : name,
			"categoryid" : cid,
			"status" : status,
			"type":type,
			"verify":verify
		},
		success : function(data) {
			loadHtml(data);
		}
	})
}

function sc(a) {
	$("#s2").empty();
	if(a!=''){
		$.ajax({
			url : "auction/rmbProductController/select.htm?pid=" + a,
			success : function(data) {
				// var data = eval("(" + data + ")");
				var src="<option value=''>请选择二级分类</option>";
				for (var i = 0; i < data.length; i++) {
					
						src+="<option value='" + data[i].id + "'>"
									+ data[i].shopTypeName + "</option>";
				}
				$("#s2").append(src);
	
			}
		});
	}
}


function setRecommend(type){
	var checks = $(".table input:checked");
	var pid=$(checks[0]).val();
	 if(checks.length==1){
		 $.ajax({
		        method:'post',
		        url:'auction/auitorController/tuijian.htm',
		        data:{productid:pid,type:type},
		        success:function (data) {
		            loadHtml(data);
		            layer.msg("设置成功");
		            
		        }
		    })
	 }else{
		 layer.msg("请选择一条数据")
	 }
}
//点击现金商品推荐首页
function setRmbRecommend(type){
	var checks = $(".table input:checked");
	var pid=$(checks[0]).val();
	 if(checks.length==1){
		 $.ajax({
		        method:'post',
		        url:'auction/auitorController/toAddRmbCommendImg.htm?type='+type+'&pid='+pid, 
		       
		        cache:false,
		        contentType:false,
		        processData:false,
		        success:function (data) {
		        	loadHtml(data);
		        }
		    })
		 
		 
	 }else{
		 layer.msg("请选择一条数据")
	 }
}
function saveRmbComment(){
	var imgs=$("#imgs").val();
	if(imgs==''){
		layer.msg("请上传图片")
	}else{
		$.ajax({
			type:"post",
			url:"auction/auitorController/rmbTuijian.htm",
			data:new FormData($("#addImgForm")[0]),
	        cache:false,
	        contentType:false,
	        processData:false,
			success:function(data){
				if(data.result=="ok"){
					$.ajax({
				        method:'post',
				        url:'auction/auitorController/list.htm?type=1', 
				        success:function (data) {
				        	loadHtml(data);
				        }
				    })
					layer.msg("设置成功");
				}else{
					layer.msg(data.msg);
				}  
			}
		})
	}

}



//积分商品审核页面查看竞拍信息
function queryAuctionInfo(pid){
	$.ajax({
		method : 'post',
		url : 'auction/auitorController/queryAuctionInfo.htm',
		data : {
			"pid" : pid
		},
		success : function(data) {
			loadHtml(data);
		}
	})
}
//现金商品添加图片页面返回按钮
function fanhui(){
	$.ajax({
        method:'post',
        url:'auction/auitorController/list.htm?type=1', 
        success:function (data) {
        	loadHtml(data);
        }
    })
}