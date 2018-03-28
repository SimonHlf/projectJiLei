function addSpecial() {
    openDialog('news/special/add.jsp',function(){
        var result = required("addSpecialForm");
        if(result){//提交表单
            $.ajax({
                method:'post',
                url:'news/special/add.htm',
                cache:false,
                contentType:false,
                processData:false,
                data:new FormData($("#addSpecialForm")[0]),
                success:function (data) {
                    loadHtml(data);
                    layer.msg("添加完成。");
                    layer.closeAll();
                }
            })
        }
    });
}

function editSpecial() {
    var checks = $(".table input:checked");
    if(checks){
        openDialog('news/special/edit.htm?id='+$(checks[0]).val(),function(index){
            var result = required("editSpecialForm");
            if(result){//提交表单
                $.ajax({
                    method:'post',
                    url:'news/special/add.htm',
                    cache:false,
                    contentType:false,
                    processData:false,
                    data:new FormData($("#editSpecialForm")[0]),
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

function delSpecial(){
    var ids = "-1";
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'news/special/del.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

//根据名称查询
function findByName(){
	var name=$("#name").val();
	if(name == ""){
		layer.msg("请选择查询条件");
	}
	$.ajax({
		method:'post',
		url:'news/special/findByName.htm',
		data:{
			name:name
		},
		success:function(data){
			layer.msg("查询成功");
			$("#table").html(data);
		}
	})
}