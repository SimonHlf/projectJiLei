<!DOCTYPE html>
<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>注册账户</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/weChat/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/weChat/Module/setting/css/registerAccount.css" />
</head>
<body>
	<div class="regAccont">
		<strong class="comStrongTit">注册账户</strong>
		<p class="statAreaName">
			<span>
				<c:if test="${state==0}">未审核</c:if> 
				<c:if test="${state==1}">已审核</c:if>
			</span> 
			<em>${name}</em>
		<p>
		<div class="regAccList">
			<ul class="listNav">
				<li>用户编号</li>
				<li>联系方式</li>
				<li>电卡ID</li>
				<li>注册时间</li>
			</ul>
			<ul class="listCon">
				<c:forEach items="${list}" var="list">
					<li class="clearfix" onclick="queryByUserId('${list.account}')">
						<p>${list.account}</p>
						<p>${list.phone}</p>
						<p>${list.number}</p>
						<p class="ellip">${list.add_time}</p>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<a class="regBtn" href="javascript:void(0)"
		onclick="comEditShowAlert('beYunyingDiv')"><span></span>
	</a>
	<div class="layer"></div>
	<div class="toast-wrap">
		<span class="toast-msg"></span>
	</div>
	<div class="comEditDiv beYunyingDiv">
		<div class="comInnerDiv">
			<span>用户名称：</span> <input type="text" id="name" placeholder="请输入用户名称" />
		</div>
		<div class="comInnerDiv">
			<span>用户地址：</span> <input type="text" id="address"
				placeholder="请输入用户地址" />
		</div>
		<div class="comInnerDiv">
			<span>联系方式：</span> <input type="text" id="phone"
				placeholder="请输入联系方式" />
		</div>
		<p>注：</p>
		<p>1.此用户是为方便小区部分无微信账户的使用者，运营商添加的虚拟用户账户。</p>
		<p>2.运营商注册完成后点击列表对应的虚拟账户，进行充值和电卡绑定，使用者即可持卡刷卡充电。</p>
		<div class="btnDiv">
			<button class="comTwoBtn twoBtn_cancel"
				onclick="closeThisWin()">取消</button>
			<button class="comTwoBtn twoBtn_sure" onclick="regNewAcc();">确定</button>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../../down.jsp">
		<jsp:param value="4" name="cmd" />
	</jsp:include>
	<script src="${pageContext.request.contextPath }/weChat/jsPlugin/jquery.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath }/weChat/jsPlugin/tipInfo.js"
		type="text/javascript"></script>
	<script type="text/javascript">
			$(function(){
				$(".listCon li:odd").addClass("oddColor");
			});
			//注册新账户
			function regNewAcc(){
				var name = $("#name").val();
				var address = $("#address").val();
				var phone = $("#phone").val();
				if(name==null || name==""){
					toast("请输入姓名");
					return false;
				}
				if(address == null || address == ""){
					toast("请输入用户地址");
					return false;
				}
				if(phone==null || phone==""){
					toast("请输入手机号码");
					return false;
				}
				var zz = /^$/;
				if(!(/^1(3|4|5|7|8)\d{9}$/.test(phone))){ 
			        toast("手机号格式不正确");
			        return false; 
			    }
				$.ajax({
					url:"addSimulation.htm",
					type:"post",
					data:{"name":name,"address":address,"phone":phone,"regionId":${regionId}},
					dataType:"json",
					success:function(result){
						toast("新加用户" + result.msg);
						closeThisWin()
						location.reload();
					}
				})
			}
			function closeThisWin(){
				$(".beYunyingDiv").hide();
				$(".layer").animate({"opacity":0},200,function(){
					$(".layer").hide();
					$("#name").val("");
					$("#address").val("");
					$("#phone").val("");
				})
			}
			function queryByUserId(userId){
				var item = {
						"userId":userId
				}
				httpPost("getByUserId.htm", item);
			}
			//发送POST请求跳转到指定页面
			function httpPost(URL, PARAMS) {
			    var temp = document.createElement("form");
			    temp.action = URL;
			    temp.method = "post";
			    temp.style.display = "none";

			    for (var x in PARAMS) {
			        var opt = document.createElement("textarea");
			        opt.name = x;
			        opt.value = PARAMS[x];
			        temp.appendChild(opt);
			    }

			    document.body.appendChild(temp);
			    temp.submit();

			    return temp;
			}
		</script>
</body>
</html>
