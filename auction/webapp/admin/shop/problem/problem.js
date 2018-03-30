function addAuction(){
	var result = required("addNewsForm");
	if (result) {// 提交表单
		$.ajax({
			method : 'post',
			url : 'auction/auctionProblem/add.htm',
			cache : false,
			contentType : false,
			processData : false,
			data : new FormData($("#addNewsForm")[0]),
			success : function(data) {
				layer.msg("添加完成!");
				loadHtml(data);
				/*openConfirm("添加完成，继续添加吗？", {
					icon : 3,
					title : '提示'
				}, function(index1) {
					$("#addNewsForm")[0].reset()
					layer.close(index1)
				}, function(index1) {
					loadHtml(data);
					layer.close(index1)
					layer.close(index)
				});*/
			}
		});
	}
   
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
        openDialog('auction/auctionProblem/toUpdatePage.htm?id='+id,'','',700,function(index){
            var result = required("addNewsForm");
            if(result){//提交表单
                $.ajax({
                    method:'post',
                    url:'auction/auctionProblem/add.htm',
                    cache:false,
                    contentType:false,
                    processData:false,
                    data:new FormData($("#addNewsForm")[0]),
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
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'auction/auctionProblem/delete.htm',
            data:{ids:id},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

function find(id){
	 $.ajax({
         method:'post',
         url:'auction/auctionProblem/detail.htm',
         data:{id:id},
         success:function (data) {
             loadHtml(data);
         }
     })
}
