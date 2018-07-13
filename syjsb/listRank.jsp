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
		<title>企业排名</title>
		<link rel="stylesheet" type="text/css" href="css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="css/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/index.css"/>
		<link rel="stylesheet" type="text/css" href="css/pullRefresh.css"/>
		<link rel="stylesheet" type="text/css" href="css/footer.css"/>
		<link rel="stylesheet" type="text/css" href="css/swiper.min.css"/>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script src="js/swiper.min.js" type="text/javascript"></script>
		
	</head>
	<body>   
	<!-- 背景装饰 -->
		<div class="bodyBg_top"></div>
		<div class="bodyBg_cen"></div>
		<div class="bodyBg_bot"></div>
		<!-- bigTitle -->
		<div class="bigTitle"><h1></h1></div>
		<!-- mainCon -->
		<div class="mainCon">
			<!--tabNav-->
			<div class="swiper-container navTab" id="nav">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
				        <span  style="color:rgba(254,64,64,1);">全部</span>
				        <div class="bar" style="display: block;">
					        <div class="color"></div>
					    </div>
					</div>
				    <div class="swiper-slide">
				        <span clickAttr="0">市区</span>
				        <div class="bar">
					        <div class="color"></div>
					    </div>
				    </div>
				    <div class="swiper-slide">
				        <span clickAttr="0">濮阳县</span>
				        <div class="bar">
					        <div class="color"></div>
					    </div>
				    </div>
				    <div class="swiper-slide">
				        <span clickAttr="0">清丰</span>
				        <div class="bar">
					        <div class="color"></div>
					    </div>
				    </div>
				    <div class="swiper-slide">
				        <span clickAttr="0">范县</span>
				        <div class="bar">
					        <div class="color"></div>
					    </div>
				    </div>
				    <div class="swiper-slide">
				        <span clickAttr="0">南乐</span>
				        <div class="bar">
					        <div class="color"></div>
					    </div>
				    </div>
				     <div class="swiper-slide">
				        <span clickAttr="0">台前</span>
				        <div class="bar">
					        <div class="color"></div>
					    </div>
				    </div>
				</div>
			</div>
			<!-- subNav -->
			<div class="subNavPar clearfix">
				<div class="swiper-container navTab fl" id="subNav">
					<div class="swiper-wrapper posRel">
						<div class="swiper-slide">
					        <span class="subTitleSpan" style="color:rgba(206,166,98,1);">食品企业榜</span>
						</div>
					    <div class="swiper-slide">
					        <span class="subTitleSpan">药品企业榜</span> 
					        
					    </div>
					    <div class="subNavBar">
					        <div class="subColor"></div>
					    </div>
					</div>
				</div>
				<a href="index.html">
					<i class="iconfont icon-liebiao liebiaoIcon"></i>
				</a>
			</div>
			<!-- listTitle -->
			<div class="listTitle">
				<ul class="listUl clearfix">
					<li class="oneWidLi">排名</li>
					<li class="twoWidLi">企业名称</li>
					<li class="oneWidLi">票数</li>
					<li class="oneWidLi">区域</li>
				</ul>
			</div>
			<!-- tab对应的content -->
			<div class="tabConParent">
				<div class="bigTabCon">		
					<!-- 全部 -->
					<div class="swiper-container" id="allDistrict">
						<div class="swiper-wrapper">
						    <div class="swiper-slide slidepage">
						    	<div id="allDisFoods" class="comListDiv">
						        	<div id="innerAllDisFood" class="comScroller">
						        		<ul id="allFoodDataUl" class="listDataUl listConUl clearfix" class="clearfix">
						        			<li>
						        				<p class="oneWidLi">
						        					<span class="rankSpan">1</span>
						        				</p>
						        				<p class="twoWidLi ellip">[1001] 三只松鼠</p>
						        				<p class="oneWidLi">1221</p>
						        				<p class="oneWidLi">市区</p>
						        			</li>
						        			<li>
						        				<p class="oneWidLi">
						        					<span class="rankSpan">2</span>
						        				</p>
						        				<p class="twoWidLi ellip">[1001] 三只松鼠</p>
						        				<p class="oneWidLi">1221</p>
						        				<p class="oneWidLi">清丰</p>
						        			</li>
						        			<li>
						        				<p class="oneWidLi">
						        					<span class="rankSpan">3</span>
						        				</p>
						        				<p class="twoWidLi ellip">[1001] 三只松鼠</p>
						        				<p class="oneWidLi">1221</p>
						        				<p class="oneWidLi">濮阳县</p>
						        			</li>
						        			<li>
						        				<p class="oneWidLi">4</p>
						        				<p class="twoWidLi ellip">[1001] 三只松鼠</p>
						        				<p class="oneWidLi">1221</p>
						        				<p class="oneWidLi">濮阳县</p>
						        			</li>
						        		</ul>
						        		<div id="pullUpAll" class="pullUp">
											<span class="pullup-icon"></span>
											<span class="pullUpLabel">上拉加载更多...</span>
										</div>
						       		</div>
						    	</div>
						    </div>
						    <div class="swiper-slide slidepage">
						    	<div id="allDisMedical" class="comListDiv">
						        	<div id="innerAllDisMed" class="comScroller">
							          	<ul id="allMedDataUl" class="listConUl clearfix">
						        			<li>
						        				<p class="oneWidLi">
						        					<span class="rankSpan">1</span>
						        				</p>
						        				<p class="twoWidLi ellip">[1001] 三只松鼠</p>
						        				<p class="oneWidLi">1221</p>
						        				<p class="oneWidLi">市区</p>
						        			</li>
						        			<li>
						        				<p class="oneWidLi">
						        					<span class="rankSpan">2</span>
						        				</p>
						        				<p class="twoWidLi ellip">[1001] 三只松鼠</p>
						        				<p class="oneWidLi">1221</p>
						        				<p class="oneWidLi">清丰</p>
						        			</li>
						        			<li>
						        				<p class="oneWidLi">
						        					<span class="rankSpan">3</span>
						        				</p>
						        				<p class="twoWidLi ellip">[1001] 三只松鼠</p>
						        				<p class="oneWidLi">1221</p>
						        				<p class="oneWidLi">濮阳县</p>
						        			</li>
						        			<li>
						        				<p class="oneWidLi">4</p>
						        				<p class="twoWidLi ellip">[1001] 三只松鼠</p>
						        				<p class="oneWidLi">1221</p>
						        				<p class="oneWidLi">濮阳县</p>
						        			</li>
						        			<li>
						        				<p class="oneWidLi">5</p>
						        				<p class="twoWidLi ellip">[1001] 三只松鼠</p>
						        				<p class="oneWidLi">1221</p>
						        				<p class="oneWidLi">濮阳县</p>
						        			</li>
						        		</ul>
						        	</div>
						      	</div>
						    </div>
					  	</div>
					</div>
				</div>
				<div class="bigTabCon">
					<!-- 市区 -->
					<div class="swiper-container" id="shiquDis" isClick="0">
						<div class="swiper-wrapper">
						    <div class="swiper-slide slidepage">
						    	<div id="shiquDisFoods" class="comListDiv">
						        	<div id="innerShiquDisFood" class="comScroller">
						        		<ul id="sqFoodDataUl" class="listConUl clearfix">
						        			<li>
						        				<p class="oneWidLi">
						        					<span class="rankSpan">1</span>
						        				</p>
						        				<p class="twoWidLi ellip">[1001] 三只松鼠</p>
						        				<p class="oneWidLi">1221</p>
						        				<p class="oneWidLi">市区</p>
						        			</li>
						        			<li>
						        				<p class="oneWidLi">
						        					<span class="rankSpan">2</span>
						        				</p>
						        				<p class="twoWidLi ellip">[1001] 三只松鼠</p>
						        				<p class="oneWidLi">1221</p>
						        				<p class="oneWidLi">清丰</p>
						        			</li>
						        			<li>
						        				<p class="oneWidLi">
						        					<span class="rankSpan">3</span>
						        				</p>
						        				<p class="twoWidLi ellip">[1001] 三只松鼠</p>
						        				<p class="oneWidLi">1221</p>
						        				<p class="oneWidLi">濮阳县</p>
						        			</li>
						        			<li>
						        				<p class="oneWidLi">4</p>
						        				<p class="twoWidLi ellip">[1001] 三只松鼠</p>
						        				<p class="oneWidLi">1221</p>
						        				<p class="oneWidLi">濮阳县</p>
						        			</li>
						        			<li>
						        				<p class="oneWidLi">5</p>
						        				<p class="twoWidLi ellip">[1001] 三只松鼠</p>
						        				<p class="oneWidLi">1221</p>
						        				<p class="oneWidLi">濮阳县</p>
						        			</li>
						        			<li>
						        				<p class="oneWidLi">6</p>
						        				<p class="twoWidLi ellip">[1001] 三只松鼠</p>
						        				<p class="oneWidLi">1221</p>
						        				<p class="oneWidLi">台前</p>
						        			</li>
						        		</ul>
						        		<div id="pullUpSq" class="pullUp">
											<span class="pullup-icon"></span>
											<span class="pullUpLabel">上拉加载更多...</span>
										</div>
						       		</div>
						    	</div>
						    </div>
						    <div class="swiper-slide slidepage">
						    	<div id="shiquDisMedical" class="comListDiv">
						        	<div id="innerShiquDisMed" class="comScroller">
						          		<ul id="sqMedDataUl" class="listConUl clearfix">
						        			<li>
						        				<p class="oneWidLi">4</p>
						        				<p class="twoWidLi ellip">[1001] 三只松鼠</p>
						        				<p class="oneWidLi">1221</p>
						        				<p class="oneWidLi">濮阳县</p>
						        			</li>
						        		</ul>
						          </div>
						      	</div>
						    </div>
					  	</div>
					</div>
				</div>
				<div class="bigTabCon">
					<!-- 濮阳县 -->
					<div class="swiper-container" id="puyangxianDis" isClick="0">
						<div class="swiper-wrapper">
						    <div class="swiper-slide slidepage">
						    	<div id="pyxianDisFoods" class="comListDiv">
						        	<div id="innerpyxianDisFood" class="comScroller">
						        		<ul id="pyxFoodDataUl" class="listConUl clearfix">
						        			<li></li>
						        		</ul>
						        		<div id="pullUpPyx" class="pullUp">
											<span class="pullup-icon"></span>
											<span class="pullUpLabel">上拉加载更多...</span>
										</div>
						       		</div>
						    	</div>
						    </div>
						    <div class="swiper-slide slidepage">
						    	<div id="pyxianDisMedical" class="comListDiv">
						        	<div id="innerpyxianDisMed" class="comScroller">
							        	<ul id="pyxMedDataUl" class="listConUl clearfix">
						        			<li></li>
						        		</ul>
						        	</div>
						      	</div>
						    </div>
					  	</div>
					</div>
				</div>
				<div class="bigTabCon">
					<!-- 清丰 -->
					<div class="swiper-container" id="qingfengDis" isClick="0">
						<div class="swiper-wrapper">
						    <div class="swiper-slide slidepage">
						    	<div id="qfDisFoods" class="comListDiv">
						        	<div id="innerqfFood" class="comScroller">
						        		<ul id="qfFoodDataUl" class="listConUl clearfix">
						        			<li></li>
						        		</ul>
						        		<div id="pullUpQf" class="pullUp">
											<span class="pullup-icon"></span>
											<span class="pullUpLabel">上拉加载更多...</span>
										</div>
						       		</div>
						    	</div>
						    </div>
						    <div class="swiper-slide slidepage">
						    	<div id="qfDisMedical" class="comListDiv">
						        	<div id="innerqfMed" class="comScroller">
						        		<ul id="qfMedDataUl" class="listConUl clearfix">
						        			<li></li>
						        			<li></li>
						        		</ul>
						       		</div>
						    	</div>
						    </div>
					  	</div>
					</div>
				</div>
				<div class="bigTabCon">
					<!-- 范县 -->
					<div class="swiper-container" id="fanxianDis" isClick="0">
						<div class="swiper-wrapper">
						    <div class="swiper-slide slidepage">
						    	<div id="fxDisFoods" class="comListDiv">
						        	<div id="innerfxFood" class="comScroller">
						        		<ul id="fxFoodDataUl" class="listConUl clearfix">
						        			<li></li>
						        			<li></li>
						        		</ul>
						        		<div id="pullUpFx" class="pullUp">
											<span class="pullup-icon"></span>
											<span class="pullUpLabel">上拉加载更多...</span>
										</div>
						       		</div>
						    	</div>
						    </div>
						    <div class="swiper-slide slidepage">
						    	<div id="fxDisMedical" class="comListDiv">
						        	<div id="innerfxMed" class="comScroller">
						        		<ul id="fxMedDataUl" class="listConUl clearfix">
						        			<li></li>
						        			<li></li>
						        		</ul>
						       		</div>
						    	</div>
						    </div>
					  	</div>
					</div>
				</div>
				<div class="bigTabCon">
					<!-- 南乐 -->
					<div class="swiper-container" id="nanleDis" isClick="0">
						<div class="swiper-wrapper">
						    <div class="swiper-slide slidepage">
						    	<div id="nlDisFoods" class="comListDiv">
						        	<div id="innernlFood" class="comScroller">
						        		<ul id="nlFoodDataUl" class="listConUl clearfix">
						        			<li></li>
						        			<li></li>
						        		</ul>
						        		<div id="pullUpNl" class="pullUp">
											<span class="pullup-icon"></span>
											<span class="pullUpLabel">上拉加载更多...</span>
										</div>
						       		</div>
						    	</div>
						    </div>
						    <div class="swiper-slide slidepage">
						    	<div id="nlDisMedical" class="comListDiv">
						        	<div id="innernlMed" class="comScroller">
						        		<ul id="nlMedDataUl" class="listConUl clearfix">
						        			<li></li>
						        			<li></li>
						        		</ul>
						       		</div>
						    	</div>
						    </div>
					  	</div>
					</div>
				</div>
				<div class="bigTabCon">
					<!-- 台前 -->
					<div class="swiper-container" id="taiqianDis" isClick="0">
						<div class="swiper-wrapper">
						    <div class="swiper-slide slidepage">
						    	<div id="tqDisFoods" class="comListDiv">
						        	<div id="innertqFood" class="comScroller">
						        		<ul id="tqFoodDataUl" class="listConUl clearfix">
						        			<li></li>
						        			<li></li>
						        		</ul>
						        		<div id="pullUpTq" class="pullUp">
											<span class="pullup-icon"></span>
											<span class="pullUpLabel">上拉加载更多...</span>
										</div>
						       		</div>
						    	</div>
						    </div>
						    <div class="swiper-slide slidepage">
						    	<div id="tqDisMedical" class="comListDiv">
						        	<div id="innertqMed" class="comScroller">
						        		<ul id="tqMedDataUl" class="listConUl clearfix">
						        			<li></li>
						        			<li></li>
						        		</ul>
						       		</div>
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
						<a href="index.html">
							<i class="iconfont icon-home homeIcon"></i>
							<em>首页</em>
						</a>
					</li>
					<li>
						<a href="mine.html">
							<span></span>
							<i class="iconfont icon-mine minIcon"></i>
							<em>我的</em>
						</a>
					</li>
					<li>
						<a href="signUp.html">
							<i class="iconfont icon-baoming"></i>
							<em>报名</em>
						</a>
					</li>
				</ul>
			</div>
		</div>
	    <script type="text/javascript" src="js/flexible.js" ></script>
	    <script src="js/iScroll.js"></script>
	    <script src="js/index.js" type="text/javascript"></script>
		<script type="text/javascript">
			var globalOpt = "listConOpt";
		</script>
		
	</body>
</html>