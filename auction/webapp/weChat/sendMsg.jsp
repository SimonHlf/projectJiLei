<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath }/admin/assets/js/jquery-2.0.3.min.js"></script>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>商家帮-发送信息</title>
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
		.aui-list-item-input input::-webkit-input-placeholder{
			color:#ccc;
			font-size:0.7rem;
		}
		.aui-list-item-label{
			font-size:0.7rem;
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
            window.location.href = "merchant.jsp";
        }
	</script>
</head>
<body>
	<div id="wrapBox">
		<div id="wrapScroll">
			<section class="aui-content user-info aui-text-center aui-margin-b-15">
				<img src="${sessionScope.consumer.pic }" class="avatar aui-img-round">
				<h2 class="aui-margin-t-15">
					${sessionScope.consumer.name }<small><i
						class="aui-iconfont aui-icon-cert aui-text-danger"></i></small>
				</h2>
			</section>

			<section class="aui-content aui-grid aui-margin-b-15">
				<div class="aui-row">
					<div class="aui-col-xs-4 aui-border-r">
						<big class="aui-text-warning">${sessionScope.consumer.balance }<small>
								元</small></big>
						<div class="aui-gird-lable aui-font-size-12">现金余额</div>
					</div>
					<div class="aui-col-xs-4 aui-border-r">
						<big class="aui-text-danger">${sessionScope.consumer.cash }<small>
								元</small></big>
						<div class="aui-gird-lable aui-font-size-12">优惠券余额</div>
					</div>
					<div class="aui-col-xs-4 aui-border-r">
						<big class="aui-text-danger">${sessionScope.consumer.insurance }<small>
								元</small></big>
						<div class="aui-gird-lable aui-font-size-12">保险金</div>
						
					</div>
				</div>
			</section>
			<div class="aui-content">
				<form class="am-form"  method="post" id="msgFrom"
					  action="">
					<ul class="aui-list aui-form-list">
						<li class="aui-list-item">
							<div class="aui-list-item-inner">
								<div class="aui-list-item-label">
									标题：
								</div>
								<div class="aui-list-item-input">
									<input type="text" id="title" name="title" placeholder="请输入标题">
									<input type="hidden" id="merchantId" name="merchantId" value="${sessionScope.consumer.id }">
								</div>
							</div>
						</li>
						<li class="aui-list-item">
							<div class="aui-list-item-inner">
								<div class="aui-list-item-label">
									信息类别：
								</div>
								<div class="aui-list-item-input">
									<select name="type" id="type">
										<option value="0">请选择信息类别</option>
										<c:forEach var="newsType" items="${newsTypeList }">
											<option value="${newsType.id }">${newsType.name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</li>
						<li class="aui-list-item">
							<div class="aui-list-item-inner">
								<div class="aui-list-item-label">
									内容：
								</div>
								<div class="aui-list-item-input">
									<textarea placeholder="请输入您要发送的内容" id="content" name="content"></textarea>
								</div>
							</div>
						</li>
						<li class="aui-list-item">
							<div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
								<div class="aui-btn aui-btn-info aui-margin-r-5" tapmode onclick="sendMsg()">提交</div>
								<div class="aui-btn aui-btn-danger aui-margin-l-5" tapmode onclick="cancelSave()">取消</div>
							</div>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="nav.jsp" />
	<script>
	function sendMsg(){
		var title=$("#title").val();
		var type=$("#type").val();
		var content=$("#content").val();
		$.ajax({
			method:'post',
			url:'addNews.htm',
			data:{
				title:title,
				type:type,
				content:content
			},
			success:function(data){
				alert("发布信息成功");
				window.location.href="personal2.htm";
			},
			error:function(data){
				alert("发布信息失败");
			}
		})
	}
	</script>
</body>
</html>