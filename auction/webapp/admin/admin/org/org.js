var pid = 0;
function addOrg() {
    edit("admin/org/add.jsp",
         "addOrgForm",
         "org/add.htm?pid="+pid,
         "添加组织",
         "org/list.htm",
         '组织列表');
}

function editOrg() {
    var checks = $(".table input:checked");
    if(checks.length>0){
        edit('org/edit.htm?id='+$(checks[0]).val(),
            "editOrgForm",
            "org/add.htm",
            "组织菜单",
            "org/list.htm",
            '组织列表');
    }else{
        layer.msg("请选择数据")
    }
}

function delOrg(){
    var ids = "-1";
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'org/del.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

function searchOrg() {
    $.ajax({
        method:'post',
        url:'org/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchMenuForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}

function onHelp(){
    openHelp("admin/org/help.jsp");
}

function details(cmd){
	$.ajax({
		method:'post',
		url:'org/details.htm?id=' + cmd,
		success:function(data){
			layer.msg("组织详情页");
			loadHtml(data);
		}
	})
}

//==================以下是树型结构
var setting = {
    data: {
        simpleData: {
            enable: true
        }
    },
    callback: {
        onClick: getChild
    }
};

function getChild(event, treeId, treeNode) {
    $("#menuTable").load("org/listByPid.htm?pid="+treeNode.id);
    pid = treeNode.id;//在添加菜单时，默认父id
}