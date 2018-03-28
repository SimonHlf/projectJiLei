<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<link rel="stylesheet" href="http://at.alicdn.com/t/font_547918_04fz1ctnrmdvx6r.css"/>
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
	
	
		
			<ul class="headNavCon clearfix">
				<li class="oneLiWid">aaa考试名称</li>
				<li class="oneLiWid">考试时间</li>
				<li class="fiveLiWid">考试时长</li>
				<li class="fiveLiWid">详情</li>
			</ul>
			<ul class="mainListCon clearfix">
				<c:forEach items="${recordList}" var="record">
					<li>
					<p class="oneLiWid ellip">${record.paperCreatName}</p>
					<p class="oneLiWid">${record.change_time}</p>
					<p class="fiveLiWid">${record.exam_time}</p>
					<p class="fiveLiWid">
						<a href="javascript:lookDetail(${record.id})">查看</a>
					</p>
				</li>
				</c:forEach>
			</ul>
			<v:webpage url="PaperCreatFontCountroller/getRecord.htm?1=1" page="${page}"/>
		
	
	
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