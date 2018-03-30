<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="${pageContext.request.contextPath }/admin/assets/js/jquery-2.0.3.min.js"></script>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>商家帮-申请成为商户</title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css/aui.css" />
<script src="js/iscroll.js"></script>
<script src="js/comScroll.js"></script>
<style type="text/css">
	.user-info {
		background-color: #ffffff;
		padding: 10px 0;
	}

	img.avatar {
		display: block;
		margin: 0 auto;
		width: 20%;
	}

	.aui-list .aui-list-header {
		background-color: #ffffff;
		line-height: 1.2rem;
	}
	.aui-list{
		background-image:none !important;
	}
	.aui-list-item{
		border-bottom:1px solid #eee !important;
		background-image:none !important;
	}
	.aui-list-item-input input::-webkit-input-placeholder{
		color:#ccc;
		font-size:0.7rem;
	}
	.smIcon{
		color:#666;
		font-size:1.2rem;
	}
	#wrapBox {
		width: 100%;
		position: relative;
		overflow: hidden;
	}

	#wrapScroll {
		width: 100%;
		position: absolute;
		left: 0;
		top: 0px;
		-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	}
</style>
<script type="text/javascript">
	window.onload = function() {
		wrapScroll();
	}
</script>
</head>
<body>
	<div id="wrapBox">
		<div id="wrapScroll">
			<section class="aui-content user-info aui-text-center aui-margin-b-15">
				<img src="${sessionScope.consumer.pic }" class="avatar aui-img-round">
				<h2 class="aui-margin-t-15">${sessionScope.consumer.name }<small><i
						class="aui-iconfont aui-icon-cert aui-text-danger"></i></small>
				</h2>
			</section>

			<section class="aui-content aui-grid aui-margin-b-15">
				<div class="aui-row">
					<div class="aui-col-xs-6 aui-border-r">
						<big class="aui-text-warning">${sessionScope.consumer.cash }<small>
								元</small></big>
						<div class="aui-gird-lable aui-font-size-12">优惠券余额</div>
					</div>
					<div class="aui-col-xs-6 aui-border-r">
						<big class="aui-text-danger">${sessionScope.consumer.insurance }<small>
								元</small></big>
						<div class="aui-gird-lable aui-font-size-12">保险金</div>
					</div>
				</div>
			</section>

			<section class="aui-content">
			<form class="am-form" method="post" id="applyForMerchant"
							  action="savePersonal.htm">
				<input type="hidden" value="${sessionScope.consumer.id}" id="id"
					   name="id">
				<ul class="aui-list aui-form-list">
					<li class="aui-list-item">
						<div class="aui-list-item-inner">
							<div class="aui-list-item-label-icon">
								<i class="aui-iconfont aui-icon-my smIcon"></i>
							</div>
							<div class="aui-list-item-input">
								<input type="text" name="realName" id="realName"
									   placeholder="申请人姓名" required>
							</div>
						</div>
					</li>
					<li class="aui-list-item">
						<div class="aui-list-item-inner">
							<div class="aui-list-item-label-icon">
								<i class="aui-iconfont aui-icon-mobile smIcon"></i>
							</div>
							<div class="aui-list-item-input">
								<input type="number" name="mobile" id="mobile"
									   placeholder="手机号" required>
							</div>
						</div>
					</li>
					<li class="aui-list-item">
						<div class="aui-list-item-inner">
							<div class="aui-list-item-label-icon">
								<i class="aui-iconfont aui-icon-mobile smIcon"></i>
							</div>
							<div class="aui-list-item-input">
								<input type="text" name="attr0" id="attr0"
									   placeholder="身份证号" required>
							</div>
						</div>
					</li>
					<li class="aui-list-item">
						<div class="aui-list-item-inner">
							<div class="aui-list-item-label-icon">
								<i class="aui-iconfont aui-icon-home smIcon"></i>
							</div>
							<div class="aui-list-item-input">
								<input type="text" name="attr2" id="attr2"
									   placeholder="门店名称" required>
							</div>
						</div>
					</li>
					<li class="aui-list-item">
						<div class="aui-list-item-inner">
							<div class="aui-list-item-label-icon">
								<i class="aui-iconfont aui-icon-location smIcon"></i>
							</div>
							<div class="aui-list-item-input">
								<input type="text" name="attr3" id="attr3"
									   placeholder="地址" required>
							</div>
						</div>
					</li>
					<li class="aui-list-item">
						<div class="aui-list-item-inner">
							<div class="aui-list-item-label-icon">
								<i class="aui-iconfont aui-icon-edit smIcon"></i>
							</div>
							<div class="aui-list-item-input">
							<!-- 	<input type="text" name="attr4" id="attr4"
									   placeholder="门店描述" required> -->
									   <textarea rows="" cols="" name="attr4" id="attr4" placeholder="门店描述" required></textarea>
							</div>
						</div>
					</li>
					<li class="aui-list-item">
						<div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
							<div class="aui-btn aui-btn-info aui-margin-r-5" tapmode onclick="applyMerchant()">确认</div>
							<div class="aui-btn aui-btn-danger aui-margin-l-5" tapmode onclick="cancelSave()">取消</div>
						</div>
					</li>
				</ul>
				</form>
			</section>
		</div>
	</div>
	<jsp:include page="nav.jsp" />
</body>
<script>
	function applyMerchant(){
		var realName=$("#readName").val();
		var mobile=$("#mobile").val();
		var attr0=$("#attr0").val();
		var attr2=$("#attr2").val();
		var attr3=$("#attr3").val();
		var attr4=$("#attr4").val();
         if(realName == "" || mobile == "" || attr2 == "" || attr3 == "" || attr4 == ""){
        	 alert("请输入完整申请信息");
        	 return;
         }	
      // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X  
         var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
      
         if(reg.test(attr0) === false)  
         {  
             alert("身份证输入不合法");  
             return;  
         }  
			 $.ajax({
					method:'post',
					url:'applyMerchant.htm',
					data:new FormData($("#applyForMerchant")[0]),
					processData:false,
					contentType:false,
					success:function(data){
						alert("申请发送成功");
						 window.location.href="personal2.htm"
					},
					error:function(data){
						alert("申请发送失败");
					}
			 }) ;
		
	}
    function cancelSave(){
        window.location.href = "personal2.htm";
    }
</script>
</html>