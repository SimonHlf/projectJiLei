var updateUser;
function addUser() {
    var treeObj = $.fn.zTree.getZTreeObj("menuTree");
    var nodes = treeObj.getSelectedNodes();
    if(nodes.length === 0){//没有点击节点
        layer.msg("请选中机构节点再添加");
        return;
    }
    ajaxLoad("user/jumpAdd.htm","添加用户",this);
    updateUser = nodes[0].id;
   /* edit("user/jumpAdd.htm",
         "addUserForm",
         "user/add.htm?updateUser="+nodes[0].id,
         "添加用户",
         "user/list.htm",
         '用户列表');*/
}

function QueryAddUser(){
    var result = required("addUserForm");
    if(result){
        var password = $("#password").val();
        var twoPassword = $("#TwoPassword").val();
        if(password != twoPassword){
            layer.msg("两次输入的密码不一致");
            return;
        }
        $.ajax({
            type:'post',
            url:'user/add.htm?updateUser='+updateUser,
            data:new FormData($("#addUserForm")[0]),
            cache:false,
            contentType:false,
            processData:false,
            success:function(data){
                layer.msg("添加成功");
                loadHtml(data);
            },
            error:function(){
                alert("网络错误，请稍后再试");
            }
        })
    }
}

function editUser() {
    var checks = $(".table input:checked");
    if(checks.length>0){
        ajaxLoad("user/edit.htm?id="+$(checks[0]).val());
       /* edit('user/edit.htm?id='+$(checks[0]).val(),
            "editUserForm",
            "user/add.htm",
            "修改用户",
            "user/list.htm",
            '用户列表');*/
    }else{
        layer.msg("请选择数据")
    }
}

function saveUser(){
    var result = required("editUserForm");
    if(result){
       var newPassword = $("#newPassword").val();
       var twoPassword = $("#TwoPassword").val();
       var passRes;
       var url = "";
       if(!newPassword){
           passRes = true;
           url = "user/add.htm"
       } else {
           if(newPassword != twoPassword){
               layer.msg("两次输入的密码不一致");
               passRes = false;
           } else {
               passRes = true;
               url = "user/add.htm?password="+newPassword;
           }
       }
       if(passRes){
           $.ajax({
               type:'post',
               url: url,
               data:new FormData($("#editUserForm")[0]),
               cache:false,
               contentType:false,
               processData:false,
               success:function(data){
                   layer.msg("保存成功");
                   loadHtml(data);
               },
               error:function(){
                   alert("网络错误，请稍后再试");
               }
           })
       }
    }
}

function xiugaiYonghu(){
	$.ajax({
		type:'post',
		url:'user/thisUserSave.htm',
		data:$("#editUserForm").serialize(),
		success:function(html){
			layer.msg("保存成功");
			$("#mainContent").html(html);
		}
	})
}

function editUserNow(){
	var checks = $(".table input:checked");
    if(checks.length>0){
        edit('user/edit.htm?id='+$(checks[0]).val(),
            "editUserForm",
            "user/add.htm",
            "修改用户",
            "user/listNow.htm",
            '用户列表');
    }else{
        layer.msg("请选择数据")
    }
	
}


function delUser(){
    var ids = "-1";
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    if(ids == "-1"){
    	layer.msg("请选择数据")
    	return;
    }
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'user/del.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

function searchUser() {
    $.ajax({
        method:'post',
        url:'user/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchUserForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}

function details(cmd){
	$.ajax({
		method:'post',
		url:'user/details.htm?id=' + cmd,
		success:function(data){
			layer.msg("用户详情页");
			loadHtml(data);
		}
	})
}

//修改密码
function updateThisPassword(id){
    openDialog("admin/user/updateThisPassword.jsp",function(index){
        var result = required("updateThisPasswordForm");
        if(result){
           var password = $("#password").val();
           var newPassword = $("#newPassword").val();
           var twonewPassword = $("#twonewPassword").val();
           if(twonewPassword != newPassword){
               layer.msg("两次输入的密码不一致");
               return;
           }
           $.ajax({
               type:'post',
               url:'user/updateThisPassword.htm',
               data:{
                   password:password,
                   newPassword:newPassword,
                   id:id
               },
               success:function(data){
                   var json = eval('('+data+')');
                   if(json.result == "true"){
                       layer.msg("修改成功");
                       layer.closeAll();
                   } else {
                       layer.msg("原密码错误");
                   }
               },
               error:function(){
                   alert("网络错误，请稍后再试");
               }
           })
        }
    },'修改密码');
}