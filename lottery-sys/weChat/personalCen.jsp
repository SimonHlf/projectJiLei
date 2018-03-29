<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>个人中心</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_6u90gnv3u6hzd7vi.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/personalCen.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/footer.css"/>
</head>
<body>
	<!-- 头部 -->
	<div class="header">
		<div class="imgBox cirRadius">
		     <c:if test="${frontUser.headPortrait!=null && frontUser.headPortrait!='' }">
		     <img src="/${frontUser.headPortrait }" width="100%"> 
		     </c:if>
		     <c:if test="${frontUser.headPortrait==null || frontUser.headPortrait=='' }">
			 <img src="${pageContext.request.contextPath }/weChat/images/default.jpg" width="100%">
			 </c:if>
		</div>
		<input type="hidden" id="userId" value="${frontUser.userId }">
		<p id="nickName">${frontUser.nickName }</p>
		 <p>¥<fmt:formatNumber type="number" value="${frontUser.balance } " pattern="0.00" maxFractionDigits="2"/></p>  
		 <%-- <p>¥${frontUser.balance }</p>  --%>
	</div>
	<!-- listCon -->
	<div class="listUl">
		<ul id="ulList">
			<li class="listUlLi">
				<p><i class="iconfont icon-personalInfo"></i>个人资料</p>
				<ul class="sonListUl">
				    <c:if test="${frontUser.cellPhone ==null }">
				    <li><a href="javascript:void(0)" tapmode onclick="setLoginName()">用户登录<i class="iconfont icon-jiantou"></i></a></li>
				     </c:if>
					<li><a href="javascript:void(0)" tapmode onclick="setNickName()">头像昵称设定<i class="iconfont icon-jiantou"></i></a></li>
					<li><a href="javascript:void(0)" tapmode onclick="setPassword()">修改密码<i class="iconfont icon-jiantou"></i></a></li>
					<li><a href="javascript:void(0)" tapmode onclick="bindPhoneNums()">绑定手机号<i class="iconfont icon-jiantou"></i></a></li>
					<li><a href="javascript:void(0)" tapmode onclick="bindBankCard()">绑定银行卡<i class="iconfont icon-jiantou"></i></a></li>
					<li><a href="javascript:void(0)" tapmode onclick="bindBankCard2()">绑定支付宝<i class="iconfont icon-jiantou"></i></a></li>
					<li><a href="javascript:void(0)" tapmode onclick="bindBankCard3()">绑定微信<i class="iconfont icon-jiantou"></i></a></li>
					<!-- <li><a href="#">绑定支付宝<i class="iconfont icon-jiantou"></i></a></li> -->
				</ul>
			</li>
			<li class="listUlLi"><%-- onclick="location.href='${pageContext.request.contextPath }/personal/toAcc.htm'" --%>
				<p>
					<a href="javascript:void(0)" tapmode onclick="bindChangeCounds()"><i class="iconfont icon-qianbao"></i>帐变记录</a>
				</p>
				<ul class="sonListUl"></ul>
			</li>
			<li class="listUlLi">
				<p><i class="iconfont icon-tuandui"></i>团队管理</p>
				<ul class="sonListUl">
					<li><a href="javascript:void(0)" tapmode onclick="userManager()">用户管理<i class="iconfont icon-jiantou"></i></a></li>
					<li><a href="javascript:void(0)" tapmode onclick="teamProfitLoss()">团队盈亏报表<i class="iconfont icon-jiantou"></i></a></li>
					 <li><a href="javascript:void(0)" tapmode onclick="referLink()">推广链接<i class="iconfont icon-jiantou"></i></a></li>
					<!--<li><a href="javascript:void(0)" tapmode onclick="referLinkWx()">微信推广链接<i class="iconfont icon-jiantou"></i></a></li> -->
				</ul>
			</li>
			<li class="listUlLi"><%-- onclick="location.href='${pageContext.request.contextPath }/personal/toAcc.htm'" --%>
				<p>
					<a href="javascript:void(0)" tapmode onclick="commission()"><i class="iconfont icon-qianbao"></i>我的佣金</a>
				</p>
				<ul class="sonListUl"></ul>
			</li>
			<li class="listUlLi">
				<p>
					<a href="javascript:void(0)" onclick="publicNotice()"><i class="iconfont icon-gonggao"></i>公<span class="oneBlank"></span>告</a>
				</p>
				<ul class="sonListUl"></ul>
			</li>
		</ul>
	</div>
	<c:if test="${frontUser.cellPhone !=null }">
	<a href="javascript:void(0)" tapmode onclick="loginout()" class="aui-btn aui-btn-block comAuiBtn">退出登录</a>
	</c:if>
	<c:if test="${frontUser.cellPhone ==null }">
	<a href="javascript:void(0)" tapmode onclick="loginin()" class="aui-btn aui-btn-block comAuiBtn">立即登录</a>
	</c:if>
	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/aui-dialog.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/personalCenter2.js"></script>
	<script type="text/javascript">
		$(function() {
			showMenu();
		});
		function showMenu(){
			var oList=document.getElementById("ulList");
			var aP=oList.getElementsByTagName("p");
			var aUl=oList.getElementsByTagName("ul");
	
			for(var i=0;i<aP.length;i++){
				aP[i].index=i;
				aP[i].onclick=function(){
					for(var i=0;i<aP.length;i++){
						if(i!=this.index){
							$(".sonListUl").eq(i).slideUp();
							aP[i].className='';
						}
					}
					if( this.className == '' ){
						$(".sonListUl").eq(this.index).slideDown();
						this.className = 'active';
					} else {
						$(".sonListUl").eq(this.index).slideUp();
						this.className = '';
					}
				}
			}
		}
		function loginin(){
			location.href="${pageContext.request.contextPath }/personal/setLoginName.htm";
		}
		function loginout(){
			location.href="${pageContext.request.contextPath }/personal/loginout.htm";
		}
		function referLink(){
			
			$.ajax({
				method:'post',
				url:'loginCheck.htm',
				data:{
					  
				    },				
				success:function(data){
					
					var data = eval("(" + data + ")");
					
					if(data.message=='success'){
						
						location.href = "${pageContext.request.contextPath }/lotterts/shareMoney.htm";
					}else{
						dialogCb(data.result,'暂不绑定','去完善资料',function(){
							location.href = "bindPhoneNums.htm";
						});
						
					}
		   
				},
				error : function() {
					dialog("网络出错");
				}
			})
			
		
			
			/* location.href="${pageContext.request.contextPath }/lotterts/shareMoney.htm"; */
		}
		function referLinkWx(){
			location.href="${pageContext.request.contextPath }/personal/referLinkWx.htm";
		}
		function bindPhoneNums(){
			location.href="${pageContext.request.contextPath }/personal/bindPhoneNums.htm";
		}
		function publicNotice(){
			window.location.href = "${pageContext.request.contextPath }/personal/publicNotice.htm";
		}
		function setLoginName(){
			window.location.href = "${pageContext.request.contextPath }/personal/setLoginName.htm";
		}
		function bindChangeCounds(){
			
			$.ajax({
				method:'post',
				url:'loginCheck.htm',
				data:{
					  
				    },				
				success:function(data){
					
					var data = eval("(" + data + ")");
					
					if(data.message=='success'){
						
						location.href = "find1.htm";
					}else{
						dialogCb(data.result,'暂不绑定','去完善资料',function(){
							location.href = "bindPhoneNums.htm";
						});
						
					}
		   
				},
				error : function() {
					dialog("网络出错");
				}
			})
			
		}
		function commission(){
			
			$.ajax({
				method:'post',
				url:'loginCheck.htm',
				data:{
					  
				    },				
				success:function(data){
					
					var data = eval("(" + data + ")");
					
					if(data.message=='success'){
						
						location.href = "comm.htm";
					}else{
						dialogCb(data.result,'暂不绑定','去完善资料',function(){
							location.href = "bindPhoneNums.htm";
						});
						
					}
		   
				},
				error : function() {
					dialog("网络出错");
				}
			})
			
		}
	</script>
</body>
</html>