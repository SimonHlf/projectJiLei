function addEvaluationTag() {
	 edit("shop/evaluationTag/add.jsp",
	         "addEvaluationTagForm",
	         "shop/evaluationTag/add.htm",
	         "添加评价标签",
	         "shop/evaluationTag/list.htm",
	         '评价标签列表');
}


function editEvaluationTag() {
var checks = $(".table input:checked");
    
    if(checks.length==1){
        edit('shop/evaluationTag/toEdit.htm?id='+$(checks[0]).val(),
            "editEvaluationTagForm",
            "shop/evaluationTag/edit.htm",
            "修改评价标签",
            "shop/evaluationTag/list.htm",
            '评价标签列表');
    }else{
        layer.msg("请选择一条数据")
    }
}

function delEvaluationTag(){
	var checks=$(".table input:checked")
	if(checks.length==0){
		layer.msg("请至少选择一条数据");
		return false;
	}
	
    var ids = "-1";
    $(".table input:checked").each(function () {
        ids = ids + "," + $(this).val();
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'shop/evaluationTag/del.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}


