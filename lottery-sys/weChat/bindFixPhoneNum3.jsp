<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>新用户注册</title>
	<link rel="stylesheet" href="../weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_6u90gnv3u6hzd7vi.css"/>
	<link rel="stylesheet" href="../weChat/reception/css/setPassword.css">
	<link rel="stylesheet" href="../weChat/reception/css/footer.css"/>
	<style type="text/css">
		.sedPhoneCode{
			width:4.5rem !important;
			height: 36px;
			line-height: 36px;
			border-radius: 4px;
			font-size: 0.6rem !important;
			position: absolute;
			right: 0px;
			top: 0px;
			border:none;
		}
		.canSendBg{
			background: #cf3e46;
			color: #fff;
		}
		.notSendBg{
			background: #ccc;
			color: #666;
		}
	</style>
</head>
<body>
	<header class="aui-bar aui-bar-nav headerNav">
        <a class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)" href="javascript:void(0)">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <%-- <input type="hidden" id="userId" value="${frontUser.userId }"> --%>
        <div class="aui-title">新用户注册</div>
    </header>
    <!-- mainCon -->
    <div class="comInpBox">
    	<ul>
    		<!-- <li>
                <div class="txtDiv">
                   	用<span class="oneBlank"></span>户<span class="oneBlank"></span>名：
                </div>
                <div class="inpDiv">
                    <input id="usernameInp" onblur="checkUserName()" type="text" placeholder="请输入用户名">
                </div>
            </li>
            <li>
                <div class="txtDiv">
                   	密<span class="oneBlank"></span>码：
                </div>
                <div class="inpDiv">
                    <input id="passwordInp" onblur="checkPassword()" type="password" placeholder="请输入密码">
                </div>
            </li> -->
    		<li>
                <div class="txtDiv">
                   	手<span class="oneBlank"></span>机<span class="oneBlank"></span>号：
                </div>
                <div class="inpDiv">
                    <input id="phoneInp" onblur="checkBile()" type="number" placeholder="请输入手机号码">
                </div>
            </li>
             <li>
                <div class="txtDiv">
                   	验<span class="oneBlank"></span>证<span class="oneBlank"></span>码：
                </div>
                <div class="inpDiv">
                    <input id="verCode" type="number" placeholder="请输入手机验证码">
                    <input class="sedPhoneCode canSendBg" type="button" value="发送验证码" tapmode onclick="sendPhoneCode()">
                </div> 
            </li>
          		<!--  <li>
	          		<div class="txtDiv">
	                   	邀<span class="oneBlank"></span>请<span class="oneBlank"></span>码：
	                </div>
	                <div class="inpDiv">
	                    <input id="checkyao" type="number">
	                </div>
                </li> -->
    	</ul>
    	<a href="javascript:void(0)" tapmode onclick="saveNewPassword()" class="aui-btn aui-btn-block comAuiBtn">注册</a>
    	<%-- <center><a>还为拥有账户?</a><a href="javascript:void(0)" tapmode onclick="saveNewPassword()" style="color:blue">立即注册</a></center> --%>
    </div>
	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="../weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/aui-dialog.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/layer/layer.js"></script>
	<script type="text/javascript">
	  var count = 60;
	  $(function(){

		});
	  function sendPhoneCode(){
			var phoneInp = $("#phoneInp").val();
			var pattPhone = /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
			
			if(phoneInp == ""){
				dialog('手机号码不能为空');
				return;
			}else{
				if(!pattPhone.test(phoneInp)){
					dialog('手机号格式不正确');
					return;
				}
				//正确开始发送验证码
				checkPhone();
				getSendVerCode();
			}
		}
		function getSendVerCode(){
			
			$(".sedPhoneCode").attr("disabled", "disabled");
			$(".sedPhoneCode").removeClass("canSendBg").addClass("notSendBg");
		    $(".sedPhoneCode").val((count-1) + "秒后点击获取");
			count--;
			if(count > 0){
				setTimeout(getSendVerCode, 1000);
			}else{
				$(".sedPhoneCode").val("点击获取验证码");
		       	$(".sedPhoneCode").removeAttr("disabled");
		       	$(".sedPhoneCode").removeClass("notSendBg").addClass("canSendBg");
		        count = 60;
			}
		}
		function saveNewPassword(){
			
			var phoneInp = $("#phoneInp").val();
			var valide = $("#verCode").val();
			/* var checkyao = $("#checkyao").val(); */
			if(phoneInp == ""){
                dialog('手机号码不能为空');
                return;
			}else if(!(checkBile())){
				dialog('格式不正确，请从新输入！');
            	return;
			}else{
				
				$.ajax({
				method:'post',
				url:'beginNewPeoples.htm',
				data:{
				  
  				  newPhone:phoneInp,
  				  valide:valide
  				  
  			    },				
				success:function(data){
					
					var data = eval("(" + data + ")");
					/* layer.msg(data.code); */
					if(data.result=='success'){
						/* var newPhone = data.newPhone; */
						layer.confirm(data.code,function(){
							location.href = "${pageContext.request.contextPath }/personal/setLoginName.htm";
						});
						
					}else if(data.result=='none'){
						layer.msg(data.code);
					}else if(data.result=='fail'){
						layer.msg(data.code);
					}
					/* if(data=='true'){
						 layer.msg("绑定成功",{icon: 6},function(){
							 location.href = "${pageContext.request.contextPath }/login/index.htm?id="+$("#userId").val()+"&newPhone="+newPhone;
							});
					 }else{
						 layer.msg("绑定失败");
					 } */
					/* alert("修改密码成功");
				     window.location.href="index.htm?id="+$("#userId").val();  */
	                
				},
				error : function() {
					layer.msg("网络错误！！！");
				}
			})
			}
		}
	</script>
	<script type="text/javascript">
	
	function checkPhone(){
		var mobile = $("#phoneInp").val();
		var status = "true";
		if(!checkBile()){
			layer.msg("手机格式不正确");
			return;
		}
		$.ajax({
			method:'post',
			url:'${pageContext.request.contextPath }/personals/getValidateCode.htm',
			data:{
				mobile:mobile,
				status:status
			},
			 success:function(data){
				 var data = eval("(" + data + ")");
				 layer.msg(data.code);
			}, 
			error:function(data){
				layer.msg("发送短信出错");
			}
		})
		
	}
	</script>
	<script type="text/javascript">
	function checkBile(){
		var userId = $.trim($("#phoneInp").val());
		var reg = /^1[34578]\d{9}$/;
		var falg = true;
		if(userId != null && userId != ""){
			if(!reg.test(userId)){
				layer.tips("请输入正确的手机号", "#phoneInp", {tips: [2, "#E34127"],time: 1000});
				falg = false;
			}
		}
		return falg;
	}
	
	/* function checkUserName(){
		var userId = $.trim($("#usernameInp").val());
		var reg = /^[\u4E00-\u9FA5A-Za-z]+$/;
		var falg = true;
		if(userId != null && userId != ""){
			if(!reg.test(userId)){
				layer.tips("请输入正确的用户名", "#usernameInp", {tips: [2, "#E34127"],time: 1000});
				falg = false;
			}
		}
		return falg;
	} */
	/* function checkPassword(){
		var userId = $.trim($("#passwordInp").val());
		var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,21}$/;
		var falg = true;
		if(userId != null && userId != ""){
			if(!reg.test(userId)){
				layer.tips("请输入正确的密码", "#passwordInp", {tips: [2, "#E34127"],time: 1000});
				falg = false;
			}
		}
		return falg;
	} */
	</script>
</body>
</html>