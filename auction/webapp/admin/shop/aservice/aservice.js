function addService() {
    openDialog('shop/aservice/add.jsp',function(index){
        var result = required("addServiceForm");
        if(result){//提交表单
            $.ajax({
                method:'post',
                url:'shop/aservice/add.htm',
                cache:false,
                contentType:false,
                processData:false,
                data:new FormData($("#addServiceForm")[0]),
                success:function (data) {
                	layer.msg("添加完成!");
                	loadHtml(data);
                	layer.close(index);
                    /*openConfirm("添加完成，继续添加吗？",{icon: 3, title:'提示'},function(index1){
                        $("#addServiceForm")[0].reset()
                        layer.close(index1)
                    },function(index1){
                        loadHtml(data);
                        layer.close(index1)
                        layer.close(index)
                    });*/
                }
            })
        }
    });
}


function editService() {
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
        openDialog('shop/aservice/edit.htm?id='+id,function(index){
            var result = required("editServiceForm");
            if(result){//提交表单
                $.ajax({
                    method:'post',
                    url:'shop/aservice/add.htm',
                    cache:false,
                    contentType:false,
                    processData:false,
                    data:new FormData($("#editServiceForm")[0]),
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

function delService(){
	var checks=$(".table input:checked")
	if(checks.length==0){
		layer.msg("请至少选择一条数据");
		return false;
	}
    var ids = "";
    $(".table input:checked").each(function () {
        ids +=  $(this).val()+",";
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'shop/aservice/del.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}


