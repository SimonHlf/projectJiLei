function addType() {
    edit("news/type/add.jsp",
        "addTypeForm",
        "news/type/add.htm",
        "添加新闻分类",
        "news/type/list.htm",
        '新闻分类列表');
}

function editType() {
    var checks = $(".table input:checked");
    if(checks.length>0){
        edit('news/type/edit.htm?id='+$(checks[0]).val(),
            "editTypeForm",
            "news/type/add.htm",
            "修改新闻分类",
            "news/type/list.htm",
            '新闻分类列表');
    }else{
        layer.msg("请选择数据")
    }
}

function delType(){
    var ids = "-1";
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'news/type/del.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

//根据名字查询
function findByName(){
    $.ajax({
        method:'post',
        url:'news/type/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchNewsTypeForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}

function details(cmd){
	$.ajax({
		method:'post',
		url:'news/type/details.htm?id=' + cmd,
		success:function(data){
			layer.msg("分类详情");
			loadHtml(data);
		}
	})
}
