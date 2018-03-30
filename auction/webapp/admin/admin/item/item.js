function addItem() {
    edit("admin/item/add.jsp",
         "addItemForm",
         "item/add.htm?cmd=0",
         "添加数据字典",
         "item/list.htm?cmd=0",
         '字典列表');
}

function editItem() {
    var checks = $(".table input:checked");
    if(checks.length>0){
        edit('item/edit.htm?id='+$(checks[0]).val(),
            "editItemForm",
            "item/add.htm?cmd=0",
            "修改数据字典",
            "item/list.htm?cmd=0",
            '字典列表');
    }else{
        layer.msg("请选择数据")
    }
}

function editInfo() {
    var checks = $(".table input:checked");
    if(checks.length>0){
        edit('item/editInfo.htm?id='+$(checks[0]).val(),
            "editItemForm",
            "item/addInfo.htm?cmd=0",
            "修改门店分类",
            "item/list.htm?cmd=0",
            '门店分类列表');
    }else{
        layer.msg("请选择数据")
    }
}

function delItem(){
    var ids = "-1";
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'item/del.htm?cmd=0',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

function searchItem() {
    $.ajax({
        method:'post',
        url:'item/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchItemForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}

function details(cmd){
	$.ajax({
		method:'post',
		url:'item/details.htm?id=' + cmd,
		
		success:function(data){
			loadHtml(data);
		}
	})
}