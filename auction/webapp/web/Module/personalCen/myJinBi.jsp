<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的金币</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/myJifen.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/pagination.css"/>
	</head>
	<body>
		<div id="content">
		<%@ include file="../../head.jsp"%>  
		
		<!-- 个人中心内容 -->
		<div class="personalCenCon clearfix w1100">
			<%@ include file="personalHead.jsp"%>  
			
			<div class="rightPersonal fr">
				<strong class="rightTit"><span></span>我的金币</strong>
				<div class="rightCon">
					<div class="jifenWrap">
						<div class="myJifen">
							<span>可用金币：</span><strong class="jifenNum">${user.parentgold}</strong>
						<!-- 	<a href="javascript:void(0)">去兑换</a> -->
						</div>
						<div class="listJifenNav">
							<ul class="clearfix">
								<li class="jifenWid1">来源/用途</li>
								<li class="jifenWid2">积分变化</li>
								<li class="jifenWid2">日期</li>
								<li class="jifenWid2">备注</li>
							</ul>
						</div>
						<div class="listJifenCon">
							<ul id="listProUl">
							</ul>
							<div id="Pagination" class="pagination"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<%@ include file="../../foot.jsp"%>  
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery.pagination.js"></script>
		<script type="text/javascript">
	
		var pageSize = '${page.pageSize}';
		$(function(){
			showPageMBInfo();
		})
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
				url : "${pageContext.request.contextPath }/web/shop/myJinBiApi/listPage.htm",
				success : function(html) {
					if(html.trim()==""){
						$(".listJifenNav").hide();
						$("#Pagination").hide();
						$("#listProUl").html("<div class='noDataDiv'><img src='${pageContext.request.contextPath }/web/images/noDataImg.png'/><p>暂无数据</p></div>");
					}else{
						$("#listProUl").html(html);
					}
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
