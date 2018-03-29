<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>绑定银行卡</title>
<link rel="stylesheet" href="../weChat/reception/css/aui.css" />
<link rel="stylesheet"
	href="http://at.alicdn.com/t/font_535570_6u90gnv3u6hzd7vi.css" />
<link rel="stylesheet" href="../weChat/reception/css/setPassword.css" />
<link rel="stylesheet" href="../weChat/reception/css/footer.css">
<style type="text/css">
	.comInpBox li .inpDiv input[disabled]{color:#000 !important;opacity:1}
</style>
</head>
<body>
	<div class="aui-bar aui-bar-nav headerNav"> <a
		class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)"
		href="javascript:void(0)"> <span
		class="aui-iconfont aui-icon-left"></span>
	</a>
	<div class="aui-title">绑定银行卡</div>
	</div>
	<!-- mainCon -->
	<div class="comInpBox">
		<ul>
			<li>
				<div class="txtDiv">
					选<span class="twoBlank"></span>择<span class="twoBlank"></span>银<span
						class="twoBlank"></span>行：
				</div>
				<div class="inpDiv">
					<input id="selBankInp" type="text" value="${frontUser.khf }" placeholder="请选择开户行" disabled/>
				</div>
			</li>
			<li>
				<div class="txtDiv">
					开<span class="oneBlank"></span>户<span class="oneBlank"></span>省：
				</div>
				<div class="inpDiv">
                    <input type="text" value="${frontUser.province }" disabled placeholder="请选择开户地址"><!-- id="selBankLocInp" -->
                </div>
			</li>
			<li>
				<div class="txtDiv">开户人姓名：</div>
				<div class="inpDiv">
					<input id="personNameInp" value="${frontUser.realName }" disabled  type="text" placeholder="请输入开户人姓名">
				</div>
			</li>
			<li>
				<div class="txtDiv">
					银<span class="twoBlank"></span>行<span class="twoBlank"></span>卡<span
						class="twoBlank"></span>号：
				</div>
				<div class="inpDiv">
					<input id="bankNumInp" value="${frontUser.bankNum }" disabled onblur="checkBankNum()" type="text" placeholder="请输入银行卡号">
				</div>
			</li>
			<li>
				<div class="txtDiv">
					支<span class="twoBlank"></span>行<span class="twoBlank"></span>名<span
						class="twoBlank"></span>称：
				</div>
				<div class="inpDiv">
					<input id="bankNameZhiInp" value="${frontUser.branch }" disabled type="text" placeholder="请输入支行名称">
				</div>
			</li>
		</ul>
		
		<a href="javascript:void(0)" tapmode onclick="saveBank()" class="aui-btn aui-btn-block comAuiBtn">修改</a>
	</div>
	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
		function saveBank(){
			location.href = "updatebindBankCard.htm";
		}
	</script>
</body>
</html>