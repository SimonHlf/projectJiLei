
function yes(){
	var flag = true;
	$(".form-control").each(function(){
		if(this.value==''){
			layer.msg('请将数据填写完整');
			flag = false;
		}
	});
	if(!flag){
		return ;
	}else{
		var phone = $("#phone").val();
		var telephone = $("#telephone").val();
		var email = $("#email").val();
		var reg = /^0\d{2,3}-?\d{7,8}$/;
		var reg1 = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		if(!reg.test(phone)){
		    layer.msg("公司电话格式错误");
		    flag = false;
		}
		if(!reg.test(telephone)){
		    layer.msg("固定电话格式错误");
		    flag = false;
		}
		if(!reg1.test(email)){
			layer.msg("邮箱格式错误");
			flag = false;
		}
	}
	
	if(!flag){
		return ;
	}
	$.ajax({
		type:"post",
		url:"companybasic/company/updateReal.htm",
		data:new FormData($("#editCompanyForms")[0]),
        cache:false,
        contentType:false,
        processData:false,
		success:function(data){
		    if(data.result == "attr0Error"){
                layer.msg("登陆页面背景图片格式错误");
            } else {
                layer.msg("保存成功");
                //ajaxLoad("companybasic/company/updateNowBefore.htm","系统设置",this);
            }
		},
        error:function(){
		    alert("网络错误，请稍后再试");
        }
	})
}

function phone(obj){
	alert(obj.value)
}