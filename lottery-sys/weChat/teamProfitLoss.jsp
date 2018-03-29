<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
	<title>团队盈亏报表</title>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_6u90gnv3u6hzd7vi.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/comSearchList.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/personalCen/css/setPassword.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/footer/footer.css"/>
	<!--  link href="${pageContext.request.contextPath }/admin/assets/layui/css/layui.css" rel="stylesheet" type="text/css" /-->
	<style type="text/css">
	</style>
</head>
<body>
	<header class="aui-bar aui-bar-nav headerNav">
        <a class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)" href="javascript:void(0)">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <div class="aui-title">团队盈亏报表</div>
    </header>
    <!-- mainCon -->
    <div class="comInpBox">
    	<ul>
    		<li>
                <div class="txtDiv">
                   	起始时间：
                </div>
                <div class="inpDiv">
                    <input id="startTimeInp" type="text" placeholder="请选择起始时间">
                </div>
            </li>
            <li>
                <div class="txtDiv">
                   截止时间：
                </div>
                <div class="inpDiv">
                    <input id="endTimeInp" type="text" placeholder="请选择截止时间：">
                </div>
            </li>
    	</ul>
    	<a href="javascript:void(0)" tapmode onclick="searchAccount()" class="aui-btn aui-btn-block comAuiBtn">查询</a>
    </div>
    <div class="searchRes">
    	<ul class="listNav temProNav clearfix">
    		<li>用户</li>
    		<li>充值总额</li>
    		<li>提现总额</li>
    		<li>投注总额</li>
    		<li>中奖总额</li>
    		<li>佣金总额</li>
    	</ul>
    	<div class="searListDiv temProList">
    		<ul id="zbjl"></ul>
    	</div>
    	<div class="botClose" tapmode onclick="closeList()">
			<i class="iconfont icon-guanbi"></i>
    	</div>
    </div>
	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="../weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/mobiscroll.core-2.5.2.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/mobiscroll.core-2.5.2-zh.js"></script>
	<link href="../weChat/reception/css/mobiscroll.core-2.5.2.css" rel="stylesheet" type="text/css" />
	<link href="../weChat/reception/css/mobiscroll.animation-2.5.2.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../weChat/reception/jsPlugin/mobiscroll.datetime-2.5.1.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/mobiscroll.datetime-2.5.1-zh.js"></script>
	<!-- S 可根据自己喜好引入样式风格文件 -->
	<script type="text/javascript" src="../weChat/reception/jsPlugin/mobiscroll.android-ics-2.5.2.js"></script>
	<link href="../weChat/reception/css/mobiscroll.android-ics-2.5.2.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../weChat/reception/jsPlugin/aui-dialog.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/personalCen.js"></script>

	<script type="text/javascript">
		$(function(){
			initDate("startTimeInp");
			initDate("endTimeInp");
		});
		
		function searchAccount(){
			var stVal = $("#startTimeInp").val();
			var endVal = $("#endTimeInp").val();
			/* var accountInp = $("#accountInp").val(); */
			if(stVal == ""){
				dialog('起始时间不能为空');
				return;
			}else if(endVal == ""){
				dialog('截至时间不能为空');
				return;
			}else{
				if(endVal < stVal){
					dialog('结束时间不能小于开始时间');
					return;
				}
				
				$("#zbjl").html("");
				 $.ajax({
					method:'post',
		            url:'${pageContext.request.contextPath }/personal/teamCount.htm',
		            data:{
		            	'startTime':stVal,
		            	'endTime':endVal
		            	/* 'accountInp':accountInp */
		            },
		            success:function (data) {
		            	/* var data = jQuery.parseJSON(data); */
		            	var data = eval("(" + data + ")");
		            	var str="";
		            		 str += 
		            			 "<li>"+
				            		"<p class='aui-ellipsis-1'>"+"本人"+"</p>"+
				            		"<p><span></span><span>"+data.team1.result1+"</span>元</p>"+
				            		"<p><span></span><span>"+data.team1.result2+"</span>元  </p>"+
				            		"<p><span></span><span>"+data.team1.result3+"</span>元</p>"+
				            		"<p><span></span><span>"+data.team1.result4+"</span>元</p>"+
				            		"<p><span></span><span>"+data.team1.result5+"</span>元</p>"+
				   "</li>"+
				   "<li>"+
				  				    "<p class='aui-ellipsis-1'>"+"一级下级"+"</p>"+
				            		"<p><span></span><span>"+data.team2.result1+"</span>元</p>"+
				            		"<p><span></span><span>"+data.team2.result2+"</span>元  </p>"+
				            		"<p><span></span><span>"+data.team2.result3+"</span>元</p>"+
				            		"<p><span></span><span>"+data.team2.result4+"</span>元</p>"+
				            		"<p><span></span><span>"+data.team2.result5+"</span>元</p>"+
				    "</li>"+
				    "<li>"+
				     				"<p class='aui-ellipsis-1'>"+"二级下级"+"</p>"+
				            		"<p><span></span><span>"+data.team3.result1+"</span>元</p>"+
				            		"<p><span></span><span>"+data.team3.result2+"</span>元  </p>"+
				            		"<p><span></span><span>"+data.team3.result3+"</span>元</p>"+
				            		"<p><span></span><span>"+data.team3.result4+"</span>元</p>"+
				            		"<p><span></span><span>"+data.team3.result4+"</span>元</p>"+
				  
				    "</li>"+
				    "<li>"+
								    "<p class='aui-ellipsis-1'>"+"三级下级"+"</p>"+
				            		"<p><span></span><span>"+data.team4.result1+"</span>元</p>"+
				            		"<p><span></span><span>"+data.team4.result2+"</span>元  </p>"+
				            		"<p><span></span><span>"+data.team4.result3+"</span>元</p>"+
				            		"<p><span></span><span>"+data.team4.result4+"</span>元</p>"+
				            		"<p><span></span><span>"+data.team4.result4+"</span>元</p>"+
				    "</li>";    		
				    
		            	 $("#zbjl").append(str);
		            	 $(".searListDiv li:odd").addClass("oddColor");
		            }
		        });
			}
		}
	</script>
</body>
</html>