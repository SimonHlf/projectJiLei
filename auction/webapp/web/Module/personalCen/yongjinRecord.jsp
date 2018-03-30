<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="UTF-8">
	<title>佣金记录</title>
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
							<li><a href="${pageContext.request.contextPath}/web/commission/development.htm?cmd=7">佣主发展</a></li>
							<li class="active"><a href="javascript:void(0)">佣金记录</a></li>
							<li><a href="${pageContext.request.contextPath}/web/commission/extension.htm?cmd=7">推广二维码</a></li>
						</ul>
					</div>
					<div class="yongjinWrap">
						<!-- 查询条件filter -->
						<input type="hidden" id="nowQueryTypeInp" value="1" />
	
						<div class="queryDiv">
							<!-- 选择查询的类型 -->
							<div class="queryType">
								<label for="youleBuyInp">
									<span class="radiusSpan selActSpan"><em></em></span>
									<p>现金专区</p>
									<input type="radio" id="youleBuyInp" onclick="getType(this)" name="typeRadio" value="1" />
								</label>
								<label for="jifenAreaInp">
									<span class="radiusSpan"><em></em></span>
									<p>金币专区</p>
									<input type="radio" id="jifenAreaInp" onclick="getType(this)" name="typeRadio" value="2" />
								</label>
								<label for="auctionAreaInp">
									<span class="radiusSpan"><em></em></span>
									<p>积分专区</p>
									<input type="radio" id="auctionAreaInp" onclick="getType(this)" name="typeRadio" value="3" />
								</label>
							</div>
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
									<input type="text" id="createTime" name="createTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" placeholder="收益时间" />
								</div>
							</div>
							<a class="queryBtn" href="javascript:void(0)" onclick="query();">查询</a>
						</div>
						<!-- 最新收益 -->
						<div class="newIncomeListNav">
							<div class="navTit"><strong>佣金记录</strong></div>
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
			function getType(obj){
				$(".radiusSpan").removeClass("selActSpan");
				$(obj).parent().find("span").addClass("selActSpan");
				$("#nowQueryTypeInp").val($(obj).val());
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
				var type = $("input[name='typeRadio']:checked").val();
				var account = $("#account").val();
				var level = $("#level").val();
				var createTime = $("#createTime").val();
				$.ajax({
					type : "post",
					data:{page:page,pageSize:pageSize,account:account,level:level,createTime:createTime,type:type},
					url : "${pageContext.request.contextPath }/web/commission/condition.htm",
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
