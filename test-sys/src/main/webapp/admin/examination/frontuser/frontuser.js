// var orgId;
function addFrontUser() {
    var treeObj = $.fn.zTree.getZTreeObj("menuTree");
    var nodes = treeObj.getSelectedNodes();
    if(nodes.length === 0){//没有点击节点
        layer.msg("请选中机构节点再添加");
        return;
    }
    // var level = nodes[0].level;//节点等级 0为根节点 依次递增
    // if(level != 2){
    //     layer.msg("请选择部门下小组导入");
    //     return;
    // }

    // $.ajax({
    //     type: "post",
    //     url: "frontuser/getWindyOrgList.htm",
    //     success: function (html) {
    //         $("#mainContent").html(html);
    //     }
    // })
    /*alert("测试")*/
    // ajaxLoad("examination/frontuser/add.jsp",'添加考生',this);
    // orgId = nodes[0].id;
    edit("examination/frontuser/add.jsp",
         "addFrontUser",
         "frontuser/add.htm?orgId="+nodes[0].id,
         "添加考生",
         "frontuser/list.htm",
         '考生列表');
}

function cell(obj){
	if(obj.value==""){  
		 layer.msg("手机号不能为空"); 
		 $(obj).focus();
	}else{  
		var zz = /^(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;                            
	     if (zz.test(obj.value)) {  
	     } else {  
	        layer.msg("手机号格式错误"); 
	        $(obj).focus();
	     }  
	}  
}

function yes() {
	alert(0)
    var result = required("addFrontUser");
    var cellPhone = $("#cellPhone").val();
    alert(cellPhone);
    return;
    if (result) {
        $.ajax({
            type: 'post',
            url: 'frontuser/add.htm',
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData($("#addFrontUser")[0]),
            success: function (data) {
                var result = eval('(' + data + ')');
                if (result.result == 'true') {
                    layer.msg("添加成功")
                    // alert("添加成功");
                    ajaxLoad("frontuser/list.htm");
                } else if (result.result == 'pictureErroe') {
                    alert("添加失败")
                }
                /*loadHtml(data);
                layer.msg("添加完成。");*/
            },
            error: function () {
                alert("网络错误，请稍后再试");
            }
        })
    }
}


/*function yes(){
alert("sss")
	var result = required("addFrontUser");
	
		$.ajax({
			type:'post',
			url:"frontuser/add.htm",
			async:false,
			cache: false,
	        contentType: false,
	        processData: false,
			data:new FormData($("#addFrontUser")[0]),
			success:function(data){
				alert(data);
				var result=eval('('+data+')');
				if(result.result=='true'){
					alert("添加成功");
					ajaxLoad("frontuser/list.htm");
				}else if(result.result=='pictureErroe'){
					alert("图片格式错误")
				}
			},
			error:function(){
				alert("网络错误，请稍后再试");
			}
		})
		
	
	
}*/

function fanhui() {
    $("#mainContent").load("frontuser/list.htm");
}


function updateFrontUser() {
    var checks = $(".table input:checked");
    if (checks.length != 1) {
        layer.msg("选择一个用户修改信息");
        return;
    }

    edit("frontuser/findById.htm?id=" + $(checks[0]).val(),
        "editFrontUserForm",
        "frontuser/edit.htm",
        "修改考生",
        "frontuser/list.htm",
        '考生列表');

    // $.ajax({
    //     type: "post",
    //     url: "frontuser/findById.htm?id=" + $(checks[0]).val(),
    //     success: function (html) {
    //         $("#mainContent").html(html);
    //     }
    // })

    // if (checks.length > 0) {

    // } else {
    //     layer.msg("请选择数据")
    // }
}

function yesofUpdate() {
    var result = required("editFrontUserForm");
    if (result) {
        $.ajax({
            type: 'post',
            url: 'frontuser/edit.htm',
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData($("#editFrontUserForm")[0]),
            success: function (data) {

                var result = eval('(' + data + ')');
                if (result.result == 'true') {
                    alert("修改成功");
                    ajaxLoad("frontuser/list.htm");
                } else if (result.result == 'pictureErroe') {
                    alert("图片格式错误")
                }
                /*loadHtml(data);
                layer.msg("添加完成。");*/
            },
            error: function () {
                alert("网络错误，请稍后再试");
            }
        })
    }
}


function editUserNow() {

    var checks = $(".table input:checked");
    if (checks.length > 0) {
        edit('user/edit.htm?id=' + $(checks[0]).val(),
            "editUserForm",
            "user/add.htm",
            "修改用户",
            "user/listNow.htm",
            '用户列表');
    } else {
        layer.msg("请选择数据")
    }

}


function delFrontUser() {
    var ids = "-1";
    $(".table input:checked").each(function () {
        ids = ids + "," + $(this).val();
    });
    layer.confirm("确认删除吗?", function (index) {
        $.ajax({
            method: 'post',
            url: 'frontuser/delete.htm',
            data: {ids: ids},
            success: function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

//根据条件查找
function searchFrontUser() {
   var attr0 =  $("#attr0").val();
   var nickName = $("#nickName").val();
    $.ajax({
        method: 'post',
        url: 'frontuser/list.htm',
        data:{
            attr0:attr0,
            nickName:nickName
        },
        // cache: false,
        // contentType: false,
        // processData: false,
        // data: new FormData($("#searchFrontUserForm")[0]),
        success: function (data) {
            layer.msg("查询完成");
            loadHtml(data);
        },
        error: function () {
            alert("网络错误，请稍后再试");
        }
    });
}

function details(cmd) {
    $.ajax({
        method: 'post',
        url: 'user/details.htm?id=' + cmd,
        success: function (data) {
            layer.msg("用户详情页");
            loadHtml(data);
        }
    })
}


//导入 Excel 说明
function ImportFrongUserExcelHelp() {
    openHelp("examination/frontuser/help.jsp", "导入 Excel 模板样式", 500);
}

//下载导入考生 excel 模板
function downloadTemplate(){
    window.location="frontuser/downloadTemplate.htm";
}

//恢复默认密码
function recoveryPassword(){
    var ids = "-1";
    $(".table input:checked").each(function(){
       ids = ids + "," +$(this).val();
    });
    if(ids == "-1"){
        layer.msg("请选择考生");
        return;
    }
    layer.confirm("确定要恢复默认密码吗？",function(index){
        $.ajax({
            type:'post',
            url:'frontuser/recoveryPassword.htm',
            data:{
                ids:ids
            },
            success:function(data){
                layer.msg("已恢复默认密码，默认密码为 123456");
                loadHtml(data);
            },
            error:function(){
                alert("网络错误，请稍后再试");
            }
        })
    })
}