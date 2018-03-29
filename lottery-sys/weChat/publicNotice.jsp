<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>公告</title>
	<link rel="stylesheet" href="../weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_6u90gnv3u6hzd7vi.css"/>
	<link rel="stylesheet" href="../weChat/reception/css/setPassword.css">
	<link rel="stylesheet" href="../weChat/reception/css/footer.css"/>
	<style type="text/css">
		.listPar{width: 100%;padding:0 10px;margin-top:20px;}
		.comListCon{
			width: 100%;
			border:1px solid #1f1f1f;
			border-radius: 4px;
			padding-bottom: 5px;
			margin-top: 20px;
		}
		.listTop{
			background: #f7f7f7;
			height: 40px;
			line-height: 40px;
			text-align: center;
			margin-bottom: 5px;
		}
		.listBot p{
			color: #333;
			margin:5px 0;
			font-size: 0.6rem;
			padding:0 0.6rem;
		}
		.listBot p:first-child{
			margin-top:0.5rem;
		}
		.thirdBlank{
			width: 5px;
			display: inline-block;
		}
		.checkNextBtn{
			width: 100%;
			height: 25px;
			line-height: 25px;
			text-align: right;
			display: inline-block;
			padding-right: 10px;
			color: #cf3e45;
			font-size: 0.6rem;
			text-decoration: underline;
		}
	</style>
</head>
<body style="padding-bottom: 50px;">
	<header class="aui-bar aui-bar-nav headerNav" style="position: fixed;left: 0;top:0;">
        <a class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)" href="javascript:void(0)">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <div class="aui-title">公告</div>
    </header>
	<!-- listCon -->
	<div class="listPar" style="margin-top: 2.6rem;">
		<c:forEach items="${list}" var="notice">
		<div class="comListCon">
			<!-- topPart -->
			<div class="listTop">
				<h4 class="aui-ellipsis-1">${notice.title }</h4>
			</div>
			<!-- botPart -->
			<div class="listBot clearfix">
				<p>${notice.content }</p>
				<!-- <p>亲爱的客户： [腾讯分分彩]每日开放投注时间：早上9点~凌晨2点</p> -->
			</div>
		</div>
		</c:forEach>
		<!-- <div class="comListCon">
			topPart
			<div class="listTop">
				<h4 class="aui-ellipsis-1">微笑QQ入款</h4>
			</div>
			botPart
			<div class="listBot clearfix">
				<p>亲爱的客户：</p>
				<p>亲爱的客户： [腾讯分分彩]每日开放投注时间：早上9点~凌晨2点</p>
			</div>
		</div>
		<div class="comListCon">
			topPart
			<div class="listTop">
				<h4 class="aui-ellipsis-1">微笑QQ入款</h4>
			</div>
			botPart
			<div class="listBot clearfix">
				<p>亲爱的客户：</p>
				<p>亲爱的客户： [腾讯分分彩]每日开放投注时间：早上9点~凌晨2点</p>
			</div>
		</div>
	</div> -->
	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="../weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/personalCenter.js"></script>
	<script type="text/javascript">
		$(function(){

		});
		function searchMyPeople(){
			var accountInpVal = $("#accountInp").val();
			if(accountInpVal == ""){
				dialog('请输入您要查询的账号');
				return;
			}
		}
	</script>
</body>
</html>