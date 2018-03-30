<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的消息</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/myMessage.css"/>
	</head>
<body>
		<div id="content">
		<!-- 顶部副导航 -->
		<%@ include file="../../head.jsp"%>
		<!-- 个人中心内容 -->
		<div class="personalCenCon clearfix w1100">
			<%@ include file="personalHead.jsp" %>
			<div class="rightPersonal fr">
				<strong class="rightTit"><span></span>我的消息<a href="javascript:void(0);" onclick="fh(${song.username})">返回列表&gt;&gt;</a></strong>
				<div class="rightCon">
					<div class="messageWrap">
						<h3>${msg.msgTitle }</h3>
						<div class="detailMsgCon">
							<p>${msg.msgComents }</p>
							<span>${msg.createTime }</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<script src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			function fh(username){
				//$("#my a").attr("href","javascript:mymsg('"+username+" ')");
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
