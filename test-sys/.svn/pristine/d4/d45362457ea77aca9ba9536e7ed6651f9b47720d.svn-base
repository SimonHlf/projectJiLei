var pid = 0;
function addMenu() {
    edit("admin/menu/add.jsp",
         "addMenuForm",
         "menu/add.htm?pid="+pid,
         "添加菜单",
         "menu/list.htm",
         '菜单列表');
}

function editMenu() {
    var checks = $(".table input:checked");
    if(checks.length>0){
        edit('menu/edit.htm?id='+$(checks[0]).val(),
            "editMenuForm",
            "menu/add.htm",
            "修改菜单",
            "menu/list.htm",
            '菜单列表');
    }else{
        layer.msg("请选择数据")
    }
}

function delMenu(){
    var ids = "-1";
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    if(ids == '-1'){
    	layer.msg("请选择数据");
    	return;
    }
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'menu/del.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

function searchMenu() {
    $.ajax({
        method:'post',
        url:'menu/list.htm',
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
    openHelp("admin/menu/help.jsp");
}

//查看菜单详情
function details(cmd){
	$.ajax({
		method:'post',
		url:'menu/details.htm?id=' + cmd,
		success:function(data){
			layer.msg("菜单详情页");
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
    $("#menuTable").load("menu/listByPid.htm?pid="+treeNode.id);
    pid = treeNode.id;//在添加菜单时，默认父id
}