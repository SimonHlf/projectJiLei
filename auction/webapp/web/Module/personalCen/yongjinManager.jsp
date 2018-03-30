<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="UTF-8">
	<title>佣主管理</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/Module/personalCen/css/yongjinManager.css">
</head>
<body>
	<div id="content">
		<!-- 顶部副导航 -->
		<%@ include file="../../head.jsp"%>  
			<!-- 个人中心内容 -->
			<div class="personalCenCon clearfix w1100">
			<%@ include file="personalHead.jsp" %>
			<div class="rightPersonal fr">
				<strong class="rightTit"><span></span>佣金管理</strong>
				<div class="rightCon">
					<div class="yongjinListNav">
						<ul class="clearfix">
							<li class="active"><a href="javascript:void(0)">佣金收益</a></li>
							<li><a href="${pageContext.request.contextPath}/web/commission/development.htm?cmd=7">佣主发展</a></li>
							<li><a href="${pageContext.request.contextPath}/web/commission/record.htm?cmd=7">佣金记录</a></li>
							<li><a href="${pageContext.request.contextPath}/web/commission/extension.htm?cmd=7">推广二维码</a></li>
						</ul>
					</div>
					<div class="yongjinWrap">
						<div class="incomeDiv">
							<ul class="clearfix">
								<li class="borBotLi">
									<span class="totalIcon"></span>
									<p class="totalP">
										总收益<span>${xjysy }</span>现金
									</p>
								</li>
								<%-- <li class="borBotLi">
									<p class="totalP">
										待收益<span>${xjdsy }</span>现金
									</p>
									<span class="daiIcon"></span>
								</li> --%>
								<li class="borBotLi">
									<span class="totalIcon"></span>
									<p class="totalP">
										总收益<span>${jbysy }</span>金币
									</p>
								</li>
								<%-- <li class="borBotLi">
									<p class="totalP">
										待收益<span>${jbdsy }</span>金币
									</p>
									<span class="daiIcon"></span>
								</li> --%>
								<li class="borBotLi">
									<span class="totalIcon"></span>
									<p class="totalP">
										总收益<span>${jfysy }</span>积分
									</p>
								</li>
								<%-- <li class="borBotLi">
									<p class="totalP">
										待收益<span>${jfdsy }</span>积分
									</p>
									<span class="daiIcon"></span>
								</li> --%>
							</ul>
							<span class="cenLineSpan"></span>
						</div>
						<!-- echarts -->
						<div class="echartsDiv" style="width: 800px;height: 300px">
							<!-- 佣金收益折线图 -->
							<div style="width: 800px;height: 300px" id="main" ></div>
						</div>
						<!-- 最新收益 
						<div class="newIncomeListNav">
							<div class="navTit"><strong>最新收益</strong></div>
							<ul class="clearfix">
								<li class="incomeWid1">账号</li>
								<li class="incomeWid2">收益名称</li>
								<li class="incomeWid1">上级</li>
								<li class="incomeWid3">佣金</li>
								<li class="incomeWid2">收益时间</li>
							</ul>
						</div>
						<div class="newIncomeListCon">
							<ul>
								<li>
									<div class="floatDiv clearfix">
										<p class="incomeWid1 ellip">疯狂心跳最后一秒</p>
										<p class="incomeWid2 ellip">推广收益</p>
										<p class="incomeWid1 ellip">helloMr树先生</p>
										<p class="incomeWid3"><strong>+300</strong></p>
										<p class="incomeWid2">
											<a href="javascript:void(0)">
												<span>2018-03-15 12:20:23</span>
												<span class="arrow"></span>
											</a>
										</p>
									</div>
									<div class="innerDetailCon">
										<p>我的昵称：疯狂心跳最后一秒</p>
										<p>我的上级：疯狂心跳最后一秒上级</p>
										<p>本次收益：<strong>100</strong></p>
										<p>详情内容：我是本次收益详情内容的描述我是本次收益详情内容的描述</p>
										<p>收益时间：2018-03-15 12:20:23</p>
									</div>
								</li>
								<li>
									<div class="floatDiv clearfix">
										<p class="incomeWid1 ellip">疯狂心跳最后一秒</p>
										<p class="incomeWid2 ellip">推广收益</p>
										<p class="incomeWid1 ellip">helloMr树先生</p>
										<p class="incomeWid3"><strong>+300</strong></p>
										<p class="incomeWid2">
											<a href="javascript:void(0)">
												<span>2018-03-15 12:20:23</span>
												<span class="arrow"></span>
											</a>
										</p>
									</div>
								</li>
								<li>
									<div class="floatDiv clearfix">
										<p class="incomeWid1 ellip">疯狂心跳最后一秒</p>
										<p class="incomeWid2 ellip">推广收益</p>
										<p class="incomeWid1 ellip">helloMr树先生</p>
										<p class="incomeWid3"><strong>+300</strong></p>
										<p class="incomeWid2">
											<a href="javascript:void(0)">
												<span>2018-03-15 12:20:23</span>
												<span class="arrow"></span>
											</a>
										</p>
									</div>
								</li>
							</ul>
						</div>-->
						<!-- 一级代理收益 -->
						<div class="incomeLevel">
							<div class="newIncomeListNav">
								<div class="navTit"><strong>一级收益人：${oneCount }人</strong></div>
								<ul class="clearfix">
									<li class="incomeWid4">账号</li>
									<li class="incomeWid4">收益名称</li>
									<li class="incomeWid4">佣金</li>
									<li class="incomeWid4">收益时间</li>
								</ul>
							</div>
							<div class="newIncomeListCon">
								<ul>
									<c:forEach items="${yjsy }" var="yjsy">
										<li>
											<div class="floatDiv clearfix">
												<p class="incomeWid4 ellip">${yjsy.account }</p>
												<p class="incomeWid4 ellip">
													<c:if test="${yjsy.ctype==1 }">
														用户返利
													</c:if>
													<c:if test="${yjsy.ctype==2 }">
														平台发放
													</c:if>
												</p>
												<p class="incomeWid4 ellip"><strong>+${yjsy.money }
													<c:if test="${yjsy.type==1 }">现金</c:if>
													<c:if test="${yjsy.type==2 }">金币</c:if>
													<c:if test="${yjsy.type==3 }">积分</c:if>
												</strong></p>
												<p class="incomeWid4">${yjsy.createTime }</p>
											</div>
										</li>
									</c:forEach>
								</ul>
								<!-- 分页 -->
							</div>
						</div>
						
						<!-- 二级代理收益 -->
						<div class="incomeLevel">
							<div class="newIncomeListNav">
								<div class="navTit"><strong>二级收益人：${twoCount }人</strong></div>
								<ul class="clearfix">
									<li class="incomeWid4">账号</li>
									<li class="incomeWid4">收益名称</li>
									<li class="incomeWid4">佣金</li>
									<li class="incomeWid4">收益时间</li>
								</ul>
							</div>
							<div class="newIncomeListCon">
								<ul>
									<c:forEach items="${ejsy }" var="ejsy">
										<li>
											<div class="floatDiv clearfix">
												<p class="incomeWid4 ellip">${ejsy.account }</p>
												<p class="incomeWid4 ellip">
													<c:if test="${ejsy.ctype==1 }">
														用户返利
													</c:if>
													<c:if test="${ejsy.ctype==2 }">
														平台发放
													</c:if>
												</p>
												<p class="incomeWid4 ellip"><strong>+${ejsy.money }
													<c:if test="${ejsy.type==1 }">现金</c:if>
													<c:if test="${ejsy.type==2 }">金币</c:if>
													<c:if test="${ejsy.type==3 }">积分</c:if>
												</strong></p>
												<p class="incomeWid4">${ejsy.createTime }</p>
											</div>
										</li>
									</c:forEach>
								</ul>
								<!-- 分页 -->
							</div>
						</div>
						
						<!-- 一级代理收益 -->
						<div class="incomeLevel">
							<div class="newIncomeListNav">
								<div class="navTit"><strong>三级收益人：${thereCount }人</strong></div>
								<ul class="clearfix">
									<li class="incomeWid4">账号</li>
									<li class="incomeWid4">收益名称</li>
									<li class="incomeWid4">佣金</li>
									<li class="incomeWid4">收益时间</li>
								</ul>
							</div>
							<div class="newIncomeListCon">
								<ul>
									<c:forEach items="${sjsy }" var="sjsy">
										<li>
											<div class="floatDiv clearfix">
												<p class="incomeWid4 ellip">${sjsy.account }</p>
												<p class="incomeWid4 ellip">
													<c:if test="${sjsy.ctype==1 }">
														用户返利
													</c:if>
													<c:if test="${sjsy.ctype==2 }">
														平台发放
													</c:if>
												</p>
												<p class="incomeWid4 ellip"><strong>+${sjsy.money }
													<c:if test="${sjsy.type==1 }">现金</c:if>
													<c:if test="${sjsy.type==2 }">金币</c:if>
													<c:if test="${sjsy.type==3 }">积分</c:if>
												</strong></p>
												<p class="incomeWid4">${sjsy.createTime }</p>
											</div>
										</li>
									</c:forEach>
								</ul>
								<!-- 分页 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<%@ include file="../../foot.jsp"%>  
		<script src="${pageContext.request.contextPath}/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/admin/assets/echarts/echarts.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/admin/assets/js/charts/chartjs/Chart.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/admin/assets/js/charts/chartjs/chartjs-init.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">

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
		
			var myChart = echarts.init(document.getElementById('main'));
			option = {
				    title: {
				        text: '佣金收益折线图'
				    },
				    tooltip: {
				        trigger: 'axis'
				    },
				    legend: {
				        data:['一级收益','二级收益','三级收益']
				    },
				    grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				    toolbox: {
				        feature: {
				            saveAsImage: {}
				        }
				    },
				    xAxis: {
				        type: 'category',
				        boundaryGap: false,
				        data: ${time}
				    },
				    yAxis: {
				        type: 'value'
				    },
				    series: [
				        {
				            name:'一级收益',
				            type:'line',
				            stack: '总量',
				            data:${history}
				        },
				        {
				            name:'二级收益',
				            type:'line',
				            stack: '总量',
				            data:${history1}
				        },
				        {
				            name:'三级收益',
				            type:'line',
				            stack: '总量',
				            data:${history2}
				        }
				       
				    ]
				};
				myChart.setOption(option);
		</script>
	</body>
</html>
