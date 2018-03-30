function addAuction(){
	 $.ajax({
         method:'post',
         url:'product/productInfo/toAddProduct.htm',  
         cache:false,
         contentType:false,
         processData:false,
         success:function (data) {
         	loadHtml(data);
         }
     })
}

function add(id){
	$.ajax({
		type:'post',
        url:'product/productInfo/testAdd.htm',
        data:{id:id},
        success:function (data) {
        	if(data==0){
        		layer.msg("本商品有正在进行的拍卖或者未开奖的拍卖或者已拍卖出去，不能新增设置数据!");
        		return ;
        	}else{
        		$.ajax({
        	        method:'post',
        	        url:'product/productInfo/toSet.htm',  
        	        data:{id:id},
        	        success:function (data) {
        	        	loadHtml(data);
        	        }
        	    })
        	}
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
		url : 'product/productInfo/toAdd.htm',
		data : {
			"cid" : cid,
			"type": type
		},
		success : function(data) {
			loadHtml(data);
		}
	})
	
}

function setting(id){
	 $.ajax({
        method:'post',
        url:'product/productInfo/setting.htm',
        data:{id:id},
        success:function (data) {
            loadHtml(data);
        },
        error:function(){
        	layer.msg('出现异常，请联系管理员')
        }
	 })
}

function yes(){
	$.ajax({
		type:"post",
		url:"product/productInfo/add.htm",
		data:new FormData($("#addAuctionForm")[0]),
        cache:false,
        contentType:false,
        processData:false,
		success:function(data){
			loadHtml(data);
		},
        error:function(){
		    alert("出现异常，请联系管理员");
        }
	})
}


function updateAuction(){
	var checks=$(".table input:checked")
	if(checks.length==0){
		layer.msg("请选择一条数据");
		return false;
	}
    if(checks.length>1){
    	layer.msg("请选择一条数据");
    	return false;
    }
    
    var id=$(checks[0]).val();
    
    if(checks){
    	$.ajax({
    		type:'post',
            url:'product/productInfo/findByShelf.htm',
            data:{ids:id},
            success:function (data) {
            	if(data==1){
            		layer.msg("只能修改已下架并且未成交商品!");
            		return ;
            	}else{
            		 $.ajax({
            	         type:'post',
            	         url:'product/productInfo/toUpdatePage.htm?id='+id,  
            	         cache:false,
            	         success:function (data) {
            	         	loadHtml(data);
            	         },error:function(a,b){
            	        	 console.log(a);
            	        	 console.log(b);
            	        	 alert(a.responseText)
            	         }
            	     })
            	}
            }
        })
    }
}

function update(obj){
	var checks=$(".table input:checked")
	if(checks.length==0){
		layer.msg("请选择一条数据");
		return false;
	}
    if(checks.length>1){
    	layer.msg("请选择一条数据");
    	return false;
    }
    
    var id=$(checks[0]).val();
    if(checks){
    	$.ajax({
    		type:'post',
            url:'product/productInfo/testEdit.htm',
            data:{id:id},
            success:function (data) {
            	if(data==0){
            		layer.msg("商品在竞拍时间内或者已经拍卖结束，不能修改!");
            		return ;
            	}else{
            		 $.ajax({
            	         type:'post',
            	         url:'product/productInfo/editSetUp.htm?id='+id,  
            	         cache:false,
            	         success:function (data) {
            	         	loadHtml(data);
            	         },error:function(a,b){
            	        	 console.log(a);
            	        	 console.log(b);
            	        	 alert(a.responseText)
            	         }
            	     })
            	}
            }
        })
    }
}

function delAuction(){
	var checks=$(".table input:checked")
	if(checks.length==0){
		layer.msg("请至少选择一条数据");
		return false;
	}
    var id="";
    $(".table input:checked").each(function () {
        id += $(this).val()+",";
    });
    $.ajax({
        method:'post',
        url:'product/productInfo/findByShelf.htm',
        data:{ids:id},
        success:function (data) {
        	if(data==1){
        		layer.msg("只能删除已下架商品并且未成交的数据!");
        		return ;
        	}else{
        		layer.confirm("确认删除吗?",function(index){
        	        $.ajax({
        	            method:'post',
        	            url:'product/productInfo/delete.htm',
        	            data:{ids:id},
        	            success:function (data) {
        	                loadHtml(data);
        	                layer.close(index)
        	            }
        	        })
        	    });
        	}
        }
    })
}

function fh(){
	$.ajax({
        method:'post',
        url:'product/productInfo/list.htm',
        success:function (data) {
            loadHtml(data);
        }
    })
}

function del(obj){
	var checks=$(".table input:checked")
	if(checks.length==0){
		layer.msg("请至少选择一条数据");
		return false;
	}
    var id="";
    $(".table input:checked").each(function () {
        id += $(this).val()+",";
    });
    $.ajax({
        method:'post',
        url:'product/productInfo/findByTime.htm',
        data:{ids:id},
        success:function (data) {
        	if(data==0){
        		layer.msg("当前设置在拍卖时间内，不能进行删除操作!");
        		return ;
        	}else{
        		layer.confirm("确认删除吗?",function(index){
        	        $.ajax({
        	            method:'post',
        	            url:'product/productInfo/del.htm',
        	            data:{ids:id,id:obj},
        	            success:function (data) {
        	                loadHtml(data);
        	                layer.close(index)
        	            }
        	        })
        	    });
        	}
        }
    })
}

function shelf(id,type){
	var str = "";
	$.ajax({
        method:'post',
        url:'product/productInfo/updateShelf.htm',
        data:{id:id,shelf:type},
        success:function (data) {
        	if(data==0){
        		if(type==2){
        			layer.msg("下架成功!");
        			str = "<button class='btn btn-success' onclick='shelf("+id+",1);'>上架</button>";
        			$("#operation_"+id).html(str);
        			$("#shelf_"+id).html("已下架");
        		}else{
        			layer.msg("上架成功!");
        			str = "<button class='btn btn-danger' onclick='shelf("+id+",2);'>下架</button>";
        			$("#operation_"+id).html(str);
        			$("#shelf_"+id).html("已上架");
        		}
        		
        	}else if(data==2){
        		layer.msg("下架失败，当前商品正在进行拍卖，不能操作");
        	}else if(data==3){
        		layer.msg("上架失败，请先添加拍卖设置");
        	}else{
        		layer.msg("下架失败，请联系管理员");
        	}
        }
    })
}

function searchItem() {
    $.ajax({
        method:'post',
        url:'product/productInfo/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchItemForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}

function details(id,auId){
	$.ajax({
        method:'post',
        url:'auction/auctionLog/list.htm',
        data:{setUpId:id,auctionId:auId},
        success:function (data) {
            loadHtml(data);
        }
    });
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

function copyLink(id,upId){
	var Url2=document.getElementById("link_"+id);
	Url2.select(); // 选择对象
	document.execCommand("Copy");
	layer.msg('已复制好，可粘贴');
}