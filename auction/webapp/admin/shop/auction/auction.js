function addAuction(){
 
    openDialog('shop/auction/add.jsp',function(index){
        var result = required("addAuctionForm");
        if(result){//提交表单
            $.ajax({
                method:'post',
                url:'auction/auctionLog/add.htm',  
                cache:false,
                contentType:false,
                processData:false,
                data:new FormData($("#addAuctionForm")[0]),
                success:function (data) {
                	layer.msg("添加完成!");
                	loadHtml(data);
                	layer.close(index)
                }
            })
        }
    });
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
        openDialog('auction/auctionLog/toUpdatePage.htm?id='+id,function(index){
            var result = required("addAuctionForm");
            if(result){//提交表单
                $.ajax({
                    method:'post',
                    url:'auction/auctionLog/add.htm',
                    cache:false,
                    contentType:false,
                    processData:false,
                    data:new FormData($("#addAuctionForm")[0]),
                    success:function (data) {
                        layer.msg("修改完成");
                        loadHtml(data);
                        layer.close(index)
                    }
                })
            }
        });
    }
}

function delAuction(proId,setId){
	var checks=$(".table input:checked")
	if(checks.length==0){
		layer.msg("请至少选择一条数据");
		return false;
	}
    var id="";
    $(".table input:checked").each(function () {
        id += $(this).val()+",";
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'auction/auctionLog/delete.htm',
            data:{ids:id,auctionId:proId,setUpId:setId},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

function cj(id,flag,setId,proId){
	 $.ajax({
         method:'post',
         url:'auction/auctionLog/business.htm',
         data:{id:id,flag:flag},
         success:function (data) {
        	 if(flag==0){
        		 $("#status_"+id).html("未成交");
        	 }else if(flag==1){
        		 $("#status_"+id).html("已成交");
        		 $.ajax({
        	            method:'post',
        	            url:'auction/auctionLog/list.htm',
        	            data:{auctionId:proId,setUpId:setId},
        	            success:function (data) {
        	                loadHtml(data);
        	            }
        	        })
        		 $("#an_"+id).html("");
        	 }else if(flag==2){
        		 $("#status_"+id).html("撤回");
        		 $("#an_"+id).html("");
        	 }
             layer.close(index)
         }
     });
}

function searchItem() {
    $.ajax({
        method:'post',
        url:'auction/auctionLog/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchItemForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}

function fh(id){
	 $.ajax({
        method:'post',
        url:'product/productInfo/setting.htm',
        data:{id:id},
        success:function (data) {
            loadHtml(data);
        }
    });
}