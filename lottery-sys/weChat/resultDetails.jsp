<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>详细信息</title>
</head>
<body>
期号：${list.pNum }</br>
开奖时间：${list.creatTime }</br>
开奖结果：${list.result }</br>
是否中奖：
<c:if test="${list.isWin==0 }">
	中奖</br>
</c:if>
<c:if test="${list.isWin==1 }">
	未中奖</br>
</c:if>
${isWin }</br>
金额：${list.money }<br/>

<a href="javascript:history.back(-1)">返回</a>
</body>
</html>