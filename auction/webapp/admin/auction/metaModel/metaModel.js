function addmetaModel(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var nodes = treeObj.getSelectedNodes();
	if(nodes.length==0){
		url='shop/metaModelController/add.htm?pid=0';
	}else{
		var nid=nodes[0].id;
		url='shop/metaModelController/add.htm?pid='+nid;
	}
	edit("auction/metaModel/add.jsp",
	         "addmetaModelForm",
	         url,
	         "添加模块",
	         "shop/metaModelController/list.htm",
	         '模块列表');
}


function editmetaModel() {
	var checks = $(".table input:checked");
    
    if(checks.length==1){
        edit('shop/metaModelController/toEdit.htm?id='+$(checks[0]).val(),
            "editmetaModelForm",
            "shop/metaModelController/edit.htm",
            "修改模块",
            "shop/metaModelController/list.htm",
            '模块列表');
    }else{
        layer.msg("请选择一条数据")
    }
}

function delmetaModel(){
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
            url:'shop/metaModelController/delete.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}
