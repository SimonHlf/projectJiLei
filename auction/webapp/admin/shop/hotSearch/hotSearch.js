
function addHotSearch() {
    openDialog('shop/hotSearch/add_hotSearch.jsp',function(index){
        var result = required("addHotSearchForm");
        var name = $("#name").val();
        if(result){//提交表单
	        $.ajax({
	            method:'post',
	            url:'auction/hotSearch/findByName.htm',
	            data:{name:name},
	            success:function (data) {
	            	if(data==0){
	            		layer.msg("热门搜索词已存在!");
	            		return;
	            	}else{
                        $.ajax({
                            method:'post',
                            url:'auction/hotSearch/insertHotSearch.htm',
                            cache: false,  
                            contentType:false,
                            processData:false,
                            data:new FormData($("#addHotSearchForm")[0]),
                            success:function (data) {
                            	layer.msg("添加完成！");
                            	loadHtml(data);
                                layer.close(index)
                            }
                        })
	            	}
	            }
	        })
    	}
    });
}


function editHotSearch() {
    var checks = $(".table input:checked");
    if(checks.length==0){
    	layer.msg("请选择一条数据！")
    	return false;
    }
    if(checks.length>1){
    	layer.msg("请选择一条数据！")
    	return false;
    }
    if(checks){
        openDialog('auction/hotSearch/toUpdate.htm?id='+$(checks[0]).val(),function(index){
            var result = required("editHotSearchForm");
            var name = $("#name").val();
            if(result){//提交表单
            	$.ajax({
    	            method:'post',
    	            url:'auction/hotSearch/findByName.htm',
    	            data:{name:name},
    	            success:function (data) {
    	            	if(data==0){
    	            		layer.msg("热门搜索词已存在!");
    	            		return;
    	            	}else{
    	            		$.ajax({
    	                        method:'post',
    	                        url:'auction/hotSearch/updateHotSearch.htm',
    	                        async: false, 
    	                        cache: false,
    	                        contentType:false,
    	                        processData:false,
    	                        data:new FormData($("#editHotSearchForm")[0]),
    	                        success:function (data) {
    	                            layer.msg("修改完成");
    	                            loadHtml(data);
    	                            layer.close(index)
    	                        }
    	                    })
    	            	}
    	            }
    	        })
            }
        });
    }
}

function delHotSearch(){
	var checks = $(".table input:checked");
	if(checks.length==0){
		layer.msg("请至少选择一条数据！")
    	return false;
	}
    var ids = "-1";
    $(".table input:checked").each(function () {
        ids = ids + "," + $(this).val();
    });

    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'auction/hotSearch/delHotSearch.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

