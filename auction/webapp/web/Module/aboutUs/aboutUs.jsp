<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="UTF-8">
	<title>关于我们</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/Module/aboutUs/css/aboutUs.css">
</head>
<body>
		<%@ include file="../../head.jsp"%> 
		<!-- aboutUsContent -->
		<div class="aboutUsCon clearfix w1100">
			<div class="leftAbout fl">
				<div class="leftTopPart">
					<strong>关于我们<span>/About</span></strong>
					<ul>
						<li class="active"><a href="javascript:void(0)">公司简介</a></li>
						<li><a href="javascript:void(0)">公司历程</a></li>
						<li><a href="javascript:void(0)">合作伙伴</a></li>
						<li><a href="javascript:void(0)">联系我们</a></li>
					</ul>
				</div>
				<!-- 常见问题 
				<div class="usualQues">
					<strong>常见问题</strong>
					<ul>
						<c:forEach items="${problem }" var="problem">
							<li>
								<a href="javascript:void(0)" onclick="context(${problem.id})"><span></span>${problem.subject }</a>
							</li>
						</c:forEach>
					</ul>
				</div>-->
			</div>
			<div class="rightAbout fr">
				<!-- 公司简介 -->
				<div class="comRightAbout" style="display: block;">
					<strong class="rightTit"><span></span>公司简介</strong>
					<div class="rightCon">
						<strong class="innerTit">公司简介</strong>
						<p class="smTitP">西藏锦绣商品交易中心是西藏自治区人民政府批准设立，并在国家工商部门注册，主要从事矿产品及其原料、珠宝玉石、文玩书画、艺术品、藏药、大宗农副产品的现货电子交易、商品交易服务和物流等服务。</p>
						<p class="smTitP">西藏锦绣商品交易中心采取市场化运作手段，立足西藏、辐射全国、放眼国际，依托实体产业，整合西藏、中国乃至国际优质产业资源，建立集信息、展示、交易、结算、质检、仓储、物流等综合性服务平台。</p>
						<p class="smTitP">西藏锦绣商品交易中心坚持“公开、公平、公正”的经营原则，秉承“立足实体产业、服务实体产业、提升实体产业”的服务理念，塑造和推广西部特色产业品牌，加速西部资源及产品走向全国，走向国际的步伐，引导社会资本有序进入西部特色产业，促进西藏经济社会发展。</p>
					</div>
				</div>
				<!-- 公司历程 -->
				<div class="comRightAbout">
					<strong class="rightTit"><span></span>公司历程</strong>
					<div class="rightCon">
						<strong class="innerTit">公司大事件</strong>
						<div class="treeDiv">
							<span class="lineSpan"></span>
							<div id="treeParWrapL">
								<div class="treePar clearfix">
									 <c:forEach items="${list }" var="list" varStatus="index">
								    	<c:if test="${index.index%2==0}">
								    		<div class="listDiv">
												<span class="comTriSpan"></span>
												<em class="comRadius"><b></b></em>
												<div>
													<strong>${list.time }</strong>
													<p>${list.conment }</p>
												</div>
											</div>
								    	</c:if>
								    </c:forEach>
							    </div>
							</div>
							<div id="treeParWrapR">
								<div class="treePar clearfix">
						 			<c:forEach items="${list }" var="list" varStatus="index">
									    <c:if test="${index.index%2!=0}">	
									    	<%-- <input type="text" value="${index.index }"> --%>
								    		<div class="listDiv">
												<span class="comTriSpan"></span>
												<em class="comRadius"><b></b></em>
												<div>
													<strong>${list.time }</strong>
													<p>${list.conment }</p>
												</div>
											</div>
										</c:if>
						 			</c:forEach>
						 		</div>
						 	</div>
						</div>
					</div>
				</div>
				<!-- 合作伙伴 -->
				<div class="comRightAbout">
					<strong class="rightTit"><span></span>合作伙伴</strong>
					<div class="rightCon">
						<strong class="innerTit">合作伙伴</strong>
						<div class="cooperation">
							<ul>
								<li class="clearfix">
									<c:forEach items="${cooperList }" var="cooper">
										<span>
											<a href="${cooper.url }"><img width="111px;" height="56px;" src="/${cooper.image }"/></a>
										</span>
									</c:forEach>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 联系我们 -->
				<div class="comRightAbout">
					<strong class="rightTit"><span></span>联系我们</strong>
					<div class="rightCon">
						<strong class="innerTit">联系我们</strong>
						<p class="contractP">地址：${company.address }</p>
						<p class="contractP">邮编：${company.code }</p>
						<p class="contractP">客服电话：${company.phone }</p>
						<%-- <p class="contractP">官方微信：${company }</p> --%>
						<p class="contractP">联系邮箱：${company.email }</p>
					</div>
				</div>
				<div class="comRightAbout" id="about">
					
				</div>
			</div>
		</div>
		<%@ include file="../../foot.jsp"%> 
		<script src="${pageContext.request.contextPath}/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				switchTab();
			});
			//左侧导航之间的切换
			function switchTab(){
				$(".leftTopPart li").each(function(i){
					$(this).click(function(){
						$(".comRightAbout").hide();
						$(this).addClass("active").siblings().removeClass("active");
						$(".comRightAbout").eq(i).show();
						if(i == 1){
							calPosition();
						}
					});
				});
			}
			//定位历史事件的装饰位置
			function calPosition(){
				$(".comTriSpan").each(function(i){
					//console.log($(".treeDiv li").eq(i).innerHeight())
					//$(".comTriSpan").eq(i).css({"top":($(".treeDiv ").eq(i).innerHeight() - $(".comTriSpan").eq(i).height())/2});
					if(i%2 == 0){//右侧层
						$(".comTriSpan").eq(i).addClass("RigTriSpan");
					}else{//左侧层
						$(".comTriSpan").eq(i).addClass("leftTriSpan");
					}
					if(i > 1){
						$(".listDiv").eq(i).css({"margin-top":$(".listDiv").eq(i).innerHeight()/2});
					}
					$(".comRadius").eq(i).css({"top":$(".comTriSpan").eq(i).css("top")});
				});
			}
			
			function context(id){
				$.ajax({
					type : "post",
					data:{id:id},
					url : "${pageContext.request.contextPath}/web/aboutUs/problemById.htm",
					success : function(html) {
						$("#about").html(html);
					}
				});
				
			}
		</script>
	</body>
</html>