function addSetting() {
    edit("admin/setting/add.jsp",
         "addSettingForm",
         "setting/add.htm",
         "添加系统设置",
         "setting/list.htm",
         '系统设置');
}

function editSetting() {
    var checks = $(".table input:checked");
    if(checks.length>0){
        edit('setting/edit.htm?id='+$(checks[0]).val(),
            "editSettingForm",
            "setting/add.htm",
            "修改系统设置",
            "setting/list.htm",
            '系统设置');
    }else{
        layer.msg("请选择数据")
    }
}

function delSetting(){
    var ids = "-1";
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'setting/del.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

function searchSetting() {
    $.ajax({
        method:'post',
        url:'setting/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchSettingForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}

function details(cmd){
	$.ajax({
		method:'post',
		url:'setting/details.htm?id=' + cmd,
		success:function(data){
			layer.msg("设置详情页");
			loadHtml(data);
		}
	})
}
function yes(){
	$.ajax({
		type:"post",
		url:"setting/updateReal.htm",
		data:new FormData($("#editSettingForms")[0]),
        cache:false,
        contentType:false,
        processData:false,
		success:function(data){
		    // var json = eval('('+data+')');
		    var json = data;
		    if(json.result == "attr0Error"){
                layer.msg("登陆页面背景图片格式错误");
            } else if(json.result == "attr1Error"){
                layer.msg("登陆输入框前logo图片格式错误");
            } else {
                layer.msg("保存成功");
                ajaxLoad("setting/updateNowBefore.htm","系统设置",this);
            }
		},
        error:function(){
		    alert("网络错误，请稍后再试");
        }
	})
}
