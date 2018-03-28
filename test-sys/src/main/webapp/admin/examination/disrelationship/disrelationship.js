function addDisrelationship(){
    var page = $("#DisrelationshipPage").val();
    edit("examination/disrelationship/add.jsp",
        "addDisrelationshipForm",
        "disrelationship/add.htm?page="+page,
        "添加分销率设置",
        "disrelationship/list.htm?page="+page,
        '分销率设置列表');
}


function delDisrelationship(){
    var page = $("#DisrelationshipPage").val();
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
            url:'disrelationship/delete.htm',
            data:{ids:ids,page:page},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

function updateDisrelationship(){
    var page = $("#DisrelationshipPage").val();
    var checks = $(".table input:checked");
    if(checks.length != 1){
        layer.msg("请选择一条数据");
        return;
    }
    edit('disrelationship/edit.htm?id=' + $(checks[0]).val(),
        "editDisrelationshipForm",
        "disrelationship/update.htm?page="+page,
        "修改分销率设置",
        "disrelationship/list.htm?page="+page,
        '分销率设置列表');
}


//上级
function superior(userId,cmd){
    var url;
    if(cmd == 1){
        url = 'disrelationship/superior.htm';
    } else {
        url = 'disrelationship/subordinate.htm';
    }
    $.ajax({
        type:'post',
        url:url,
        data:{
            id:userId
        },
        success:function(data){
            loadHtml(data);
        },
        error:function(){
            alert("网络错误,请稍后再试");
        }
    })

}
