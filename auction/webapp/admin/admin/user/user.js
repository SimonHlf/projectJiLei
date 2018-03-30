function addUser() {
    edit("admin/user/add.jsp",
         "addUserForm",
         "user/add.htm",
         "添加用户",
         "user/list.htm",
         '用户列表');
}

function editUser() {
    var checks = $(".table input:checked");
    if(checks.length>0){
        edit('user/edit.htm?id='+$(checks[0]).val(),
            "editUserForm",
            "user/add.htm",
            "修改用户",
            "user/list.htm",
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
                   // var json = eval('('+data+')');
                   var json = data;
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

function edituser(){
	var mobile = $("#mobile").val();
	var email = $("#email").val();
	var regEmail = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
	var regMobile = /^1[34578]\d{9}$/;
	if(email!=''){
		if(!regEmail.test(email)){
		      layer.msg('邮箱格式错误!!!');
		      return ;
		    }
	}
    if(mobile!=''){
    	if(!regMobile.test(mobile)){
        	layer.msg('手机号格式错误!!!');
        	return;
        }
    }
    
	$.ajax({
        method:'post',
        url:'user/thisUserSave.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#editUserForm")[0]),
        success:function (data) {
        	layer.msg('修改成功');
            loadHtml(data);
        }
    });
}