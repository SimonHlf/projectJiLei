<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta  charset="UTF-8"  name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
		<title>首届濮阳食品药品“双百”诚信企业评选活动</title>
		<script type="text/javascript">
			var app_param={};
			app_param.path = '${ctx}';
		</script>
		<link rel="stylesheet" type="text/css" href="css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="css/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/index.css"/>
		<link rel="stylesheet" type="text/css" href="css/pullRefresh.css"/>
		<link rel="stylesheet" type="text/css" href="css/tipInfo.css"/>
		<link rel="stylesheet" type="text/css" href="css/footer.css"/>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/resources/ui/lib/layer3.1/layer.js?v=20151225"></script>
		<script type="text/javascript" src="js/vote.common.js"></script>
	</head>
	<body>
		<!-- 背景装饰 -->
		<div class="bodyBg_top"></div>
		<div class="bodyBg_cen"></div>
		<div class="bodyBg_bot"></div>
		<!-- bigTitle -->
		<div class="bigTitle"><h1></h1></div>
		<!-- mainCon -->
		<input type="hidden" id="groupIdInp" value="all">
		<input type="text" id="weid" value="">
		<div class="mainCon">
			<!--tabNav-->
			<div id="nav" class="navTab comListNav">
				<ul id="districtWrap" class="comScroller1">
					<li class="active" dataGroupId="all" ontouchend="showListDiv(this)" nowIndex="0">
						<span>全部</span>
						<div class="navBar">
							<span class="barSpan"></span>
						</div>
					</li>
				</ul>
			</div>
			<!-- subNav  -->
			<div id="subNav" class="subNavPar clearfix">
				<ul id="subNavUl" class="fl">
					<li class="active" ontouchend="showSubDiv(this,'allDistrict','allDisFoods',0)">
						<span>食品企业榜</span>
						<div class="subNavBar">
					        <div class="subBarSpan"></div>
					    </div>
					</li>
					<li ontouchend="showSubDiv(this,'allDistrict','allDisMedical',1)">
						<span>药品企业榜</span>
						<div class="subNavBar">
					        <div class="subBarSpan"></div>
					    </div>
					</li>
				</ul>
				<a href="listIndex.jsp">
					<i class="iconfont icon-fenlei fenleiIcon"></i>
				</a>
			</div>
			<!-- 根据商家名称或商家编号进行搜索 -->
			<div class="queryDiv">
				<input id="queryInp" type="text" placeholder="请输入商家名称或商家编号">
				<button ontouchend="query()">搜索</button>
			</div>
			<!-- tab对应的content -->
			<div class="tabConParent">
				<div class="bigTabCon">		
					<!-- 全部 -->
					<div id="allDistrict" class="tabConDis clearfix" isClick="0">
				    	<div id="allDisFoods" class="tabContent">
				        	<div id="innerAllDisFood" class="comScroller">
				        		<ul id="allFoodDataUl" class="listDataUl waterFullUl clearfix" class="clearfix">
				        			<li></li>
				        			<li></li>
				        		</ul>
				        		<div id="pullUpAll" class="pullUp">
									<span class="pullup-icon"></span>
									<span class="pullUpLabel">上拉加载更多...</span>
								</div>
				       		</div>
				    	</div>
				    	<div id="allDisMedical" class="tabContent">
				        	<div id="innerAllDisMed" class="comScroller">
					          	<ul id="allMedDataUl" class="waterFullUl clearfix">
				        			<li></li>
				        			<li></li>
				        		</ul>
				        		<div id="pullUpAllMed" class="pullUp">
									<span class="pullup-icon"></span>
									<span class="pullUpLabel">上拉加载更多...</span>
								</div>
				        	</div>
				      	</div>
					</div>
				</div>
				<div class="bigTabCon">
					<!-- 市区 -->
					<div id="shiquDis" class="tabConDis clearfix" isClick="0">
				    	<div id="shiquDisFoods" class="tabContent" style="display: block;">
				        	<div id="innerShiquDisFood" class="comScroller">
				        		<ul id="sqFoodDataUl" class="waterFullUl clearfix">
				        			<li></li>
				        			<li></li>
				        		</ul>
				        		<div id="pullUpSq" class="pullUp">
									<span class="pullup-icon"></span>
									<span class="pullUpLabel">上拉加载更多...</span>
								</div>
				       		</div>
				    	</div>
				    	<div id="shiquDisMedical" class="tabContent">
				        	<div id="innerShiquDisMed" class="comScroller">
				          		<ul id="sqMedDataUl" class="waterFullUl clearfix">
				        			<li></li>
				        			<li></li>
				        		</ul>
				        		<div id="pullUpSqMed" class="pullUp">
									<span class="pullup-icon"></span>
									<span class="pullUpLabel">上拉加载更多...</span>
								</div>
				          	</div>
				      	</div>
					</div>
				</div>
				<div class="bigTabCon">
					<!-- 濮阳县 -->
					<div id="puyangxianDis" class="tabConDis clearfix" isClick="0">
				    	<div id="pyxianDisFoods" class="tabContent" style="display: block;">
				        	<div id="innerpyxianDisFood" class="comScroller">
				        		<ul id="pyxFoodDataUl" class="waterFullUl clearfix">
				        			<li></li>
				        			<li></li>
				        		</ul>
				        		<div id="pullUpPyx" class="pullUp">
									<span class="pullup-icon"></span>
									<span class="pullUpLabel">上拉加载更多...</span>
								</div>
				       		</div>
				    	</div>
				    	<div id="pyxianDisMedical" class="tabContent">
				        	<div id="innerpyxianDisMed" class="comScroller">
					        	<ul id="pyxMedDataUl" class="waterFullUl clearfix">
				        			<li></li>
				        			<li></li>
				        		</ul>
				        		<div id="pullUpPyxMed" class="pullUp">
									<span class="pullup-icon"></span>
									<span class="pullUpLabel">上拉加载更多...</span>
								</div>
				        	</div>
				      	</div>
					</div>
				</div>
				<div class="bigTabCon">
					<!-- 清丰 -->
					<div id="qingfengDis" class="tabConDis clearfix" isClick="0">
				    	<div id="qfDisFoods" class="tabContent" style="display: block;">
				        	<div id="innerqfFood" class="comScroller">
				        		<ul id="qfFoodDataUl" class="waterFullUl clearfix">
				        			<li></li>
				        			<li></li>
				        		</ul>
				        		<div id="pullUpQf" class="pullUp">
									<span class="pullup-icon"></span>
									<span class="pullUpLabel">上拉加载更多...</span>
								</div>
				       		</div>
				    	</div>
				    	<div id="qfDisMedical" class="tabContent">
				        	<div id="innerqfMed" class="comScroller">
				        		<ul id="qfMedDataUl" class="waterFullUl clearfix">
				        			<li></li>
				        			<li></li>
				        		</ul>
				        		<div id="pullUpQfMed" class="pullUp">
									<span class="pullup-icon"></span>
									<span class="pullUpLabel">上拉加载更多...</span>
								</div>
				       		</div>
				    	</div>
					</div>
				</div>
				<div class="bigTabCon">
					<!-- 南乐 -->
					<div id="nanleDis" class="tabConDis clearfix" isClick="0">
				    	<div id="nlDisFoods" class="tabContent" style="display: block;">
				        	<div id="innernlFood" class="comScroller">
				        		<ul id="nlFoodDataUl" class="waterFullUl clearfix">
				        			<li></li>
				        			<li></li>
				        		</ul>
				        		<div id="pullUpNl" class="pullUp">
									<span class="pullup-icon"></span>
									<span class="pullUpLabel">上拉加载更多...</span>
								</div>
				       		</div>
				    	</div>
				    	<div id="nlDisMedical" class="tabContent">
				        	<div id="innernlMed" class="comScroller">
				        		<ul id="nlMedDataUl" class="waterFullUl clearfix">
				        			<li></li>
				        			<li></li>
				        		</ul>
				        		<div id="pullUpNlMed" class="pullUp">
									<span class="pullup-icon"></span>
									<span class="pullUpLabel">上拉加载更多...</span>
								</div>
				       		</div>
				    	</div>
					</div>
				</div>
				<div class="bigTabCon">
					<!-- 范县 -->
					<div id="fanxianDis" class="tabConDis clearfix" isClick="0">
				    	<div id="fxDisFoods" class="tabContent" style="display: block;">
				        	<div id="innerfxFood" class="comScroller">
				        		<ul id="fxFoodDataUl" class="waterFullUl clearfix">
				        			<li></li>
				        			<li></li>
				        		</ul>
				        		<div id="pullUpFx" class="pullUp">
									<span class="pullup-icon"></span>
									<span class="pullUpLabel">上拉加载更多...</span>
								</div>
				       		</div>
				    	</div>
				    	<div id="fxDisMedical" class="tabContent" style="display: block;">
				        	<div id="innerfxMed" class="comScroller">
				        		<ul id="fxMedDataUl" class="waterFullUl clearfix">
				        			<li></li>
				        			<li></li>
				        		</ul>
				        		<div id="pullUpFxMed" class="pullUp">
									<span class="pullup-icon"></span>
									<span class="pullUpLabel">上拉加载更多...</span>
								</div>
				       		</div>
				    	</div>
					</div>
				</div>
				<div class="bigTabCon">
					<!-- 台前 -->
					<div id="taiqianDis" class="tabConDis clearfix" isClick="0">
				    	<div id="tqDisFoods" class="tabContent" style="display: block;">
				        	<div id="innertqFood" class="comScroller">
				        		<ul id="tqFoodDataUl" class="waterFullUl clearfix">
				        			<li></li>
				        			<li></li>
				        		</ul>
				        		<div id="pullUpTq" class="pullUp">
									<span class="pullup-icon"></span>
									<span class="pullUpLabel">上拉加载更多...</span>
								</div>
				       		</div>
				    	</div>
				    	<div id="tqDisMedical" class="tabContent" checkDivlen="0">
				        	<div id="innertqMed" class="comScroller">
				        		<ul id="tqMedDataUl" class="waterFullUl clearfix">
				        			<li></li>
				        			<li></li>
				        		</ul>
				        		<div id="pullUpTqMed" class="pullUp">
									<span class="pullup-icon"></span>
									<span class="pullUpLabel">上拉加载更多...</span>
								</div>
				       		</div>
				    	</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer -->
		<div class="footer specStyle">
			<div class="footerCon">
				<ul class="clearfix">
					<li class="active">
						<a href="index.jsp">
							<i class="iconfont icon-home homeIcon"></i>
							<em>首页</em>
						</a>
					</li>
					<li>
						<a href="listIndex.jsp">
							<span></span>
							<i class="iconfont icon-paiming minIcon"></i>
							<em>排名</em>
						</a>
					</li>
					<li>
						<a href="signUp.jsp">
							<i class="iconfont icon-baoming"></i>
							<em>报名</em>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- loading -->
		<div class="loadingDiv">
			<div class="loadEffect">
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
			</div>
			<p>正在加载...</p>
		</div>
		<!-- toast层 -->
		<div class="toast-wrap">
	        <span class="toast-msg"></span>
	    </div> 
	    <script type="text/javascript" src="js/flexible.js" ></script>
	    <script src="js/iScroll.js"></script>
	    <script src="js/index.js?t=20180628" type="text/javascript"></script>
	    <script src="js/tipInfo.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			var globalOpt = "waterFullOpt";
			$(function(){
				var weid = $('#weid').val();
				if(weid==''||weid==null){
					var code = '${param.code}';
					if(code==''||code==null||code=='undefind'){
						getCode();
						return;
					}
					getOid(code);

				}
			});
		</script>
	</body>
</html>
