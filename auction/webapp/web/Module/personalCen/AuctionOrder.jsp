<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="UTF-8">
		<title>竞拍订单</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/myShopCart.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/pagination.css"/>
	</head>
<body>
	<div id="content">
		<%@ include file="../../head.jsp"%>  
		<!-- 个人中心内容 -->
		<div class="personalCenCon clearfix w1100">
			<%@ include file="personalHead.jsp" %>
			<div class="rightPersonal fr">
				<strong class="rightTit"><span></span>竞拍订单</strong>
				<div class="rightCon">
					 <div class="cartConNav">
						<ul>
							<li class="oneAutiontWid">
								<span>商品信息</span>
							</li>
							<li class="twoAuctionWid">
								<span>拍卖时间</span>
							</li>
							<li class="twoCartWid">
								<span>拍卖金额(积分)</span>
							</li>
							<li class="twoCartWid">
								<span>状态</span>
							</li>
							<li class="twoCartWid">
								<span>操作</span>
							</li>
						</ul>
					</div>
					<div class="innerCartCon">
						<ul class="clearfix" id="listProUl">	
						</ul>
						<div id="Pagination" class="pagination"></div>
					</div> 
				</div>
			</div>
		</div>
		</div>
		<%@ include file="../../foot.jsp"%>  
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery.pagination.js"></script>	
		<script type="text/javascript">
			function payment(id,pid){
				$.ajax({
					type : "post",
					data:{id:id,pid:pid},
					url : "${pageContext.request.contextPath }/web/auctionOrder/payment.htm",
					success : function(data) {
						if(data==2){
							alert('账户积分不足');
						}else if(data==0){
							alert('支付成功')
							location.href='${pageContext.request.contextPath }/web/auctionOrder/order.htm';
						}else{
							alert('出现异常，请联系客服');
						}
					}
				});
			}
			
			function beat(id){
				location.href='${pageContext.request.contextPath }/web/auctionOrder/beat.htm?id='+id;
			}
			
			function goods(id,status){
				$.ajax({
					type : "post",
					data:{id:id,status:status},
					url : "${pageContext.request.contextPath }/web/auctionOrder/goods.htm",
					success : function(data) {
						if(data==1){
							alert('不能提货，正在竞拍');
						}else if(data==0){
							alert('请输入地址')
							location.href='${pageContext.request.contextPath }/web/auctionOrder/deliverySuccess.htm?id='+id;
						}else if(data==2){
							alert('已经被人拍到，不能提货')
						}
					}
				});
			}
			
			var pageSize = '${page.pageSize}';
			var totalListNum = '${page.total}';
			
			$(function(){
				showPageMBInfo('');
			});
			//分页用
			function showPageMBInfo(){
				var allCount = '${page.total}';
			    $("#Pagination").pagination(allCount, {
			        callback: pageselectCallback,  //PageCallback() 为翻页调用次函数。
			        prev_text: "上一页",
			        next_text: "下一页 ",
			        items_per_page:pageSize,
			        ellipse_text:"...",
			        num_edge_entries: 1,       //两侧首尾分页条目数
			        num_display_entries: 3   //连续分页主体部分分页条目数
			    });
			}
			//显示出列表数据
			function pageselectCallback(page_index,jq){
				getMBList(page_index+1,pageSize);
			}
			function getMBList(page,pageSize){
				$.ajax({
					type : "post",
					data:{page:page,pageSize:pageSize},
					url : "${pageContext.request.contextPath }/web/auctionOrder/orderPage.htm",
					success : function(html) {
						$("#listProUl").html(html);
					}
				});
			}	
		
			function message(username){
				mymsg(username);
			}
			
			function mymsg(str){
				$.ajax({
					type:'post',
					data:"username="+str,
					url:'${pageContext.request.contextPath}/web/tuimsgController/getPersonTuimsg.htm',
					success:function(data){
						$("#content").html(data);	
					},
					error:function(data){
					}
				});			
			}
		</script>
		
	</body>
</html>
