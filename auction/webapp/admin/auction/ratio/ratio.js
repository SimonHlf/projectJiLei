function addRatio() {
    edit("auction/ratio/ratio_add.jsp",
         "addRatioForm",
         "ratioController/add.htm",
         "添加积分比例",
         "ratioController/getAll.htm",
         '积分比例列表');
}

function editRatio() {
    var checks = $(".table input:checked");
    
    if(checks.length==1){
        edit('ratioController/toEdit.htm?id='+$(checks[0]).val(),
            "editRatioForm",
            "ratioController/edit.htm",
            "修改积分比例",
            "ratioController/getAll.htm",
            '积分比例列表');
    }else{
        layer.msg("请选择一条数据")
    }
}

function delRatio(){
    var ids = "-1";
    var checks = $(".table input:checked");
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    if(checks.length>0){
	    layer.confirm("确认删除吗?",function(index){
	        $.ajax({
	            method:'post',
	            url:'ratioController/delete.htm',
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

