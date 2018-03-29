<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>下注记录</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/comSearchList.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_o481gv40tywlv7vi.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/footer/footer.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/personalCen/css/setPassword.css"/>
	<link href="${pageContext.request.contextPath }/weChat/reception/css/mobiscroll.core-2.5.2.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/weChat/reception/css/mobiscroll.animation-2.5.2.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/weChat/reception/css/mobiscroll.android-ics-2.5.2.css" rel="stylesheet" type="text/css" />
</head>
<body>

 <v:pagination page="${page}" url="changerecodes/find.htm?1=1"></v:pagination>
<!-- 查询结果list -->
    	<ul class="listNav betListNav clearfix">
    		<li>时间</li>
    		<li>游戏类型</li>
    		<li>投注信息</li>
    	</ul>
    	<div class="searListDiv betList">
    		<ul>
    			<c:forEach items="${list }" var="list">
	    			<li>
	    				<p>${list.creatTime }</p>
	    				<p class="aui-ellipsis-1">
	    					<c:if test="${list.type==0 }">
	    						充值
	    					</c:if>
	    					<c:if test="${list.type==1 }">
	    						提现
	    					</c:if>
	    					<c:if test="${list.type==2 }">
	    						下注
	    					</c:if>
	    					<c:if test="${list.type==3 }">
	    						中奖
	    					</c:if>
	    					<c:if test="${list.type==4 }">
	    						佣金
	    					</c:if>
	    				</p>
	    				<p>
	    					<span>${list.changeMoney }</span>元
	    				</p>
	    			</li>
    			</c:forEach>
    		</ul>
    		
    	</div>
    	<div class="botClose" tapmode onclick="closeList()">
			<i class="iconfont icon-guanbi"></i>
    	</div>
    <script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.core-2.5.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.core-2.5.2-zh.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.datetime-2.5.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.datetime-2.5.1-zh.js"></script>
	<!-- S 可根据自己喜好引入样式风格文件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.android-ics-2.5.2.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/aui-dialog.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/personalCen/js/personalCen.js"></script>
	<script type="text/javascript">
		function closeList(){
			location.href='${pageContext.request.contextPath }/personal/toAcc.htm';
		}
	</script>
</body>
</html>