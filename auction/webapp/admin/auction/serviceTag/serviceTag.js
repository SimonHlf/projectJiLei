function addServiceTag() {
    edit("auction/serviceTag/serviceTag_add.jsp",
         "addServiceTagForm",
         "shop/serviceTagController/add.htm",
         "添加服务标签",
         "shop/serviceTagController/getAll.htm",
         '服务标签列表');
}

function editServiceTag() {
    var checks = $(".table input:checked");
    
    if(checks.length==1){
        edit('shop/serviceTagController/toEdit.htm?id='+$(checks[0]).val(),
            "editServiceTagForm",
            "shop/serviceTagController/edit.htm",
            "修改服务标签",
            "shop/serviceTagController/getAll.htm",
            '服务标签列表');
    }else{
        layer.msg("请选择一条数据")
    }
}

function delServiceTag(){
    var ids = "-1";
    var checks = $(".table input:checked");
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    if(checks.length>0){
	    layer.confirm("确认删除吗?",function(index){
	        $.ajax({
	            method:'post',
	            url:'shop/serviceTagController/delete.htm',
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

