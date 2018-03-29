<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>我的佣金</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_6u90gnv3u6hzd7vi.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/setPassword.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/footer.css"/>
	<style type="text/css">
		.listPar{width: 100%;padding:0 10px;margin-top:20px;}
		.comListCon{
			width: 100%;
			border:1px solid #1f1f1f;
			border-radius: 4px;
			padding-bottom: 5px;
			margin-top: 20px;
		}
		.listTop{
			background: #f7f7f7;
			height: 40px;
			line-height: 40px;
			text-align: center;
			margin-bottom: 5px;
		}
		.listBot p{
			width: 50%;
			float: left;
			text-align: center;
			color: #333;
			margin:5px 0;
			font-size: 0.6rem;
		}
		.thirdBlank{
			width: 5px;
			display: inline-block;
		}
		.checkNextBtn{
			width: 100%;
			height: 25px;
			line-height: 25px;
			text-align: right;
			display: inline-block;
			padding-right: 10px;
			color: #cf3e45;
			font-size: 0.6rem;
			text-decoration: underline;
		}
	</style>
</head>
<body style="padding-bottom: 50px;">
	<header class="aui-bar aui-bar-nav headerNav" style="position: fixed;left: 0;top:0;">
        <a class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)" href="javascript:void(0)">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <%-- <input type="hidden" id="userId" value="${frontUser.userId }"> --%>
        <div class="aui-title"><span id="myyj">我的佣金</span></div>
    </header>
    <div class="comInpBox" style="margin-top: 2.6rem;">
    	<ul>
	    		<li>
	                <div class="txtDiv">
	                   	起始时间：
	                </div>
	                <div class="inpDiv">
	                    <input id="startTimeInp" name="startDate" value="${startDate }" type="text" placeholder="请选择起始时间">
	                    
	                </div>
	            </li>
	            <li>
	                <div class="txtDiv">
	                   截止时间：
	                </div>
	                <div class="inpDiv">
	                    <input id="endTimeInp" name="endDate" value="${endDate }" type="text" placeholder="请选择截止时间">
	                </div>
	            </li>
	    	</ul>
    	<a href="javascript:void(0)" tapmode onclick="searchMyPeople()" class="aui-btn aui-btn-block comAuiBtn">查询</a>
    </div>
	<!-- listCon -->
	<div class="listPar">
		
		<div id="nextConDiv">
		<p></p>
			<c:forEach items="${lists}" var="person">
				<div class="comListCon">
					<input type="hidden" id="superId" value="${person.frontUser.userId }">
					<div class="listTop">
						<h4>账号：${person.frontUser.cellPhone }</h4>
					</div>
					<div class="listBot clearfix">
						<p>充值总额：${person.cz_moneyo}</p>
						<p>提现总额：${person.cz_moneyt}</p>
						<p>投注金额：${person.cz_moneyts}</p>
						<p>中奖金额：${person.cz_moneyf}</p>
						<p>佣金金额：${person.cz_moneyfs}</p>
					</div>
					
				</div>
				</c:forEach>
				
		</div>
		<div class="comListCon" id="testPers" style="display:none;">
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.core-2.5.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.core-2.5.2-zh.js"></script>
	<link href="${pageContext.request.contextPath }/weChat/reception/css/mobiscroll.core-2.5.2.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/weChat/reception/css/mobiscroll.animation-2.5.2.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.datetime-2.5.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.datetime-2.5.1-zh.js"></script>
	<!-- S 可根据自己喜好引入样式风格文件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.android-ics-2.5.2.js"></script>
	<link href="${pageContext.request.contextPath }/weChat/reception/css/mobiscroll.android-ics-2.5.2.css" rel="stylesheet" type="text/css" />
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/personalCenter.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/layer/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/aui-dialog.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/personalCen.js"></script>
	<script type="text/javascript">
	$(function(){
		$("body").height($(window).height());
		initDate("startTimeInp");
		initDate("endTimeInp");
	});
	//查看上下级
	function superior(){
		window.location.href="superior.htm?id="+$("#superId").val();
	}
	
	
	function searchMyPeople(){
		var startTime = $.trim($("#startTimeInp").val());
		var endTime = $.trim($("#endTimeInp").val());
		$.ajax({
	        type:'post',
	        url:'comm1.htm',
	        data:{
	        	startTime:startTime,
	        	endTime:endTime
	        },
	        success:function(data){
	        	$("#nextConDiv").css('display','none');	
				$("#testPers").css('display','block');
				$("#testPers").html("");
				$("#myyj").html("佣金明细");
	        	var result = jQuery.parseJSON(data).lists;
	        	var str = "";
	        	$.each(result, function (n, value) {
	        		str += "<div class='listTop'><h4 id='fir0'>账号："+value.frontUser.cellPhone+"</h4></div>"+
	        			   "<div class='listBot clearfix'><p id='fir1'>充值总额："+value.cz_moneyo.toFixed(1)+"</p><p id='fir2'>提现总额："+value.cz_moneyt.toFixed(1)+"</p>"+
	        			   "<p id='fir3'>投注金额："+value.cz_moneyts.toFixed(1)+"</p><p id='fir4'>中奖金额："+value.cz_moneyf.toFixed(1)+"</p><p id='fir5'>佣金金额："+value.cz_moneyfs.toFixed(1)+"</p></div>";
	        		
	        	});
	        	$("#testPers").append(str);
	        },
	        error:function(){
	        	dialog("网络错误,请稍后再试");
	        }
	    })
		
	}
	 
	</script>
</body>
</html>