<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>下注记录</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/aui.css"/>
	<style type="text/css">
		.aui-list-item-label{color:#757575 !important;text-align: right;}
		.aui-list-item-input p{color:#212121;}
	</style>
</head>
<body>
	<header class="aui-bar aui-bar-nav headerNav">
        <a class="aui-pull-left aui-btn" href="javascript:history.go(-1)">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <div class="aui-title">投注记录详情</div>
    </header>
    <!-- mainCon -->
    <div class="comInpBox">
    	<div class="aui-content">
    		<ul class="aui-list aui-form-list">
		        <li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">
		                    投注时间：
		                </div>
		                <div class="aui-list-item-input">
		                    <p>${list.creatTime }</p>
		                </div>
		            </div>
		        </li>
		        <li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">
		                   期号：
		                </div>
		                <div class="aui-list-item-input">
		                    <p>${list.pNum }</p>
		                </div>
		            </div>
		        </li>
		        <li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">
		                    开奖结果：
		                </div>
		                <div class="aui-list-item-input">
		                    <p>
		                    	${list.result }
		                    </p>
		                </div>
		            </div>
		        </li>
		        <li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">
		                    是否中奖：
		                </div>
		                <div class="aui-list-item-input">
		                    <c:if test="${list.isWin==0 }">
								中奖</br>
							</c:if>
							<c:if test="${list.isWin==1 }">
								未中奖</br>
							</c:if>
		                </div>
		            </div>
		        </li>
		        <li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">
		                    金额：
		                </div>
		                <div class="aui-list-item-input">
		                   ${list.money }
		                </div>
		            </div>
		        </li>
    		</ul>
    	</div>
    </div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
		});
	</script>
</body>
</html>