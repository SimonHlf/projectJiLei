function addItem() {
    openDialog('aboutUs/progress/add.jsp',function(index){
        var result = required("addItemForm");
        if(result){//提交表单
            $.ajax({
                method:'post',
                url:'companybasic/progress/add.htm',  
                cache:false,
                contentType:false,
                processData:false,
                data:new FormData($("#addItemForm")[0]),
                success:function (data) {
            		layer.msg("添加完成!");
                	layer.close(index);
                	loadHtml(data);
                }
            })
        }
    });
}

function editItem() {
    
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
    	 openDialog('companybasic/progress/toUpdatePage.htm?id='+id,function(index){
    	        var result = required("addItemForm");
    	        if(result){//提交表单
    	            $.ajax({
    	                method:'post',
    	                url:'companybasic/progress/add.htm',  
    	                cache:false	,
    	                contentType:false,
    	                processData:false,
    	                data:new FormData($("#addItemForm")[0]),
    	                success:function (data) {
	                		layer.msg("修改完成!");
	                    	layer.close(index)
	                    	loadHtml(data);
    	                }
    	            })
    	        }
    	    });
    }
}

function delItem(){
    var ids = "";
    $(".table input:checked").each(function () {
       ids += $(this).val()+",";
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'companybasic/progress/delete.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

function fanhui() {
    $.ajax({
        method:'post',
        url:'companybasic/progress/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        success:function (data) {
            loadHtml(data);
        }
    });
}

function details(cmd){
	$.ajax({
		method:'post',
		url:'companybasic/progress/details.htm?id=' + cmd,
		
		success:function(data){
			loadHtml(data);
		}
	})
	
}
