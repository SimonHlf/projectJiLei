//页面初始化进来初始左侧高度
function checkHeight(){
	var leftHei = $(".leftMainCon").height();
	var rightMainConHei = $(".rightMainCon").height();
	if(leftHei < rightMainConHei){
		$(".leftMainCon").height(rightMainConHei)
	}else{
		$(".leftMainCon").css({"padding-bottom":50});
	}
	if($(".mainListCon li").length > 0){
		$(".mainListCon li:odd").addClass('oddColor');
	}
}

//跳转考试信息
function jumpExamInfo(obj){
	$(".tabTopNav li").removeClass("active");
	$(obj).addClass("active");
	$.ajax({
		type:'post',
		url:'PaperCreatFontCountroller/getPaperCreatNow.htm',
		success:function(data){
			$("#personalContent").html(data);
		},
		error:function(){
			alert("网络错误，请稍后再试");
		}
	})
}
//跳转个人中心
function jumpCenter(obj){
    $(".tabTopNav li").removeClass("active");
    $(obj).addClass("active");
    $.ajax({
		type:'post',
		url:'jumpCen.htm',
		data:{},
		success:function(data){
			$("#personalContent").html(data);
		},
		error:function(){
			alert("网络错误，请稍后再试");
		}
	})
}
//跳转个人资料
function jumpPersonalInfo(obj){
	$(".tabTopNav li").removeClass("active");
	$(obj).addClass("active");
	$.ajax({
		type:'post',
		url:'jumpPersonalInfo.htm',
		data:{},
		success:function(data){
			$("#personalContent").html(data);
		},
		error:function(){
			alert("网络错误，请稍后再试");
		}
	})
}

//保存个人资料
function savePersonalInfo(){
	var cellPhone = $("#cellPhone").val();
	if(!cellPhone){
		alert("请输入手机号");
		return;
	}
	var zz = /^(0|86|17951)?(13[0-9]|15[0-9]|17[0-9]|18[0-9]|14[0-9])[0-9]{8}$/;
	if(!zz.test(cellPhone)){
		alert("手机号格式不正确");
		return;
	}
	// var sex = $('input[name="sex"]:checked').val();
	// alert(sex);
	$.ajax({
		type:'post',
		url:'saveInfo.htm',
		cache:false,
		contentType:false,
		processData:false,
		data:new FormData($("#WebUpdateFrontUserForm")[0]),
		success:function(data){
		    var json = eval('('+data+')');
		    if(json.result == 'pictureErroe'){
		        alert("图片格式不支持");
            } else {
		        alert("保存成功");
		        var imgUrl = json.imgUrl;
		        if(typeof (imgUrl) != "undefined" ){
		        	var perHeadImg = $("#personalContent").parent().parent().prev().find('img');
			        $("#personalContent").load("jumpPersonalInfo.htm");
			        perHeadImg.attr("src","/" + json.imgUrl)
		        }
            }
		},
		error:function(){
			alert("网络错误请稍后再试");
		}
	})

}

//跳转密码修改
function jumpfixPassword(obj){
	$(".tabTopNav li").removeClass("active");
	$(obj).addClass("active");
	$("#personalContent").load("jumpfixPassword.htm");
}

//保存密码
function savePassword(){
	var password = $("#password").val();
	if(!password){
		alert("请输入原密码");
		return;
	}
	var onepassword = $("#onepassword").val()
	var twopassword = $("#twopassword").val();
    if(!onepassword){
        alert("请输入新密码");
        return;
    }
    if(onepassword != twopassword){
        alert("新密码和确认密码不一致!");
        return;
    }
    var result = window.confirm("确定要修改密码吗?");
    if(result){
        $.ajax({
            type:'post',
            url:'savePassword.htm',
            data:new FormData($("#savePasswordForm")[0]),
            cache:false,
            contentType:false,
            processData:false,
            success:function(data){
                var json = eval('('+data+')');
                if(json.code == "400"){
                    alert("原密码错误");
                } else {
                    alert("密码修改成功");
                    $("#password").val("");
                    $("#onepassword").val("");
                    $("#twopassword").val("");
                }
            },
            error:function(){
                alert("网络错误，请稍后再试");
            }
        })
	}
}
//前台查看考试记录
function jumpExamRecord(obj){
	$(".tabTopNav li").removeClass("active");
	$(obj).addClass("active");
	$.ajax({
		type:"post",
		url:"PaperCreatFontCountroller/getRecord.htm",
		success:function(data){
			$("#personalContent").html(data);
			$(".layui-box").css({"left":parseInt(($("#pagination").width() - $(".layui-box").width())/2) });
		},
		error:function(){
			alert("网络错误，请稍后再试");
		}
	})
}
