//添加现金商品
function addRmbProduct() {
	$.ajax({
		method : 'post',
		url : 'auction/rmbProductController/toAddProduct.htm?type=1',
		success : function(data) {
			loadHtml(data);
		}
	})
    
}
//添加积分商品
function addJiFenProduct(){
	$.ajax({
		method : 'post',
		url : 'auction/rmbProductController/toAddProduct.htm?type=3',
		success : function(data) {
			loadHtml(data);
		}
	})
}
//添加金币商品
function addJinBiProduct(){
	$.ajax({
		method : 'post',
		url : 'auction/rmbProductController/toAddProduct.htm?type=2',
		success : function(data) {
			loadHtml(data);
		}
	})
}
//添加优乐购商品
function addYouLeProduct(){
	$.ajax({
		method : 'post',
		url : 'auction/rmbProductController/toAddProduct.htm?type=4',
		success : function(data) {
			loadHtml(data);
		}
	})
}
//修改
function editRmbProduct() {
    var checks = $(".table input:checked");
    
    if(checks.length==1){
    	if(isDialog==1) {
        	openDialog('auction/rmbProductController/toEdit.htm?id='+$(checks[0]).val(), function () {
            	var tids = "-1";
            	$("#tag input:checked").each(function() {
            		tids = tids + "," + $(this).val();
            	});
            	var tagservice = "-1";
            	$("#tagservice input:checked").each(function() {
            		tagservice = tagservice + "," + $(this).val();
            	});
                editSave("auction/rmbProductController/edit.htm?tids="+tids,"editRmbProductForm");
            }, "修改商品");
        }else{
            var tpl = $("#editTpl").html();
            $.get('auction/rmbProductController/toEdit.htm?id='+$(checks[0]).val(),function(data){
                var data1 = {"title":"修改商品","body":$(data).find(".widget-body").html(),
                    "back":"ajaxLoad('auction/rmbProductController/list.htm','商品列表')"};
                layui.laytpl(tpl).render(data1, function(html){
                    loadHtml(html);
                    
                    $("#mainContent").find(".btn-ok").click(function () {
                    	var tids = "-1";
                    	$("#tag input:checked").each(function() {
                    		tids = tids + "," + $(this).val();
                    	});
                    	var tagservice = "-1";
                    	$("#tagservice input:checked").each(function() {
                    		tagservice = tagservice + "," + $(this).val();
                    	});
                        editSave("auction/rmbProductController/edit.htm?tids="+tids,"editRmbProductForm");
                    })
                });
            });
        }
        
    	
    	
    }else{
        layer.msg("请选择一条数据")
    }
}
//删除
function delRmbProduct(){
    var ids = "-1";
    var checks = $(".table input:checked");
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    if(checks.length>0){
	    layer.confirm("确认删除吗?",function(index){
	        $.ajax({
	            method:'post',
	            url:'auction/rmbProductController/delete.htm',
	            data:{ids:ids},
	            success:function (data) {
	                loadHtml(data);
	                layer.close(index)
	            }
	        })
	    });
    }else{
    	 layer.msg("请至少选择一条数据")
    }
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
//上架
function up(id,verify,type,integralId) {

	if(type==1){
		$.ajax({
			method : 'post',
			url : 'auction/rmbProductController/change.htm',
			data : {
				"id" : id,
				"status" : 1
			},
			success : function(data) {
				loadHtml(data);
			}
		})
	}else{
		if(verify==null){
			layer.msg("商品尚未提交审核，审核通过才可以上架");
		}else if(verify==0){
			layer.msg("商品尚未审核，审核通过才可以上架");
		}else if(verify==2){
			layer.msg("商品审核不通过，请重新提交审核");
		}else if(type==3 && integralId==undefined){
			layer.msg("请添加竞拍信息，添加竞拍信息之后可进行上架操作");
		}else{
			$.ajax({
				method : 'post',
				url : 'auction/rmbProductController/change.htm',
				data : {
					"id" : id,
					"status" : 1
				},
				success : function(data) {
					loadHtml(data);
				}
			})
		}
	}	

}
//下架
function down(id) {

	$.ajax({
		method : 'post',
		url : 'auction/rmbProductController/change.htm',
		data : {
			"id" : id,
			"status" : 0
		},
		success : function(data) {
			loadHtml(data);
		}
	})
}
/*//是否可以兑换
function exchange(id,exchange) {

	$.ajax({
		method : 'post',
		url : 'auction/rmbProductController/exchange.htm',
		data : {
			"id" : id,
			"exchange" : exchange
		},
		success : function(data) {
			loadHtml(data);
		}
	})
}*/
//查询
function searchProduct(type) {
	var name = $("#name").val();
	var cid = $("#s2").val();
	var status = $("#status option:selected").val();
	$.ajax({
		method : 'post',
		url : 'auction/rmbProductController/list.htm',
		data : {
			"name" : name,
			"categoryid" : cid,
			"status" : status,
			"type":type
		},
		success : function(data) {
			loadHtml(data);
		}
	})
}
//点击添加商品
function addProduct(){
	$.ajax({
		method : 'post',
		url : 'auction/rmbProductController/toAddProduct.htm',		
		success : function(data) {
			loadHtml(data);
		}
	})
}

//点击编辑商品
function editProduct() {
	var checks = $(".table input:checked");
	if(checks.length==0){
		layer.msg("请选择一条数据");
		return false;
	}
	if(checks.length>1){
		layer.msg("请选择一条数据");
		return false;
	}
	var id=$(checks[0]).val();
	$.ajax({
		method : 'post',
		url : 'auction/rmbProductController/toEditProductDetails.htm?productId=' + id,		
		success : function(data) {
			loadHtml(data);
			layer.msg("积分商品、金币商品、优乐购商品，修改之前需要进行商品下架操作，修改商品之后需要重新提交审核");
		}
	})
}


//创建此类商品
function setProduct(){
	var cid=$("#s2").val();
	var type=$("#type").val();
	if(cid == null||cid==""){
		alert("请选择商品类别");
		return;
	}
	$.ajax({
		method : 'post',
		url : 'auction/rmbProductController/toAddProductDetail.htm',
		data : {
			"cid" : cid,
			"type": type
		},
		success : function(data) {
			loadHtml(data);
		}
	})
	
}
//去修改商品分类
function backEditCate(pid){
	$.ajax({
		method : 'post',
		url : 'auction/rmbProductController/backEditCate.htm',
		data : {
			"pid" : pid,
		},
		success : function(data) {
			loadHtml(data);
		}
	})
}
//修改商品分类
function sureEditCate(pid){
	var cid=$("#s2").val();
	if(cid == null||cid==""){
		alert("请选择商品类别");
		return;
	}
	$.ajax({
		method : 'post',
		url : 'auction/rmbProductController/editCate.htm',
		data : {
			"pid" : pid,"cid":cid
		},
		success : function(data) {
			loadHtml(data);
		}
	})
}

//添加规格  弹窗
function addPAttrValues(pid){
	var cid=$("#s2").val();
	var attrIds="-1";
	$("#attrIds input:checked").each(function() {
		attrIds = attrIds + "," + $(this).val();
	});
	
	$.ajax({
        method:'post',
        url:'auction/rmbProductController/toAddProductAttr.htm',
        data:{cid:cid,pid:pid,attrIds:attrIds},
        success:function (html) {
       	 layer.open({
				 type:1,
				 title:"添加属性",
				 skin:'layui-layer-rim',//加上边框
				 area:['800px','600px'],//宽高
				 content:html,
				 btn:['确定','取消'],
				 yes:function(index){
					 var result = required("addAttrValueProductForm");
						var ids = pid;
						$(".radio input:checked").each(function() {
							ids = ids + "," + $(this).val();
						});
						if (result) {// 提交表单
							$.ajax({
								method : 'post',
								url : 'auction/rmbProductController/addProductAttrValue.htm?ids=' + ids,
								cache : false,
								contentType : false,
								processData : false,
								data : new FormData($("#addAttrValueProductForm")[0]),
								success : function(data) {
									// data=eval("("+data+")");
									var str="";
									for(var i=0;i<data.length;i++){
										str += "<tr>";
										str += "<td>"+ data[i].specName +"</td>";
										str += "<td>"+ data[i].stock +"</td>";
										str += "<td>"+ data[i].parentPrice +"</td>";
										str += "<td>";
										str += "<a onclick='editProductAttr("+data[i].id+" , "+data[i].productId+")'>修改</a>";
										str += "<a onclick='delProductAttr("+data[i].id+" , "+data[i].productId+")'>删除</a>";
										str+="</td></tr>";
									}
									
									$("#pro_attrs").html(str);
								}
							})
						}
						/**/
						layer.close(index); 
				 },
				 no:function(index){
					 
				 }
				
				})
        }
    })
}


//修改规格
function editProductAttr(id,pid) {
	var attrIds="-1";
	$("#attrIds input:checked").each(function() {
		attrIds = attrIds + "," + $(this).val();
	});
	$.ajax({
        method:'post',
        url:'auction/rmbProductController/toEeditProductAttr.htm',
        data:{id:id,pid:pid,attrIds:attrIds},
        success:function (html) {
       	 layer.open({
				 type:1,
				 title:"修改属性",
				 skin:'layui-layer-rim',//加上边框
				 area:['800px','600px'],//宽高
				 content:html,
				 btn:['确定','取消'],
				 yes:function(index){
					 var result = required("editAttrValueProductForm");
						var ids = pid;
						$(".radio input:checked").each(function() {
							ids = ids + "," + $(this).val();
						});
						if(result){//提交表单
						    $.ajax({
						        method:'post',
						        url:'auction/rmbProductController/editProductAttrValue.htm?ids=' + ids,
						        cache:false,
						        contentType:false,
						        processData:false,
						        data:new FormData($("#editAttrValueProductForm")[0]),
						        success:function (data) {
						        	// data=eval("("+data+")");
									var str="";
									for(var i=0;i<data.length;i++){
										str += "<tr>";
										str += "<td>"+ data[i].specName +"</td>";
										str += "<td>"+ data[i].stock +"</td>";
										str += "<td>"+ data[i].parentPrice +"</td>";
										str += "<td>";
										str += "<a onclick='editProductAttr("+data[i].id+" , "+data[i].productId+")'>修改</a>";
										str += "<a onclick='delProductAttr("+data[i].id+" , "+data[i].productId+")'>删除</a>";
										str+="</td></tr>";
									}
									
									$("#pro_attrs").html(str);
						        }
						    })
						}
						/**/
						layer.close(index); 
				 },
				 no:function(index){
					 
				 }
				
				})
        }
    })
   
}



//删除规格
function delProductAttr(id,pid){
    
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'auction/rmbProductController/delProductAttr.htm',
            data:{pid:pid,id:id},
            success:function (data) {
            	layer.close(index);
            	// data=eval("("+data+")");
				var str="";
				for(var i=0;i<data.length;i++){
					str += "<tr>";
					str += "<td>"+ data[i].specName +"</td>";
					str += "<td>"+ data[i].stock +"</td>";
					str += "<td>"+ data[i].parentPrice +"</td>";
					str += "<td>";
					str += "<a onclick='editProductAttr("+data[i].id+" , "+data[i].productId+")'>修改</a>";
					str += "<a onclick='delProductAttr("+data[i].id+" , "+data[i].productId+")'>删除</a>";
					str+="</td></tr>";
				}
				
				$("#pro_attrs").html(str);
            }
        })
    });
}

//删除图片
function deleteImg(name){
	
	
}
//添加竞拍信息
function addAuction(pid){
	$.ajax({
		method : 'post',
		url : 'auction/rmbProductController/toAddJinfenAuction.htm',
		data : {
			"pid" : pid
		},
		success : function(data) {
			loadHtml(data);
		}
	})
}
//修改竞拍信息
function editAuction(pid){
	$.ajax({
		method : 'post',
		url : 'auction/rmbProductController/toEddJinfenAuction.htm',
		data : {
			"pid" : pid
		},
		success : function(data) {
			loadHtml(data);
		}
	})
}
//提交平台审核
function setSubmit(attr3,type,integralId){
	//var ids=$(checks[0]).val();

			var ids = "-1";
		    var checks = $(".table input:checked");
		    if(type==3){
		    	if(checks.length==1){
		    		if($(checks[0]).attr("name")==""){
			    		layer.msg("请上传竞拍信息");
			    	}else{
			    		var ids=$(checks[0]).val();
				        $.ajax({
				            method:'post',
				            url:'auction/rmbProductController/setSubmit.htm',
				            data:{ids:ids,attr3:attr3},
				            success:function (data) {
				                loadHtml(data);
				                
				            }
				        })
			    	}
		    	}else{
		    		layer.msg("请选择一条数据")
		    	}
		   }else{
			   var ids="-1";
			   $(".table input:checked").each(function () {
			       ids = ids + "," + $(this).val();
			    }); 
			   $.ajax({
		            method:'post',
		            url:'auction/rmbProductController/setSubmit.htm',
		            data:{ids:ids,attr3:attr3},
		            success:function (data) {
		                loadHtml(data);
		                
		            }
		        })
			   
		    }
}

//获取商品路径
function geturl(str){
	layer.open({
		  type: 1,
		  title:"复制框中数字即可",
		  skin: 'layui-layer-rim', //加上边框
		  area: ['420px', '240px'], //宽高
		  btn: ['确定'], 
		  content: '<input value="'+str+'" >',
		  yes:function (index){
			   		/* console.log(flag); */
			   		
			   		layer.close(index);		
		   } 
		})
}


function queryVerify(message){
	layer.open({
		  type: 1,
		  title:"审核不通过原因",
		  skin: 'layui-layer-rim', //加上边框
		  area: ['420px', '300px'], //宽高
		  btn: ['确定'], 
		  content: message,
		  yes:function (index){
			   		/* console.log(flag); */
			   		
			   		layer.close(index);		
		   } 
		})
}


function copyLink(id){
	var Url2=document.getElementById("link_"+id);
	Url2.select(); // 选择对象
	document.execCommand("Copy");
	layer.msg('已复制好，可粘贴');
}