<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>下注记录</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/comSearchList.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/pullRefresh.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_16ax4xs0yp8bmx6r.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/footer/footer.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/personalCen/css/setPassword.css"/>
	<link href="${pageContext.request.contextPath }/weChat/reception/css/mobiscroll.core-2.5.2.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/weChat/reception/css/mobiscroll.animation-2.5.2.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/weChat/reception/css/mobiscroll.android-ics-2.5.2.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		html{
			overflow:hidden;
		}
		body{
			overflow:hidden;
			position:relative;
		}
		#gameStyleSel{
			height: 100%;
			font-size: 0.7rem;
			color: #666;
			padding-left: 3px;
		}
		.getAllDiv{
			width:4rem;
			height:4rem;
			position:fixed;
			left:0px;
			bottom:60px;
			background:rgba(207,62,70,.5);
			border-radius:50%;
			display:none;
		}
		.icon-chakan1{
			color:#cf3e46;
			font-size:0.6rem;
		}
	</style>
</head>
<body>
	<header class="aui-bar aui-bar-nav headerNav">
        <a class="aui-pull-left aui-btn" tapmode href="${pageContext.request.contextPath }/lotterts/reception.htm">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <div class="aui-title">下注记录</div>
    </header>
    <!-- mainCon -->
    <form action="${pageContext.request.contextPath }/lotrecodes/findByLoss.htm" method="post" id="ajaxFrm">
    <div class="comInpBox">
    	<ul>
    		<li>
                <div class="txtDiv">
                   	起始时间：
                </div>
                <div class="inpDiv">
                    <input id="startTimeInp" name="startTime" value="${startTime }" type="text" placeholder="请选择起始时间">
                </div>
            </li>
            <li>
                <div class="txtDiv">
                   截止时间：
                </div>
                <div class="inpDiv">
                    <input id="endTimeInp" name="endTime" value="${endTime }" type="text" placeholder="请选择截止时间">
                </div>
            </li>
            <li>
                <div class="txtDiv">
                   游戏类型：
                </div>
                <div class="inpDiv">
                   <select name="types" id="gameStyleSel">
                   		<option value="">全部游戏类型</option>
                   		<option value="1">腾讯分分彩</option>
                   		<option value="0">重庆时时彩</option>
                   </select>
                   <i class="iconfont icon-jiantou arrowIcon"></i>
                </div>
            </li>
    	</ul>
    	<a href="javascript:void(0)" tapmode onclick="searchRecord()" class="aui-btn aui-btn-block comAuiBtn">查询</a>
    	
    	<!--  a href="javascript:void(0)" class="aui-btn aui-btn-block comAuiBtn" tapmode onclick="resultAll();">一键开奖</a-->
    </div>
    </form>
    
       <!-- 查询结果list -->
    <div class="searchRes">
    	<ul class="listNav betListNav clearfix">
    		<li>期数</li>
    		<li>时间</li>
    		<li>游戏类型</li>
    		<li>投注金额</li>
    		<li>结果</li>
    		<li>详情</li>
    	</ul>
    	<div id="wrappers" class="searListDiv betList">
    		<div class="scroller">
    			<ul id="ulzj">
    				<c:forEach items="${listDto }" var="list">
	    				<li>
		         		 		<p>${list.pNum }</p>
		         				<p>${list.creatTime }</p >
			            		<p class='aui-ellipsis-1'>
			            			<c:if test="${list.type==0 }">重庆-${list.result }</c:if>
			            			<c:if test="${list.type==1 }">腾讯-${list.result }</c:if>
			            		</p>
			            		<p><span>${list.money }<span>元</span>  </p>
			            		<p tapmode >
			            			<c:choose>
			            				<c:when test="${list.isWin==0 }">
			            					<span class="yizhong">已中奖</span>
			            				</c:when>
			            				<c:when test="${list.isWin==1 }">
			            					<span class="weizhong">未中奖</span>
			            				</c:when>
			            				<c:when test="${list.isKJ==0 }">
			            					<span class="weizhong">未开奖</span>
			            				</c:when>
			            				<c:when test="${list.isGFKJ==1 }">
			            					<span class="weizhong">冻结</span>
			            				</c:when>
			            				<c:otherwise>
			            					<span class="weizhong">未开奖</span>
			            				</c:otherwise>
			            			</c:choose>
			            		</p>
			            		<p tapmode onclick='viewDetailRecord(${list.id})'><i class='iconfont icon-chakan1'></i></p>
			            </li>
    				</c:forEach>
    			</ul>
				<div id="pullUp">
					<span class="pullup-icon"></span>
					<span class="pullUpLabel">上拉加载更多...</span>
				</div>
			</div>
    	</div>
    </div>
    <!-- 查看投注记录详情 -->
    <div class="detilRecordDiv">
    	<div class="aui-bar aui-bar-nav headerNav1">
	        <a class="aui-pull-left aui-btn" tapmode onclick="closeDetailRec()">
	            <span class="aui-iconfont aui-icon-left"></span>
	        </a>
	        <div class="detailTit">第<span id="QS"></span>期投注详情</div>
	    </div>
	    <div class="aui-content">
        	<ul class="aui-list aui-form-list" id="ulll">
        		<li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">投注期数：</div>
		                <div class="aui-list-item-input"><p id="pNums"></p></div>
		            </div>
		        </li>
		        <li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">开奖号码：</div>
		                <div class="aui-list-item-input"><p id="nums"></p></div>
		            </div>
		        </li>
		        <li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">投注时间：</div>
		                <div class="aui-list-item-input"><p id="tzTime"></p></div>
		            </div>
		        </li>
		        <li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">游戏类型：</div>
		                <div class="aui-list-item-input"><p id="gameType">重庆时时彩</p></div>
		            </div>
		        </li>
		        <li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">投注信息：</div>
		                <div class="aui-list-item-input"><p id="moneys">10000元</p></div>
		            </div>
		        </li>
		        <li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">投注结果：</div>
		                <div class="aui-list-item-input">
		                	<p id="tzresult">已中奖</p>
		                </div>
		            </div>
		        </li>
		        <li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">下注金额：</div>
		                <div class="aui-list-item-input">
		                	<p id="changemoney" style="color:red">200</p>
		                </div>
		            </div>
		        </li>
		        <li class="aui-list-item" id="by">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">奖励金额：</div>
		                <div class="aui-list-item-input">
		                	<p id="jlmoney" style="color:red">200</p>
		                </div>
		            </div>
		        </li>
        	</ul>
        </div>
    </div>
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.core-2.5.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.core-2.5.2-zh.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.datetime-2.5.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.datetime-2.5.1-zh.js"></script>
	<!-- S 可根据自己喜好引入样式风格文件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.android-ics-2.5.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/iscroll.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/comPullRefresh.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/personalCen.js"></script>
	

	<script type="text/javascript">
		$(function(){
			initDate("startTimeInp");
			initDate("endTimeInp");
			calHeight();
		});
		
		function resultAll(){
			var stVal = $("#startTimeInp").val();
			var endVal = $("#endTimeInp").val();
			var gameStyleVal = $("#gameStyleSel").val();
			$.ajax({
				method:'post',
	            url:'${pageContext.request.contextPath }/lotrecodes/resultAll.htm',
	            success:function (data) {
	            	if(data!=null){
	            		 $.ajax({
	     					method:'post',
	     		            url:'${pageContext.request.contextPath }/lotrecodes/findByLoss.htm',
	     		            data:{
	     		            	'startTime':stVal,
	     		            	'endTime':endVal,
	     		            	'types':gameStyleVal
	     		            },
	     		            success:function (data) {
	     		            	searchRecord();
	     		            	$.ajax({
	   	            			 method:'post',
	   	    			         url:'${pageContext.request.contextPath }/lotterts/ajaxMoney.htm',
	   	    			         success:function (data) {
	   	    			             $("#balances").html("");
	   	    			             $("#balances").html(data);
	   	    			         }
	   	            		});
	     		            }
	     		        });
	            	}
	            }
	        }); 
		}
		function calHeight(){
			var cliHei = $(window).height();
			var oHeadNavHei = $(".headerNav").height();
			var oComInpHei = $(".comInpBox").height();
			var oComBtn = $(".comAuiBtn").height();
			var oBetLiHei = $(".betListNav ").height();
			$("#wrappers").height(cliHei-oHeadNavHei-oComInpHei-oComBtn-oBetLiHei-36);
		}
		document.addEventListener('DOMContentLoaded', function () { setTimeout(function(){loaded(document.getElementById("wrappers"))}, 200); }, {passive:false});
		var page = 1;
		function pullUpAction() {
			var stVal = $("#startTimeInp").val();
			var endVal = $("#endTimeInp").val();
			var gameStyleVal = $("#gameStyleSel").val();
			page++;
			setTimeout(
					function() {
						$.ajax({
						url:'${pageContext.request.contextPath }/lotrecodes/findByLoss.htm?page='+page,
						type : 'get',
						data:{
				            	'startTime':stVal,
				            	'endTime':endVal,
				            	'types':gameStyleVal
				        },
						success : function(data) {
							if (JSON.parse(data).listDto.length == 0) {
								pullUpEl.querySelector('.pullUpLabel').innerHTML = '没有更多了...';
								pullUpEl.className = "";
							} else {
								result(data);
								$("#pullUp").show();
								myScroll.refresh();
							}
						},
						error : function() {
							console.log('error');
						},
					})
				}, 1000)
		 }
		function searchRecord(){
			var stVal = $("#startTimeInp").val();
			var endVal = $("#endTimeInp").val();
			$(".pullUpLabel").html("上拉加载更多");
			//游戏类型
			var gameStyleVal = $("#gameStyleSel").val();
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
				$("#ulzj").html("");
				 $.ajax({
					method:'post',
		            url:'${pageContext.request.contextPath }/lotrecodes/findByLoss.htm',
		            data:{
		            	'startTime':stVal,
		            	'endTime':endVal,
		            	'types':gameStyleVal
		            },
		            success:function (data) {
		            	result(data);
		            }
		        }); 
			}
		}
		
		queryKJ = function(id,result,n){
			$.ajax({
	            method:'post',
	            url:'${pageContext.request.contextPath }/lotrecodes/details.htm',
	            data:{
	            	'id':id,
	            	'result':result
	            	},
	            success:function (data) {
	            	if(data==0){
	            		$("#kj"+n).html("已中奖");
	            		$.ajax({
	            			 method:'post',
	    			         url:'${pageContext.request.contextPath }/lotterts/ajaxMoney.htm',
	    			         success:function (data) {
	    			             $("#balances").html("");
	    			             $("#balances").html(data);
	    			         }
	            		});
	            	}else{
	            		$("#kj"+n).html("未中奖");
	            	}	            
	            }
	        });
		}
		
		function result(data){
			var result = jQuery.parseJSON(data).listDto;
			if(result.length != 0){
				$(".noDataDiv").remove();
				var tli="";
	         	var str="";
	         	 $.each(result, function (n, value) {
	         		 var str = "";
	         		 var str1="";
	         		 var isWin="";
	         		 var isKJ="";
	         		 var id = value.id;
	         		 var result=value.result;
	         		 if(value.type==0){
	         			str1="重庆-";
	         		 }
	         		 if(value.type==1){
	         			str1="腾讯-";
	        		 }
	         		if(value.isWin==0){
	         			isWin="<span id=\"kj"+n+"\" class=\"yizhong\">已中奖</span>";
	        		 }else if(value.isWin==1){
	         			isWin="<span id=\"kj"+n+"\" class=\"weizhong\">未中奖</span>";
	        		 }else if(value.isGFKJ==1){
	        			 isKJ="<span id=\"kj"+n+"\" class=\"weizhong\">冻结</span>";
	        		 }else if(value.isKJ==0){
	         			isKJ="<span id=\"kj"+n+"\" class=\"weizhong\">未开奖</span>";
	        		 }else{
	        			 isKJ="<span id=\"kj"+n+"\" class=\"weizhong\">未开奖</span>";
	        			 //isKJ ="<span id=\"kj"+n+"\" tapmode onclick='queryKJ("+id+",\""+result+"\","+n+");' ><i class='iconfont icon-chakan'></i>开奖</span>";
	        		 }
	         		 str += "<li>"+
	         		 		"<p>"+value.pNum+"</p>"+
	         				"<p>"+value.creatTime+"</p >"+
		            		"<p class='aui-ellipsis-1'>"+str1+value.result+"</p>"+
		            		"<p><span><span>"+value.money+"</span>元  </p>"+
		            		"<p tapmode >"+isWin+isKJ+"</p>" + 
		            		"<p tapmode onclick='viewDetailRecord("+value.id+")'><i class='iconfont icon-chakan1'></i></p>"+
		            		"</li>";
		            		tli+=str;
	         	 });
	         	 
	        	 $("#ulzj").append(tli);
	        	 $(".searListDiv li:odd").addClass("oddColor");
	        	 $("#pullUp").show();
			}else{
				$("#wrappers").append("<div class='noDataDiv'><i class='iconfont icon-zanwuyituichudingdan'></i><p>暂无记录</p></div>");
				$("#pullUp").hide();
			}
		}
		
		//展开详情页
		function viewDetailRecord(id){
			$.ajax({
   			 	method:'post',
		         url:'${pageContext.request.contextPath }/lotrecodes/findById.htm?id='+id,
		         success:function (data) {
		        	 var result = jQuery.parseJSON(data);
		             $("#pNums").html(result.pNum+"期");
		             $("#tzTime").html(result.creatTime);
		             $("#changemoney").html(result.money+"元");
		             if(result.type==0){
		            	 $("#gameType").html("重庆时时彩-"+result.paly);
		            	 $("#moneys").html("重庆-"+result.result);/* +" "+result.money+"元" */
		             }else{
		            	 $("#gameType").html("腾讯分分彩-"+result.paly);
		            	 $("#moneys").html("腾讯-"+result.result);/* +" "+result.money+"元" */
		             }
		             if(result.isWin==0){
		            	 $("#ulll li:last").css("display","block");
		            	 $("#jlmoney").html(result.canMoney+"元");
		            	 $("#tzresult").html("已中奖");
		             }else if(result.isWin==1){
		            	 $("#ulll li:last").css("display","none");
		            	 $("#tzresult").html("未中奖");
		             }else{
		            	 $("#ulll li:last").css("display","none");
		            	 $("#tzresult").html("未开奖");
		             }
		             if(result.nums==0){
						 $("#nums").html("未开奖");         	 
		             }else{
			             $("#nums").html(result.nums);
		             }
		             $("#QS").html(result.pNum.substring(8,11));
		         }
   			});
			
			$(".detilRecordDiv").css({
		        "-webkit-transform":"translateX(0)",
		        "transform":"translateX(0)"
		    });
		}
	</script>
</body>
</html>