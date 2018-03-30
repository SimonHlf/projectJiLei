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
<title></title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css/aui.css" />
<link rel="stylesheet" href="css/aui-flex.css">
<link rel="stylesheet" href="css/aui-slide.css">
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
</style>
</head>
<body>
	<section class="aui-content user-info aui-text-center aui-margin-b-15">
		<img src="${sessionScope.consumer.pic }" class="avatar aui-img-round">
		<h2 class="aui-margin-t-15">${sessionScope.consumer.name }<small><i
				class="aui-iconfont aui-icon-cert aui-text-danger"></i></small>
		</h2>
	</section>

	<section class="aui-content aui-grid aui-margin-b-15">
		<div class="aui-row">
			<div class="aui-col-xs-6 aui-border-r">
				<big class="aui-text-warning">${sessionScope.consumer.balance }<small>
						元</small></big>
				<div class="aui-gird-lable aui-font-size-12">优惠券</div>
			</div>
			<div class="aui-col-xs-6 aui-border-r">
				<big class="aui-text-danger">${sessionScope.consumer.insurance }<small>
						元</small></big>
				<div class="aui-gird-lable aui-font-size-12">保险金</div>
			</div>
		</div>
	</section>

	<section class="aui-content">
		<input type="hidden" value="${sessionScope.consumer.id}" id="id"
			   name="id">
		<ul class="aui-list aui-form-list">
			<li class="aui-list-item">
				<div class="aui-list-item-inner">
					<div class="aui-list-item-label-icon">
						<i class="aui-iconfont aui-icon-lock smIcon"></i>
					</div>
					<div class="aui-list-item-input">
						<input type="text" name="pwd1" id="pwd1"
							   placeholder="原密码">
					</div>
				</div>
			</li>
			<li class="aui-list-item">
				<div class="aui-list-item-inner">
					<div class="aui-list-item-label-icon">
						<i class="aui-iconfont aui-icon-lock smIcon"></i>
					</div>
					<div class="aui-list-item-input">
						<input type="text" name="pwd2" id="pwd2"
							   placeholder="新密码">
					</div>
				</div>
			</li>
			<li class="aui-list-item">
				<div class="aui-list-item-inner">
					<div class="aui-list-item-label-icon">
						<i class="aui-iconfont aui-icon-lock smIcon"></i>
					</div>
					<div class="aui-list-item-input">
						<input type="text" name="pwd3" id="pwd3"
							   placeholder="再次确认密码">
					</div>
				</div>
			</li>
			<li class="aui-list-item">
				<div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
					<div class="aui-btn aui-btn-info aui-margin-r-5" tapmode onclick="editPwd()">确认</div>
					<div class="aui-btn aui-btn-danger aui-margin-l-5" tapmode onclick="cancelSave()">取消</div>
				</div>
			</li>
		</ul>
	</section>
	<jsp:include page="nav.jsp" />
</body>
<script>
	function editPwd(){
		var id=$("#id").val();
		var pwd1=$("#pwd1").val();
		var pwd2=$("#pwd2").val();
		var pwd3=$("#pwd3").val();
		if(pwd2 != pwd3){
			alert("新密码与再次确认密码不一致");
			return;
		}else{
			$.ajax({
				method:'post',
				url:'savePersonal.htm',
				data:{
					id:id,
					pwd1:pwd1,
					password:pwd2
				},
				success:function(data){
					alert("密码修改成功");
					window.location.href="personal.jsp"
				},
				error:function(data){
					alert("密码修改失败");
				}
			})
		}

	}
    function cancelSave(){
        window.location.href = "personal.jsp";
    }
</script>
</html>