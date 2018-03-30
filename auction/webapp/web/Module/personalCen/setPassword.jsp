<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>完善修改个人资料</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/setPersonalInfo.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/layer.css"/>
	</head>
	<body>
		<div id="content">
		<%@ include file="../../head.jsp"%>  
		<!-- 个人中心内容 -->
		<div class="personalCenCon w1100 clearfix">
			<%@ include file="personalHead.jsp"%>  
			<div class="rightPersonal fr">
				<strong class="rightTit"><span></span>修改密码</strong>
				<div class="rightCon">
					<div class="setInfoNav">
						<ul class="clearfix">
							<li class="active">密码设置</li>
						</ul>
					</div>
					
					<div class="setInfoCon active">
						<div class="setInfoConInner">
							<div class="comInnercon">
								<span><em>*</em>当<span class="oneBlank1"></span>前<span class="oneBlank1"></span>密<span class="oneBlank1"></span>码：</span>
								<input type="text" id="nowPassInp" class="txtInp" name="nowPass" placeholder="请输入当前密码" style="margin-left: -1px;"/>
								<div id="nowPasErrTip" class="errInfoTip">
									<span></span>
									<p></p>
								</div>
								<div id="nowPasSuccTip" class="succInfoTip"></div>
							</div>
							<div class="comInnercon">
								<span><em>*</em>新<span class="twoBlank1"></span>密<span class="twoBlank1"></span>码：</span>
								<input type="text" id="newPass" class="txtInp" name="newPass" placeholder="请输入新密码"/>
								<div id="newPasErrTip" class="errInfoTip">
									<span></span>
									<p></p>
								</div>
								<div id="newPasSuccTip" class="succInfoTip"></div>
								<div id="focusTip" class="focusTip">
									<span></span>
									<p>新密码由6-16字符（字母、数字、符号）组成，区分大小写</p>
								</div>
							</div>
							<div class="comInnercon" style="margin-bottom: 5px;">
								<!-- 密码强弱 -->
								<div id="pasStrongWeak" class="pasStrongWeak">
									<div class="pasBox">
										<p class="gray1"></p>
										<span>弱</span>
									</div>
									<div class="pasBox">
										<p class="gray2"></p>
										<span>中</span>
									</div>
									<div class="pasBox">
										<p class="gray3"></p>
										<span>强</span>
									</div>
								</div>
							</div>
							<div class="comInnercon">
								<span><em>*</em>确认新密码：</span>
								<input type="text" class="txtInp" id="confirNewPass" name="confirNewPass" placeholder="请再次输入新密码"/>
								<div id="confirNewPasErrTip" class="errInfoTip">
									<span></span>
									<p></p>
								</div>
								<div id="confirNewPasSuccTip" class="succInfoTip"></div>
							</div>
						</div>
						<a class="saveBtn1" href="javascript:editPass()">保存</a>
					</div>
				</div>
			</div>
		</div>
		</div>
		<%@ include file="../../foot.jsp"%>  
			<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js"></script>	
			<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/layer.js"></script>
		<script type="text/javascript">
			$(function(){
				//switchTab();
				$(".setInfoCon").show();
			});
			//tab切换
			/*function switchTab(){
				$(".setInfoNav li").each(function(i){
					$(this).click(function(){
						$(".setInfoCon").hide();
						$(this).addClass("active").siblings().removeClass("active");
						$(".setInfoCon").eq(i).show();
						if(i == 1){
							checkPasStrongWeak($("#newPass"));
						}
					});
				});
				inputBlurCheck();
			} */
			//input blur检测
			function inputBlurCheck(){
				//昵称检测
				$("#nickInp").blur(function(){
					if($("#nickInp").val() == ""){
						$("#nickSuccTip").hide();
						$("#nickErrTip").show().find("p").html("昵称不能为空");
					}else{
						$("#nickErrTip").hide().find("p").html("");
						$("#nickSuccTip").show();
					}
				});
				//当前密码检测
				$("#nowPassInp").blur(function(){
					if($("#nowPassInp").val() == ""){
						$("#nowPasSuccTip").hide();
						$("#nowPasErrTip").show().find("p").html("当前密码不能为空");
					}else{
						$("#nowPasErrTip").hide().find("p").html("");
						$("#nowPasSuccTip").show();
					}
				});
				//新密码检测
				$("#newPass").blur(function(){
					if($("#newPass").val() == ""){
						$("#newPasSuccTip").hide();
						$("#newPasErrTip").show().find("p").html("新密码不能为空");
					}else{
						$("#newPasErrTip").hide().find("p").html("");
						$("#newPasSuccTip").show();
					}
				});
				//确认新密码检测
				$("#confirNewPass").blur(function(){
					if($("#confirNewPass").val() == ""){
						$("#confirNewPasSuccTip").hide();
						$("#confirNewPasErrTip").show().find("p").html("确认新密码不能为空");
					}else{
						var newPass=$("#newPass").val();
						if($("#confirNewPass").val()==newPass){
							$("#confirNewPasErrTip").hide().find("p").html("");
							$("#confirNewPasSuccTip").show();
						}else{
							$("#confirNewPasSuccTip").hide();
							$("#confirNewPasErrTip").show().find("p").html("两次密码输入不一致");
						}
						
						
					}
				});
				//邮箱检测
				$("#newEmailInp").blur(function(){
					if($("#newEmailInp").val() == ""){
						$("#sucEmailTip").hide();
						$(".errInfo").show().html("新邮箱不能为空");
					}else{
						var szRegEmail = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
						if(szRegEmail.test($("#newEmailInp").val())){
							$(".errInfo").hide().html("");
							$("#sucEmailTip").show();
						}else{
							$("#sucEmailTip").hide();
							$(".errInfo").show().html("新邮箱格式不对");
						}
					}
				});
				//验证码检测
				$("#vercodeInp").blur(function(){
					if($("#vercodeInp").val() == ""){
						$("#sucVercode").hide();
						$(".errInfo").show().html("验证码不能为空");
					}else{
						$(".errInfo").hide().html("");
						$("#sucVercode").show();
					}
				});
				//手机号码检测
				$("#phoneInp").blur(function(){
					if($("#phoneInp").val() == ""){
						$("#sucPhoneNum").hide();
						$(".errInfo").show().html("手机号码不能为空");
					}else{
						var v= $("#phoneInp").val().replace(/ /g,"");
						var partten = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
						if(partten.test(v) && v.length == 11){//检验手机号码格式
							$("#sucPhoneNum").show();
							$(".errInfo").hide().html("");
							//验证手机号是否是否重复
							
							
							
							
						}else{
							$("#sucPhoneNum").hide();
							$(".errInfo").show().html("手机号码格式不对");
						}
					}
				});
				//手机验证码检测
				$("#phoneCodeInp").blur(function(){
					if($("#phoneCodeInp").val() == ""){
						$("#sucPhoneCode").hide();
						$(".errInfo").show().html("手机验证码不能为空");
					}else{
						$(".errInfo").hide().html("");
						$("#sucPhoneCode").show();
					}
				});
				
				//固定电话格式验证
				$("#telphoneInp").blur(function(){
					if($("#telphoneInp").val() == ""){
						$("#sucPhoneNum").hide();
						//$(".errInfo").show().html("手机号码不能为空");
					}else{
						var v= $("#telphoneInp").val().replace(/ /g,"");
										
						var partten = /^0\d{2,3}-?\d{7,8}$/;
						if(partten.test(v)){//检验手机号码格式
							$("#sucPhoneNum").show();
							$(".errInfo").hide().html("");
						}else{
							$("#sucPhoneNum").hide();
							$(".errInfo").show().html("固话格式不对");
						}
					}
				});
			}
			
			//性别切换选择
			
			function selSex(obj){
				$(".radiusSpan").removeClass("selActSpan");
				$(obj).parent().find("span").addClass("selActSpan");
				alert($(obj).val())
				$("#sexValInp").val($(obj).val());
			}
			//修改邮箱 手机号显示弹窗
			function modifyEmPhone(options){
				$(".layer").show();
				if(options == 'email'){
					$("#setEmail").show();
				}else if(options == 'phone'){
					$("#setPhone").show();
				}else{
					$("#setTelPhone").show();
				}
			}
			function closeFixWin(options){
				$(".layer").hide();
				if(options == 'email'){
					$("#setEmail").hide();
				}else if(options == 'phone'){
					$("#setPhone").hide();
				}else{
					$("#setTelPhone").hide();
				}
			}
			
			
			//判断密码强度
			function pwdChange(v) {
				var num = 0;
				var reg = /\d/; //如果有数字
				if (reg.test(v)) {
					num++;
				}
				reg = /[a-zA-Z]/; //如果有字母
				if (reg.test(v)) {
					num++;
				}
				reg = /[^0-9a-zA-Z]/; //如果有特殊字符
				if (reg.test(v)) {
					num++;
				}
				if (v.length < 6) { //如果密码小于6
					num--;
				}
				return num;
			}
			//密码强度的判断
			function checkPasStrongWeak(obj){
				//给密码输入框 注册键放开事件
				$(obj).keyup(function(){
					var pwdValue = $(this).val();
					var num = pwdChange(pwdValue);
					if($(this).val()!=''){
						if(num==0 || num==2){
							$(".gray1").attr('id','red');
						}
						if(num==2){
							$(".gray1").attr('id','orange');
							$(".gray2").attr('id','orange');
						}else{
							$(".gray2").attr('id','');
						}
						if(num==3){
							$(".gray1").attr('id','green');
							$(".gray2").attr('id','green');
							$(".gray3").attr('id','green');
						}else{
							$(".gray3").attr('id','');
						}	
					}else{
						$(".gray1").attr('id','');
						$(".gray2").attr('id','');
						$(".gray3").attr('id','');
					}
				});
			}
			
			//保存邮箱
			function saveEmail(){
				if($("#newEmailInp").val() == ""){
					$("#sucEmailTip").hide();
					$(".errInfo").show().html("新邮箱不能为空");
					return false;
				}else{
					var szRegEmail = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
					if(szRegEmail.test($("#newEmailInp").val())){
						$(".errInfo").hide().html("");
						$("#sucEmailTip").show();
					}else{
						$("#sucEmailTip").hide();
						$(".errInfo").show().html("新邮箱格式不对");
						return false;
					}
				}
				var email=$("#newEmailInp").val();
				$("#email").val(email);
				$(".layer").hide();
				$("#setEmail").hide();
			}
			
			//保存手机号
			function savePhone(){
				var phoneInp=$("#phoneInp").val();
				$("#phone").val(phoneInp);
				$(".layer").hide();
				$("#setPhone").hide();
			}
			//保存固话
			function saveTelPhone(){
				var telphoneInp=$("#telphoneInp").val();
				$("#telphone").val(telphoneInp);
				$(".layer").hide();
				$("#setTelPhone").hide();
			}
			//保存用户信息
			function saveUserInfo(){
				var id=$("#id").val();
				var nickname=$("#nickname").val();
				var phone=$("#phone").val();
				var telphone=$("#telphone").val();
				var email=$("#email").val();
				var address=$("#address").val();
				var attr0=$("#sexValInp").val();

			        $.ajax({
			            method: 'post',
			            url: "${pageContext.request.contextPath }/web/shop/userCenterApi/updateUserInfo.htm",
			            data: {id:id,
			            	nickname:nickname,
			            	phone:phone,
			            	telphone:telphone,
			            	email:email,
			            	address:address,
			            	attr0:attr0
			            },
			            success: function (data) {
			            	// data=eval("("+data+")");
			               if(data.result=="ok"){
			            	   
			            	   layer.msg('修改成功');
			            	   //window.location.href = "${pageContext.request.contextPath }/web/shop/userCenterApi/toUserCenterJsp.htm";
			            	   setTimeout('window.location.href = "${pageContext.request.contextPath }/web/shop/userCenterApi/toUserCenterJsp.htm?sort=0"',1500); 
			               }
			               if(data.result=="fail"){
			            	   layer.msg('修改失败');
			               }
			               
			                
			            },error:function(){
			            	layer.msg('操作失败');
			            }
			        })
			   
			}
		//修改密码	
		function editPass(){
			var nowPassInp=$("#nowPassInp").val();
			var newPass=$("#newPass").val();
			var confirNewPass=$("#confirNewPass").val();
			if(nowPassInp==""){
				layer.msg("原密码不能为空");
				return false;
			}
			if(newPass==""){
				layer.msg("新密码不能为空");
				return false;
			}
			if(confirNewPass==""){
				layer.msg("确认密码不能为空");
				return false;
			}
			if(confirNewPass!=newPass){
				layer.msg("两次密码不一致");
				return false;
			}
			 $.ajax({
		            method: 'post',
		            url: "${pageContext.request.contextPath }/web/shop/userCenterApi/updatePassword.htm",
		            data: {nowPass:nowPassInp,newPass:newPass},
		            success: function (data) {
		            	// data=eval("("+data+")");
		               if(data.result=="ok"){
		            	   layer.msg('修改成功');
		            	   //window.location.href = "${pageContext.request.contextPath }/web/shop/userCenterApi/toUserCenterJsp.htm";
		            	   setTimeout('window.location.href = "${pageContext.request.contextPath }/web/shop/userCenterApi/toUserCenterJsp.htm"',1500); 
		               }
		               if(data.result=="fail"){
		            	   layer.msg('修改失败');
		               }
		               
		                
		            },error:function(){
		            	layer.msg('操作失败');
		            }
		        })
			
		}

		
		function message(username){
			mymsg(username);
		}
		
		function mymsg(str){
			$.ajax({
				type:'post',
				data:"username="+str,
				url:'${pageContext.request.contextPath}/web/tuimsgController/getPersonTuimsg.htm',
				success:function(data){
					$("#content").html(data);	
				},
				error:function(data){
				}
			});			
		}

		</script>
	</body>
</html>
