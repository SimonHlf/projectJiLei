function addLevel() {
    edit("auction/level/level_add.jsp",
         "addLevelForm",
         "levelController/add.htm",
         "添加等级",
         "levelController/getAll.htm",
         '等级列表');
}

function editLevel() {
    var checks = $(".table input:checked");
    
    if(checks.length==1){
        edit('levelController/toEdit.htm?id='+$(checks[0]).val(),
            "editLevelForm",
            "levelController/edit.htm",
            "修改等级",
            "levelController/getAll.htm",
            '等级列表');
    }else{
        layer.msg("请选择一条数据")
    }
}

function delLevel(){
    var ids = "-1";
    var checks = $(".table input:checked");
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    if(checks.length>0){
	    layer.confirm("确认删除吗?",function(index){
	        $.ajax({
	            method:'post',
	            url:'levelController/delete.htm',
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

