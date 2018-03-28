<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<link rel="stylesheet" href="http://at.alicdn.com/t/font_547918_04fz1ctnrmdvx6r.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/layui/css/layui.css" />
<link rel="stylesheet" href="http://localhost:8080/windy-dev/admin/assets/layui/css/modules/layer/default/layer.css?v=3.1.0" />
<link rel="stylesheet" href="http://localhost:8080/windy-dev/admin/assets/layui/css/modules/laydate/default/laydate.css?v=5.0.7" />
	<style type="text/css">
		#pagination{
			position:relative;
			height:35px;
			margin-top:15px;
		}
		.layui-box{margin:0px !important}
		.layui-box{
			position:absolute;
			top:0px;
		}
		.layui-laypage a:hover{
			color:#307ed5 !important;
		}
		.layui-laypage-curr em{
			background:#307ed5 !important;
		}
		.hasBor{border-bottom:1px solid #ccc;}
		.noDataDiv{
			width:100px;
			margin:80px auto;
			text-align:center;
		}
		.noDataDiv i{
			font-size:68px;
			color:#dbdbdb;
		}
		.noDataDiv p{
			color:#666;
		}
	</style>
	<!-- 考试记录对应tab -->
	<div class="recordTab">
		<ul class="clearfix">
			<li class="active" onclick="checkMyExamInfo(this,'myExam')"><a href="javascript:void(0)">我的考试</a></li>
			<!-- <li onclick="checkMyExamInfo(this,'myBukaoInfo')"><a href="javascript:void(0)">我的补考</a></li> -->
		</ul>
	</div>
	<div class="comNavConPart">
		<!-- 查询层 -->
		<div class="searDiv">
			<input type="text" id="paperCreatName" name="paperCreatName" placeholder="请输入试卷名称">
			<button onclick="chaxuns()">查询</button>
		</div>
		<div class="listNavCon">
			<ul class="headNavCon clearfix">
				<li class=sixWid>考试名称</li>
				<li class="sixWid">试卷名称</li>
				<li class="sixWid">考试时间</li>
				<li class="sixWid">考试时长</li>
				<li class="fourLiWid">详情</li>
			</ul>
			<ul class="mainListCon clearfix">
				<c:forEach items="${recordList}" var="record">
					<li>
						<p class="sixWid ellip">${record.exam_name }</p>
						<p class="sixWid ellip">${record.paperCreatName}</p>
						<p class="sixWid">${record.recordTime}</p>
						<p class="sixWid">${record.exam_time}分钟</p>
						<p class="fourLiWid">
							<a href="javascript:lookDetail(${record.id},${record.examinationId})">查看</a>
						</p>
					</li>
				</c:forEach>
			</ul>
			<v:webpage url="PaperCreatFontCountroller/getRecord.htm?1=1" page="${page}"/>  
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			checkHeight();
		});
		function checkMyExamInfo(obj,options){
			$(".recordTab li").removeClass("active");
			$(obj).addClass("active");
			if(options == "myExam"){
				$.ajax({
					type:"post",
					url:"PaperCreatFontCountroller/getRecord.htm",
					success:function(data){
						$("#personalContent").html(data);
						if($(".mainListCon li").length == 0){
							$(".layui-box").hide();
							$(".mainListCon").addClass("hasBor").append("<div class='noDataDiv'><i class='iconfont icon-jilu'></i><p>暂无补考记录</p></div>")
						}else{
							$(".layui-box").show();
							$(".layui-box").css({"left":parseInt(($("#pagination").width() - $(".layui-box").width())/2) });
						}
					},
					error:function(){
						alert("网络错误，请稍后再试");
					}
				})
			}else if(options == "myBukaoInfo"){
				$.ajax({
					type:"post",
					url:"PaperCreatFontCountroller/getFixRecord.htm",
					success:function(htm){
						$(".comNavConPart").html(htm);
						$(".mainListCon li:odd").addClass('oddColor');
						if($(".mainListCon li").length == 0){
							$(".mainListCon").addClass("hasBor").append("<div class='noDataDiv'>" +
								"<i class='iconfont icon-jilu'>" +
								"</i><p>暂无补考记录</p></div>")
						}
					}
					
				})
			}
		}
		
	</script>
