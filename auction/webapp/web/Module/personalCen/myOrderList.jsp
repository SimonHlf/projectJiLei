<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的订单</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/myOrderList.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/pagination.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/layer.css"/>
	</head>
	<body>
		<div id="content">
		<%@ include file="../../head.jsp"%>  
		<!-- 个人中心内容 -->
		<div class="personalCenCon clearfix w1100">
			<%@ include file="personalHead.jsp"%>  
			<div class="rightPersonal fr">
				<strong class="rightTit"><span></span>我的订单</strong>
				<div class="rightCon">
					<!-- tab导航 -->
					<div class="orderListNav">
						<ul class="clearfix" id="order_sort">
							<li onclick="queryOrder(0)">所有订单<span>${count}</span></li>
							<li onclick="queryOrder(1)">待付款<span>${c1}</span></li>
							<li onclick="queryOrder(2)">待发货<span>${c2}</span></li>
							<li onclick="queryOrder(3)">待收货<span>${c3}</span></li>
							<li onclick="queryOrder(4)">待评价<span>${c4}</span></li>
						</ul>
					</div>
					<!-- tab对应内容 所有订单 -->
					<div class="comOrderTabCon">
						<!-- 搜索订单 -->
						<!-- <div class="searchOrder">
							<input type="text" placeholder="请输入商品标题或订单编号" /><a href="javascript:void(0)">搜索</a>
						</div> -->
						<table class="orderListTab" cellpadding="0" cellspacing="0">
							<tr>
								<th class="oneWidTd noBorRight">商品图片&nbsp;&nbsp;&nbsp;&nbsp;商品名称</th>
								<th class="twoWidTd noBorLeft noBorRight">商品单价</th>
								<th class="twoWidTd noBorLeft noBorRight">购买数量</th>
								<th class="twoWidTd noBorLeft noBorRight">商品操作</th>
								<th class="threedWidTd noBorLeft noBorRight">实付款</th>
								<th class="threedWidTd noBorLeft noBorRight">交易状态</th>
								<th class="threedWidTd noBorLeft">交易操作</th>
							</tr>
						</table>
						<div class="listTable" id="listProUl">

						</div>
						<div id="Pagination" class="pagination"></div>
						<!-- 分页 -->
						<!-- 通场推荐 -->
						<div class="sameRecommend" style="display:none">
							<strong class="recomTit">同场推荐</strong>
							<div class="sameRecomCon">
								<div class="comTri leftTri"></div>
								<div class="comTri rightTri"></div>
								<ul class="clearfix">
									<li>
										<div class="recomImgDiv">
											<img src="images/recommend.jpg"/>
											<p class="proTit">
												<a href="">金玉满堂金玉满堂</a>
											</p>
										</div>
										<p class="nowPrice1">当前价：<span>¥2500</span></p>
									</li>
									<li>
										<div class="recomImgDiv">
											<img src="images/recommend.jpg"/>
											<p class="proTit">
												<a href="">金玉满堂金玉满堂</a>
											</p>
										</div>
										<p class="nowPrice1">当前价：<span>¥2500</span></p>
									</li>
									<li>
										<div class="recomImgDiv">
											<img src="images/recommend.jpg"/>
											<p class="proTit">
												<a href="">金玉满堂金玉满堂</a>
											</p>
										</div>
										<p class="nowPrice1">当前价：<span>¥2500</span></p>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<%@ include file="../../foot.jsp"%>  
		
		
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery.pagination.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/layer.js"></script>
		<script type="text/javascript">
		var sort_num='${param.sort_num}';
		var pageSize = '${page.pageSize}';
		var totalListNum = '${page.total}';
		var payState='${payState}';
		var setState='${setState}';
		var status='${status}';
		var isComment='${isComment}';
		
		$(function(){
			showPageMBInfo('');
			if(sort_num == ''){
				sort_num=0;
			}
			$("#order_sort li").eq(Number(sort_num)).addClass("active");
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
					url : "${pageContext.request.contextPath }/web/shop/orderApi/myOrderListPage.htm?payState="+payState+"&setState="+setState+"&status="+status+"&isComment="+isComment,
					success : function(html) {
						if(html.trim()==""){
							$("#Pagination").hide();
							$("#listProUl").html("<div class='noDataDiv'><img src='${pageContext.request.contextPath }/web/images/noDataImg.png'/><p>暂无数据</p></div>");
						}else{
							$("#listProUl").html(html);
						}
					}
				});
			}		
		
		function cancelOrder(id){
			layer.open({
				  type: 1,
				  title:"取消订单",
				  skin: 'layui-layer-rim', //加上边框
				  area: ['400px', '210px'], //宽高
				  btn: ['确定'], 
				  content: '<div>'+
				  
						   		'<span><img src="${pageContext.request.contextPath}/hrPage/images/success_join.png"></img> 购买课程成功!</span>'+
						   		'去<a href="${pageContext.request.contextPath}/videoPlayController/playDetails?page=1&audiototalId="'+audiototalId+' stlye="color:#d14747">播放页</a>'+
						   		
					       '</div>',
				  yes:function (index){
					   		location.reload();
					   		layer.close(index);	
					   	
				   } ,
				  end:function () {
				     location.reload();
				   }
				})
			
			
		}

		function queryOrder(sort_num){
			if(sort_num==0){
				payState='';
				setState='';
				status='';
				isComment='';
			}
			if(sort_num==1){
				payState=0;
				setState='';
				status=2;
				isComment='';
			}
			if(sort_num==2){
				payState=1;
				setState=2;
				status=2;
				isComment='';
			}
			if(sort_num==3){
				payState=1;
				setState=1;
				status=2;
				isComment='';
			}
			if(sort_num==4){
				payState=1;
				setState=3;
				status=2;
				isComment=1;
			}
			window.location.href="${pageContext.request.contextPath }/web/shop/orderApi/myOrderList.htm?payState="+payState+"&setState="+setState+"&status="+status+"&isComment="+isComment+"&sort_num="+sort_num+"&sort=2";
		}

		

		var userInfo = '${userInfo}';
		function myAuction(){
			if(userInfo==null || userInfo==''){
				location.href='${pageContext.request.contextPath}/web/shop/userLoginApi/getLoginJsp.htm';
				//alert("请先进行登录");	
			}else{
				location.href='${pageContext.request.contextPath}/web/auctionOrder/list.htm?cmd=7';
			}
		}

		
		function orderExchange(orderId,receive){
			$.ajax({
				type : "post",
				data:{id:orderId,receive:receive},
				url : "${pageContext.request.contextPath }/web/shop/orderApi/orderExchange.htm",
				success : function(data) {
					// data=eval("("+data+")");
					if(data.result=="ok"){
						alert(data.msg);
						//setTimeout('window.location.href = "${pageContext.request.contextPath }/web/shop/orderApi/myOrderListPage.htm"',1500);
						window.location.href="${pageContext.request.contextPath }/web/shop/orderApi/myOrderList.htm";
					}
					if(data.result=="fail"){
						alert(data.msg);
					}
					
				}
			});
		}
		
		
		function cancelOrder(id){
		 	layer.open({
				  type: 1,
				  title:"取消订单",
				  skin: 'layui-layer-rim', //加上边框
				  area: ['400px', '210px'], //宽高
				  btn: ['确定','取消'], 
				  content: '<div>'+
							  '<p>请选择取消订单原因</p>'+
								'<ul>'+
									'<c:forEach items="${items}" var="quit">'+
										'<li onclick="selNowReason(this)">${quit.remark}</li>'+
									'</c:forEach>'+
								'</ul>'+
					       '</div>',
				  yes:function (index){
					  
					  
					   		location.reload();
					   		layer.close(index);	
					   	
				   } ,
				  end:function () {
				     location.reload();
				   }
				}) 
			
			
		}
		
		function bidders(id){
			location.href='${pageContext.request.contextPath }/web/auctionOrder/beat2.htm?id='+id;
		}
		
		//查询物流
		//&expressnum=ems&tracknum=1197081775996'
		function queryWuliu(id,tracknum,expressnum){
			window.location.href="${pageContext.request.contextPath }/web/shop/orderApi/queryLogistics.htm?orderId="+id+"&expressnum=ems&tracknum=1197081775996";
			//window.location.href="${pageContext.request.contextPath }/web/shop/orderApi/queryLogistics.htm?orderId="+id+"&expressnum="+expressnum+"&tracknum="+tracknum;
		}
		//确认收货
		function receivePro(orderNum,id){
			$.ajax({
				type : "post",
				data:{orderNum:orderNum},
				url : "${pageContext.request.contextPath }/web/shop/orderApi/receivePro.htm",
				success : function(data) {
					// data=eval("("+data+")");
					if(data.result=="ok"){
						alert(data.msg);
						//setTimeout('window.location.href = "${pageContext.request.contextPath }/web/shop/orderApi/myOrderListPage.htm"',1500);
						window.location.href="${pageContext.request.contextPath }/web/shop/orderApi/orderDetail.htm?id="+id;
					}
					if(data.result=="fail"){
						alert(data.msg);
					}
					
				}
			});
		}
		
		//去评价
		function toComment(orderId,orderNum,productId){
			window.location.href="${pageContext.request.contextPath }/web/shop/orderApi/toCommentjsp.htm?orderId="+orderId+"&orderNum="+orderNum+"&productId="+productId;
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
