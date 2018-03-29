<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath }/admin/assets/js/jquery-2.0.3.min.js"></script>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>彩票-编辑个人资料</title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css/aui.css" />
<link rel="stylesheet" href="css/aui-flex.css">
<link rel="stylesheet" href="css/aui-slide.css">
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
		.aui-list- item{
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
		#wrapBox{
			width: 100%;
			position:relative;
			overflow: hidden;
		}
		#wrapScroll{
			width:100%;
			position:absolute;
			left:0;
			top:0px;
			-webkit-tap-highlight-color:rgba(0,0,0,0);
		}
	</style>
	<script type="text/javascript">
		window.onload = function(){
            wrapScroll();
		}
		function cancelSave(){
		    window.location.href = "personal2.htm";
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
				<form class="am-form" method="post" id="save"
					  action="">
					<ul class="aui-list aui-form-list">
					<input type="hidden" value="${sessionScope.consumer.id }" name="id">
						<li class="aui-list-item">
							<div class="aui-list-item-inner">
								<div class="aui-list-item-label-icon">
									<i class="aui-iconfont aui-icon-my smIcon"></i>
								</div>
								<div class="aui-list-item-input">
									<input type="text" value="${sessionScope.consumer.name}" name="name" placeholder="姓名" id="name1">
									<input type="hidden" value="${sessionScope.consumer.name}"placeholder="姓名" id="name2">
								</div>
							</div>
						</li>
						<li class="aui-list-item">
							<div class="aui-list-item-inner">
								<div class="aui-list-item-label-icon">
									<i class="aui-iconfont aui-icon-mobile smIcon"></i>
								</div>
								<div class="aui-list-item-input">
									<input type="text"
										   value="${sessionScope.consumer.mobile}" name="mobile" id="mobile1"
										   placeholder="手机号">
										   <input type="hidden"
										   value="${sessionScope.consumer.mobile}"  id="mobile2"
										   placeholder="手机号">
								</div>
							</div>
						</li>
						<li class="aui-list-item">
							<div class="aui-list-item-inner">
								<div class="aui-list-item-label-icon">
									<i class="aui-iconfont aui-icon-cert smIcon"></i>
								</div>
								<div class="aui-list-item-input">
									<input type="text"
										   value="${sessionScope.consumer.attr0}" name="attr0" id="attr01"
										   placeholder="身份证号">
										   <input type="hidden"
										   value="${sessionScope.consumer.attr0}"id="attr02"
										   placeholder="身份证号">
								   <input type="hidden" value="${sessionScope.consumer.type }" name="type">
								</div>
							</div>
						</li>
						<li class="aui-list-item">
							<div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
								<div class="aui-btn aui-btn-info aui-margin-r-5" tapmode onclick="apply()">提交</div>
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
	function apply(){
		var name1=$("#name1").val();
		var name2=$("#name2").val();
		var mobile1=$("#mobile1").val();
		var mobile2=$("#mobile2").val();
		var attr01=$("#attr01").val();
		var attr02=$("#attr02").val();
		 // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X  
        var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
        if(reg.test(attr01) === false)  
        {  
            alert("身份证输入不合法");  
            return;  
        } 
		if(name1 == name2 && mobile1 ==mobile2 && attr01 == attr02){
			 window.location.href = "personal2.htm";
		}else{
			 $.ajax({
					method:'post',
					url:'savePersonal.htm',
					data:new FormData($("#save")[0]),
					processData:false,
					contentType:false,
					success:function(data){
						alert("修改个人资料成功");
						 window.location.href = "personal2.htm";
					},
					error:function(data){
						alert("修改个人资料失败");
					}
				}) 
		}
			
	}
   
</script>
</html>