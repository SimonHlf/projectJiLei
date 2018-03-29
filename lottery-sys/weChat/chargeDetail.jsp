<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>充值明细</title>
	<link rel="stylesheet" href="../weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="../weChat/reception/css/chargeDetail.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_6u90gnv3u6hzd7vi.css"/>
	<style type="text/css">
		.oneBlank{width:8px;display:inline-block;}
	</style>
</head>
<body style="padding-bottom: 51px;">
	<header class="aui-bar aui-bar-nav headerNav" style="position: fixed;left: 0;top: 0">
        <a class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)" href="javascript:void(0)">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <div class="aui-title">充值明细</div>
        <input type="hidden" id="chargeType" value="${chargeType }">
    </header>
    <div class="aui-content" style="margin-top: 2.25rem;">
    	<!-- 选择的充值方式 -->
    	<p class="payWayName"><c:if test="${chargeType==1 }">支付宝</c:if><c:if test="${chargeType==2 }">微信</c:if><c:if test="${chargeType==3 }">银行卡</c:if></p>
    	<ul class="aui-list aui-form-list" style="background-image: none;">
    		<!-- <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                        充值码：
                    </div>
                    <div class="aui-list-item-input">
                    	<span>复制</span>
                        <input type="text" placeholder="">
                    </div>
                </div>
            </li> -->
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                        充值单号：
                    </div>
                    <div class="aui-list-item-input">
                        <input id="tradeNo" type="text" readonly="readonly" value="${tradeNo}" placeholder="">
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                        充值金额：
                    </div>
                    <div class="aui-list-item-input">
                        <input id="changMoney" onblur="checkCash()" type="text" placeholder="请输入充值金额">
                    </div>
                </div>
            </li>
           <!--  <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                        付款人：
                    </div>
                    <div class="aui-list-item-input">
                        <input id="userName" type="text" onblur="checkWho()" placeholder="请输入付款人姓名">
                    </div>
                </div>
            </li> -->
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                        付款账号：
                    </div>
                    <div class="aui-list-item-input">
                         <c:if test="${chargeType==1 }"><input id="accound" type="text" onblur="checkAccound()" value="${zf_code}" placeholder="请输入付款账号"></c:if>
                        <c:if test="${chargeType==2 }"><input id="accound" type="text" onblur="checkAccound()" value="${wx_code}" placeholder="请输入付款账号"></c:if>
                        <c:if test="${chargeType==3 }"><input id="accound" type="text" onblur="checkAccound()" value="${bank_num}" placeholder="请输入付款账号"></c:if>
                    </div>
                </div>
            </li>
            <c:if test="${chargeType==3 }">
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                       	开<span class="oneBlank"></span>户<span class="oneBlank"></span>人：
                    </div>
                    <div class="aui-list-item-input">
                    <c:forEach items="${list}" var="person">
                        <c:if test="${person.type==8 }"> <input id="accPerName" type="text" value="${person.contactNuma }" readonly="readonly"></c:if>
                     </c:forEach>    
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                       	开<span class="oneBlank"></span>户<span class="oneBlank"></span>行：
                    </div>
                    <div class="aui-list-item-input">
                    <c:forEach items="${list}" var="person">
                        <c:if test="${person.type==10 }"> <input id="accBankName" type="text" value="${person.contactNuma }" readonly="readonly"></c:if>
                        </c:forEach>
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                       	开户账户：
                    </div>
                    <div class="aui-list-item-input">
                    <c:forEach items="${list}" var="person">
                         <c:if test="${person.type==9 }"><input id="accNum" type="number" value="${person.contactNuma }" readonly="readonly"></c:if>
                         </c:forEach>
                    </div>
                </div>
            </li>
            </c:if>
            <li class="aui-list-item" <c:if test="${chargeType==3 }">style="display:none" </c:if> style="background-image:none;">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">
                        收款二维码：
                    </div>
                    <div class="aui-list-item-input">
                    	<div style="width: 80px;height: 80px;background: red;margin:10px 0 0 30px;">
                    	<c:if test="${chargeType==1 }">
		                    	<%-- <c:forEach items="${lists}" var="persons"> --%>
								<%-- <c:if test="${persons.type==3 }"> --%><img alt="支付宝二维码" src="/${png1.path }"><%-- </c:if> --%>
								<%-- </c:forEach> --%>
                    	 </c:if>
                    	 <c:if test="${chargeType==2 }">
		                    	<%-- <c:forEach items="${lists}" var="persons"> --%>
								<%-- <c:if test="${persons.type==4 }"> --%><img alt="微信二维码" src="/${png1.path }"><%-- </c:if> --%>
								<%-- </c:forEach> --%>
                    	 </c:if>
                    	</div>
                    </div>
                </div>
            </li>
    	</ul>
		<!-- 温馨提示 --><%-- <c:if test="${chargeType==3 }">
		<div class="tipInfoDiv">
			<div class="infoCon">
				<c:forEach items="${list}" var="person">
					<p><c:if test="${person.type==8 }">${person.contactNuma }
					</c:if></p>
					</c:forEach>
				<c:forEach items="${list}" var="person">
					<p><c:if test="${person.type==9 }">${person.contactNuma }
					</c:if></p>
					</c:forEach>
				<c:forEach items="${list}" var="person">
					<p><c:if test="${person.type==10 }">${person.contactNuma }
					</c:if></p>
					</c:forEach>
			</div>
		</div></c:if> --%>
		<div class="tipInfoDiv">
			<strong>温馨提示：</strong>
			<div class="infoCon">
				<p>1、温馨提示提示温馨提示提示温馨提示提示温馨提示提示温馨提示提示温馨提示提示温馨提示提示</p>
				<p>2、温馨提示提示温馨提示提示温馨提示提示温馨提示提示温馨提示提示温馨提示提示温馨提示提示</p>
				<p>2、温馨提示提示温馨提示提示温馨提示提示温馨提示提示温馨提示提示温馨提示提示温馨提示提示</p>
				<p>4、温馨提示提示温馨提示提示温馨提示提示温馨提示提示温馨提示提示温馨提示提示温馨提示提示</p>
			</div>
		</div>
    </div>
    <script type="text/javascript" src="../weChat/reception/jsPlugin/jquery.min.js"></script>
    <script type="text/javascript" src="../weChat/reception/jsPlugin/layer/layer.js"></script>
    <!-- 立即充值 -->
    <div class="goChargeDiv">
    	<a href="javascript:void(0)" tapmode onclick="paySuc();">完成充值</a>
    </div>
    <script type="text/javascript">
			function paySuc(){
				var chargeType = $.trim($("#chargeType").val());
				var tradeNo = $.trim($("#tradeNo").val());
				var changeMoney = $.trim($("#changMoney").val());
				var accound = $.trim($("#accound").val());
				if(changeMoney == ""){
	                alert('金额不能为空');
	                return;
				}else if(accound == ""){
					alert('账号不能为空');
	                return;
				}else if(checkCash()&&checkAccound()== false){
					layer.msg('格式不正确');
	                return;
				}else{
					$.ajax({
						method:'post',
						url:'chargeMoney.htm',
						data:{
							chargeType:chargeType,
							tradeNo:tradeNo,
							changeMoney:changeMoney,
							accound:accound
						},
						 success:function(data){
							 layer.msg("充值申请提交成功",{icon: 6,time:1000},function(){
									location.href = "indexs.htm";
								});
							
						}, 
						error:function(data){
							layer.msg("充值出错");
						}
					})
				}
				
				
			};
	</script>
	<script type="text/javascript">
	function checkCash(){
		var userId = $.trim($("#changMoney").val());
		var reg = /^(([1-9][0-9]*)|(([0]\.\d{1,2}|[1-9][0-9]*\.\d{1,2})))$/;
		var falg = true;
		if(userId != null && userId != ""){
			if(!reg.test(userId)){
				layer.tips("请输入正确的金额", "#changMoney", {tips: [2, "#E34127"],time: 1000});
				falg = false;
			}
		}
		return falg;
	}
	/* function checkWho(){
		var userId = $.trim($("#userName").val());
		var reg =  /^[\u4E00-\u9FA5A-Za-z]+$/;
		var falg = true;
		if(userId != null && userId != ""){
			if(!reg.test(userId)){
				layer.tips("请输入正确的姓名", "#userName", {tips: [2, "#E34127"],time: 1000});
				falg = false;
			}
		}
		return falg;
	} */
	function checkAccound(){
		var userId = $.trim($("#accound").val());
		var reg =  /(?!^\d+$)(?!^[a-zA-Z]+$)[0-9a-zA-Z]{4,23}/;
		var falg = true;
		if(userId != null && userId != ""){
			if(!reg.test(userId)){
				layer.tips("请输入正确的账号", "#accound", {tips: [2, "#E34127"],time: 1000});
				falg = false;
			}
		}
		return falg;
	}
	/* function checkPassword(){
		var userId = $.trim($("#password").val());
		var reg =  /^[\u4E00-\u9FA5A-Za-z]+$/;
		var falg = true;
		if(userId != null && userId != ""){
			if(!reg.test(userId)){
				layer.tips("请输入正确的密码", "#password", {tips: [2, "#E34127"],time: 1000});
				falg = false;
			}
		}
		return falg;
	} */

	</script>
</body>
</html>