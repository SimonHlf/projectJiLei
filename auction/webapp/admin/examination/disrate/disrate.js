function addDisRate(){
    var page = $("#disRatePage").val();
    edit("examination/disrate/add.jsp",
        "addDisRateForm",
        "disrate/add.htm?page="+page,
        "添加分销率设置",
        "disrate/list.htm?page="+page,
        '分销率设置列表');
}

/*function searchItem(){
	  $.ajax({
	        method:'post',
	        url:'disrate/list.htm',
	        cache: false,
	        contentType: false,
	        processData: false,
	        data:new FormData($("#searchItemForm")[0]),
	        success:function (data) {
	            loadHtml(data);
	        }
	    });
}*/


function delDisRate(){
    var page = $("#disRatePage").val();
    var ids = "-1";
    $(".table input:checked").each(function () {
        ids = ids + "," + $(this).val();
    });
    if(ids == "-1"){
        layer.msg("请选择数据");
        return;
    }
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'disrate/delete.htm',
            data:{ids:ids,page:page},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

function updateDisRate(){
    var page = $("#disRatePage").val();
    var checks = $(".table input:checked");
    if(checks.length != 1){
        layer.msg("请选择一条数据");
        return;
    }
    edit('disrate/edit.htm?id=' + $(checks[0]).val(),
        "editDisRateForm",
        "disrate/update.htm?page="+page,
        "修改分销率设置",
        "disrate/list.htm?page="+page,
        '分销率设置列表');
}

function searchItem() {
	$.ajax({
        method:'post',
        url:'disrate/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchItemForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}