<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="UTF-8">
	<title>佣主发展</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/Module/personalCen/css/yongjinManager.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/pagination.css"/>
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
							<li><a href="${pageContext.request.contextPath}/web/commission/commiss.htm?cmd=7">佣金收益</a></li>
							<li class="active"><a href="javascript:void(0)">佣主发展</a></li>
							<li><a href="${pageContext.request.contextPath}/web/commission/record.htm?cmd=7">佣金记录</a></li>
							<li><a href="${pageContext.request.contextPath}/web/commission/extension.htm?cmd=7">推广二维码</a></li>
						</ul>
					</div>
					<div class="yongjinWrap">
						<div class="incomeDiv">
							<ul class="clearfix">
								<li class="borBotLi">
									<span class="yongzhuIcon1"></span>
									<p class="totalP">
										代理受益人数<span>${zCount }</span>人
									</p>
								</li>
								<li class="borBotLi">
									<p>
										一级代理人数<span>${oneCount }</span>人
									</p>
									<span class="yongzhuIcon2"></span>
								</li>
								<li>
									<span class="yongzhuIcon3"></span>
									<p class="totalP">
										二级代理人数<span>${twoCount }</span>人
									</p>
								</li>
								<li>
									<p>
										三级代理人数<span>${thereCount }</span>人
									</p>
									<span class="yongzhuIcon4"></span>
								</li>
							</ul>
							<span class="cenLineSpan"></span>
						</div>
						<!-- echarts -->
						<div class="echartsDiv">
							<!-- 佣金收益折线图 -->
							<div style="width: 800px;height: 300px" id="main" ></div>
						</div>
						<!-- 查询条件filter -->
						<div class="queryDiv">
							<div class="clearfix">
								<div class="comInnerQuery">
									<span>会员账号：</span>
									<input type="text" name="account" id="account" placeholder="请输入查询账号" />
								</div>
								<!-- <div class="comInnerQuery">
									<span>会员昵称：</span>
									<input type="text" placeholder="请输入查询昵称" />
								</div> -->
								<div class="comInnerQuery">
									<span>代理级别：</span>
									<select name="level" id="level">
										<option value="0">请选择代理级别</option>
										<option value="1">一级代理</option>
										<option value="2">二级代理</option>
										<option value="3">三级代理</option>
									</select>
								</div>
								<div class="comInnerQuery">
									<span>收益时间：</span>
									<input type="text" placeholder="收益时间" id="createTime" name="createTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
								</div>
							</div>
							<a class="queryBtn" href="javascript:void(0)" onclick="query();">查询</a>
						</div>
						<!-- 最新收益 -->
						<div class="newIncomeListNav">
							<div class="navTit"><strong>收益记录</strong></div>
							<ul class="clearfix">
								<li class="queryWid1">账号</li>
								<li class="queryWid1">会员昵称</li>
								<li class="queryWid1">直属上级</li>
								<li class="queryWid2">代理级别</li>
								<li class="queryWid1">类别</li>
								<li class="queryWid3">申请进入时间</li>
							</ul>
						</div>
						<div class="newIncomeListCon">
							<ul id="listProUl">	
							</ul>
							<div id="Pagination" class="pagination"></div>
							<!-- 分页 -->
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
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery.pagination.js"></script>
		<script src="${pageContext.request.contextPath }/web/js/My97DatePicker/WdatePicker.js"></script> 	
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
				var account = $("#account").val();
				var level = $("#level").val();
				var createTime = $("#createTime").val();
				$.ajax({
					type : "post",
					data:{page:page,pageSize:pageSize,account:account,level:level,createTime:createTime},
					url : "${pageContext.request.contextPath }/web/commission/condition.htm",
					success : function(html) {
						$("#listProUl").html(html);
					}
				});
			}	
			
			function query(page,pageSize){
				var account = $("#account").val();
				var level = $("#level").val();
				var createTime = $("#createTime").val();
				$.ajax({
					type : "post",
					data:{page:page,pageSize:pageSize,account:account,level:level,createTime:createTime},
					url : "${pageContext.request.contextPath }/web/commission/condition.htm",
					success : function(html) {
						$("#listProUl").html(html);
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