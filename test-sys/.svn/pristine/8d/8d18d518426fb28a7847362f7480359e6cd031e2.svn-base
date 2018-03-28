// var pid = 0;
function addOrg() {
    var ztreeObj =  $.fn.zTree.getZTreeObj("menuTree");
    var nodes = ztreeObj.getSelectedNodes();
    if(nodes.length === 0){
        layer.msg("请选中目录树添加");
        return;
    }
    ajaxLoad("admin/org/add.jsp","添加部门",this);
    /*
    edit("admin/org/add.jsp",
         "addOrgForm",
         "org/add.htm?pid="+nodes[0].id,
         "添加组织",
         "org/list.htm",
         '组织列表');*/
}

function addOrgForm(){
    var ztreeObj =  $.fn.zTree.getZTreeObj("menuTree");
    var nodes = ztreeObj.getSelectedNodes();
    var result = required("addOrgForm");
    if(result){
        if(nodes[0].level == 0){
            layer.confirm("确定要添加部门吗?添加后部门将不能删除",function(indes){
                editSave("org/add.htm?pid="+nodes[0].id,"addOrgForm");
            });
        } else {
            editSave("org/add.htm?pid="+nodes[0].id,"addOrgForm");
        }
        /*$.ajax({
            type:'POST',
            url:'org/add.htm',
            data:new FormData($("#addOrgForm")[0]),
            cache:false,
            contentData:false,
            processType:false,
            success:function(data){
                layer.msg("添加完成");
                loadHtml(data);
            },
            error:function(){
                alert("网络错误，请稍后再试");
            }
        })*/
    }

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
    var ztreeObj =  $.fn.zTree.getZTreeObj("menuTree");
    var nodes = ztreeObj.getSelectedNodes();
    if(nodes.length === 0){
        layer.msg("请选中目录树删除");
        return;
    }
    if(nodes[0].level > 1){
        var ids = nodes[0].id;
        layer.confirm("确认删除吗?",function(index){
            $.ajax({
                method:'post',
                url:'org/del.htm',
                data:{
                    ids:ids
                },
                success:function (data) {
                    layer.msg("删除成功");
                    loadHtml(data);
                    layer.close(index)
                }
            })
        });
    } else {
        layer.msg("车间及根目录树不能删除");
    }

    /*var ids = "-1";
    var idc = $(".table input:checked");
    if(idc.length != 1){
        layer.msg("请选择一条数据删除");
        return;
    }
    for(var i = 0;i < idc.length; i++){
        ids = idc[i].value;
    }
   */
}

function searchOrg() {
    $.ajax({
        method:'post',
        url:'org/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchOrgForm")[0]),
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