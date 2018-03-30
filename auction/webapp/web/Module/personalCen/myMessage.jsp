<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的消息</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/myMessage.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/pagination.css"/>
	</head>
<body>
		<!-- 顶部副导航 -->
		<%@ include file="../../head.jsp"%>
		<!-- 个人中心内容 -->
		<div class="personalCenCon clearfix w1100">
			<%@ include file="personalHead.jsp" %>
			<div class="rightPersonal fr">
				<strong class="rightTit"><span></span>我的消息</strong>
				<div class="rightCon">
					<div class="yongjinListNav">
						<ul class="clearfix">
							<li class="active"><a href="javascript:void(0)">未读消息(${wdsize })</a></li>
							<!-- <li><a href="javascript:void(0)">已读消息</a></li> -->
						</ul>
					</div>
					<div class="messageWrap">
						<div class="messageNav">
							<ul class="clearfix">
								<li class="hisWid1">内容</li>
								<li class="hisWid2">时间</li>
								<li class="hisWid3">操作</li>
							</ul>		
						</div>
						<!-- 未读消息 -->
						<div class="comMessageWrap" style="display: block;">
							<ul id="ulListCon1" class="hisListCon">
								
							</ul>
							<div id="Pagination" class="pagination"></div>
							</div>
					</div>
				</div>
			</div>
		</div>
		<div><input id="sock1" type="hidden" name="sock1" value="${userInfo.useraccount }"></div> 
		<script src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery.pagination.js"></script>
		<script src="${pageContext.request.contextPath }/web/Module/personalCen/js/showDetailCon.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				showPageMBInfo('');
				bigTabSwitch('comMessageWrap');
			});
			
			function bigTabSwitch(showObj){
				$(".yongjinListNav li").each(function(i){
					$(this).click(function(){
						$(this).addClass("active").siblings().removeClass("active");
						$("." + showObj).hide().eq(i).show();
					});
				});
			}
			
			var pageSize = '${page.pageSize}';
			var totalListNum = '${page.total}';
			
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
			var username = '${userInfo.useraccount}';
			function getMBList(page,pageSize){
				$.ajax({
					type : "post",
					data:{page:page,pageSize:pageSize,username:username},
					url : "${pageContext.request.contextPath }/web/tuimsgController/getPersonTuimsgPage.htm",
					success : function(html) {
						$("#ulListCon1").html(html);
					}
				});
			}	
			
			function message(id,username,status){
				location.href="${pageContext.request.contextPath }/web/tuimsgController/detail.htm?id="+id+"&username="+username+"&status="+status;
			}
		</script>
	</body>
</html>
