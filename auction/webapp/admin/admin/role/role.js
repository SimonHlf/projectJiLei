function addRole() {
    edit("admin/role/add.jsp",
         "addRoleForm",
         "role/add.htm",
         "添加数据字典",
         "role/list.htm",
         '字典列表');
}

function editRole() {
    var checks = $(".table input:checked");
    if(checks.length>0){
        edit('role/edit.htm?id='+$(checks[0]).val(),
            "editRoleForm",
            "role/add.htm",
            "修改数据字典",
            "role/list.htm",
            '字典列表');
    }else{
        layer.msg("请选择数据")
    }
}

function delRole(){
    var ids = "-1";
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'role/del.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

function searchRole() {
    $.ajax({
        method:'post',
        url:'role/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchRoleForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}

function linkMenu(rid){
    $.ajax({
        url:'role/toLinkMenu.htm?id='+rid,
        success:function(data){
            layer.open({
                type:1,
                area:'500px',
                title:'关联菜单',
                fixed:false,
                maxmin:true,
                scrollbar:false,
                content: data,
                btn:['确定','关闭'],
                yes:function () {
                    var treeObj = $.fn.zTree.getZTreeObj("menuTree");
                    var nodes = treeObj.getCheckedNodes(true);
                    var cids = 0;
                    for (var i = 0; i < nodes.length; i++) {
                        cids = cids + "," + nodes[i].id;
                    }
                    $.ajax({
                        method : 'post',
                        url : 'role/saveLink.htm?rid='+rid,
                        data : {
                            ids : cids
                        },
                        success : function() {
                            layer.closeAll();
                            layer.msg("修改完成");
                        }
                    })
                }
            });
        }
    })
}


function linkUser(rid) {
    $.ajax({
        type:'post',
        url:'role/userList.htm',
        data:{
            id:rid
        },
        success:function(data){
            layer.open({
                type:1,
                title:"关联用户",
                skin:'layui-layer-rim',//加上边框
                area:['900px','500px'],//宽高
                btn:['确定','取消'],
                yes:function(index){
                    var ids = "-1";
                    var zeroIds = "-1";
                    $(".relationUser input").not("input:checked").each(function(){
                        zeroIds = zeroIds + "," + $(this).val();
                    })

                    $(".relationUser input:checked").each(function(){
                        ids = ids + "," + $(this).val();
                    })
                    $.ajax({
                        type:'post',
                        url:'role/linkUser.htm',
                        data:{
                            ids:ids,
                            zeroIds:zeroIds,
                            rid:rid
                        },
                        success:function(data){
                            layer.msg("关联用户完成");
                            layer.closeAll();
                            loadHtml(data);
                        },
                        error:function(){
                            alert("网络错误，请稍后再试");
                        }
                    })
                },
                content:data,
            })
        }
    })
}

function details(cmd){
	$.ajax({
		method:'post',
		url:'role/details.htm?id=' + cmd,
		success:function(data){
			layer.msg("角色详情页");
			loadHtml(data);
		}
	})
}