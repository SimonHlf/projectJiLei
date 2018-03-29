<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>帐变记录</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/comSearchList.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_16ax4xs0yp8bmx6r.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/personalCen/css/setPassword.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/footer/footer.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/pullRefresh.css"/>
	<style type="text/css">
		html{
			overflow:hidden;
		}
		body{
			overflow:hidden;
			position:relative;
		}
		.icon-chakan1{
			color:#cf3e46;
			font-size:0.6rem;
		}
	</style>
</head>
<body>
	<div class="aui-bar aui-bar-nav headerNav">
        <a class="aui-pull-left aui-btn" tapmode href="${pageContext.request.contextPath }/personal/indexs.htm">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <div class="aui-title">帐变记录</div>
    </div>
    <!-- mainCon -->
    <form action="${pageContext.request.contextPath }/changerecodes/find.htm" method="post" id="forms">
	    <div class="comInpBox">
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
	    	<a href="javascript:void(0)" tapmode onclick="searchRecord()" class="aui-btn aui-btn-block comAuiBtn">查询</a>
	    </div>
    </form>
    <div class="searchRes">
    	<ul class="listNav accChangeNav clearfix">
    		<li>时间</li>
    		<li>类型</li>
    		<li>金额</li>
    		<li>详情</li>
    	</ul>
    	<div id="wrappers" class="searListDiv accChangeList">
    		<div class="scroller">
    			<ul id="zbjl">
    				<c:forEach items="${list }" var="list">
	    				<li>
		           		 	  <p>${list.creatTime }</p>
		           		 	  <p class="aui-ellipsis-1">
		           		 	  	<c:if test="${list.type==0 }">充值</c:if>
		           		 	  	<c:if test="${list.type==1 }">提现</c:if>
		           		 	  	<c:if test="${list.type==2 }">下注</c:if>
		           		 	  	<c:if test="${list.type==3 }">中奖</c:if>
		           		 	  	<c:if test="${list.type==4 }">佣金</c:if>
		           		 	  </p>
		           		 	  <p><span class="moneySpan">${list.changeMoney }</span>元</p>
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
    <!-- 查看账变记录详情 -->
    <div class="detilRecordDiv">
    	<div class="aui-bar aui-bar-nav headerNav1">
	        <a class="aui-pull-left aui-btn" tapmode onclick="closeDetailRec()">
	            <span class="aui-iconfont aui-icon-left"></span>
	        </a>
	        <div class="detailTit">账变记录注详情</div>
	    </div>
	    <div class="aui-content">
	    	<ul class="aui-list aui-form-list" id="changeRecode">
	    		<li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">投注账号：</div>
		                <div class="aui-list-item-input"><p id="tzAccound">疯狂心跳最后一秒</p></div>
		            </div>
		        </li>
	    		<li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">投注时间：</div>
		                <div class="aui-list-item-input"><p id="tzCreatTime">2018-01-24 20:30</p></div>
		            </div>
		        </li>
		      <!--   <li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">投注期号：</div>
		                <div class="aui-list-item-input"><p id="tzPNum">201801230978</p></div>
		            </div>
		        </li> -->
		        <li class="aui-list-item" >
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">帐变类型：</div>
		                <div class="aui-list-item-input" id="typetz"><p >下注</p></div>
		            </div>
		        </li>
		        <li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">变动金额：</div>
		                <div class="aui-list-item-input"><p id="money" style="color:red">200元</p></div>
		            </div>
		        </li>
		         <!-- <li class="aui-list-item">
		            <div class="aui-list-item-inner">
		                <div class="aui-list-item-label">账变备注：</div>
		                <div class="aui-list-item-input"><p id="remarkstz">返点</p></div>
		            </div>
		        </li> -->
	    	</ul>
	    </div>
	</div>
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.core-2.5.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.core-2.5.2-zh.js"></script>
	<link href="${pageContext.request.contextPath }/weChat/reception/css/mobiscroll.core-2.5.2.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/weChat/reception/css/mobiscroll.animation-2.5.2.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.datetime-2.5.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.datetime-2.5.1-zh.js"></script>
	<!-- S 可根据自己喜好引入样式风格文件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/mobiscroll.android-ics-2.5.2.js"></script>
	<link href="${pageContext.request.contextPath }/weChat/reception/css/mobiscroll.android-ics-2.5.2.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/personalCen.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/iscroll.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/comPullRefresh.js"></script>
	<script type="text/javascript">
		$(function(){
			initDate("startTimeInp");
			initDate("endTimeInp");
			calHeight();
		});
		function calHeight(){
			var cliHei = document.documentElement.clientHeight;
			var oHeadNavHei = $(".headerNav").height();
			var oComInpHei = $(".comInpBox").height();
			var oBetLiHei = $(".listNav").height();
			$("#wrappers").height(cliHei-oHeadNavHei-oComInpHei-oBetLiHei-75);
		}
		document.addEventListener('DOMContentLoaded', function () { setTimeout(function(){loaded(document.getElementById("wrappers"))}, 200); }, {passive:false});
		var page = 1;
		function pullUpAction() {
			var stVal = $("#startTimeInp").val();
			var endVal = $("#endTimeInp").val();
			page++;
			setTimeout(
					function() {
						$.ajax({
						url:'${pageContext.request.contextPath }/changerecodes/find.htm?page='+page,
						type : 'get',
						data:{
				            	'startDate':stVal,
				            	'endDate':endVal
				        },
						success : function(data) {
							if (jQuery.parseJSON(data).list.length == 0) {
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
			var accountInp = $("#accountInp").val();
			$(".pullUpLabel").html("上拉加载更多");
			if(stVal == ""){
				dialog('起始时间不能为空');
				return;
			}else if(endVal == ""){
				dialog('截至时间不能为空');
				return;
			}else if(accountInp == ""){
				dialog('查询账号不能为空');
				return;
			}else{
				if(endVal < stVal){
					dialog('结束时间不能小于开始时间');
					return;
				}
				$("#zbjl").html("");
				 $.ajax({
					method:'post',
		            url:'${pageContext.request.contextPath }/changerecodes/find.htm',
		            data:{
		            	'startDate':stVal,
		            	'endDate':endVal
		            },
		            success:function (data) {
		            	result(data);
		            }
		        }); 
			}
		}
		function result(data){
        	var result = jQuery.parseJSON(data).list;
        	if(result.length != 0){
        		 $(".noDataDiv").remove();
        		 var tli="";
	           	 $.each(result, function (n, value) {
	           		 str=""
	           		 var type="";
	           		 if(value.type==0){
	           			 type="充值";
	           		 }
	           		 if(value.type==1){
	           			 type="提现"
	           		 }
	           		 if(value.type==2){
	           			 type="下注";
	           		 } 
	           		 if(value.type==3)
	           		 {
	           			 type="中奖";
	           		 }
	           		 if(value.type==4){
	           			 type="佣金";
	           		 }
	           		 str+="<li>"+
	           		 	  "<p>"+value.creatTime+"</p>"+
	           		 	  "<p class=\"aui-ellipsis-1\">"+type+"</p>"+
	           		 	  "<p><span class=\"moneySpan\">"+value.changeMoney+"</span>元</p>"+
	           		 	  "<p tapmode onclick='viewDetailRecord("+value.id+")'><i class='iconfont icon-chakan1'></i></p>"+
	   	            	  "</li>";
	           		 tli+=str;
	           	 });
	           	 
	           	 $("#zbjl").append(tli);
	           	 $(".searListDiv li:odd").addClass("oddColor");
	           	$("#pullUp").show();
        	}else{
        		 $("#wrappers").append("<div class='noDataDiv'><i class='iconfont icon-zanwuyituichudingdan'></i><p>暂无记录</p></div>");
 				 $("#pullUp").hide();
        	}
        	 
		}
		
		function viewDetailRecord(id){
			$("#tznr").remove();
			$("#tzqh").remove();
			$("#kjjg").remove();
			$("#zbbz").remove();
			$.ajax({
   			 	method:'post',
		         url:'${pageContext.request.contextPath }/personal/findById.htm?id='+id,
		         success:function (data) {
		        	 var result = jQuery.parseJSON(data);
		             $("#tzAccound").html(result.frontUser.cellPhone);
		             $("#tzCreatTime").html(result.change.creatTime);
		             $("#money").html(result.change.changeMoney+"元");
		             var types = "";
		             var presult = "";
		             var iswin = "";
		             var type = result.change.type;
		             var remarks = "<li class='aui-list-item' id='zbbz'><div class='aui-list-item-inner'><div class='aui-list-item-label'>帐变备注：</div>"+
		                "<div class='aui-list-item-input'><p id='remarks'></p></div></div>"+
		        		"</li>";
		             if(result.iswin==0){
		            	 iswin = "已中奖";
		             }else if(result.iswin==1){
		            	 iswin = "未中奖";
		             }else{
		            	 iswin = "未开奖";
		             }
		             if(type==0){
		            	 $("#typetz").html("充值")
		            	 $("#changeRecode").append(remarks);
		            	 $("#remarks").html("充值");
		             }else if(type==1){
		            	 $("#typetz").html("提现");
		            	 $("#changeRecode").append(remarks);
		            	 $("#remarks").html("提现");
		             }else if(type==2){
		            	 $("#typetz").html("下注");
		            	 
		            	 if(result.lotRecode.types==0){
		            		 types = "重庆-"+result.result;
		            	 }else{
		            		 types = "腾讯-"+result.result;
		            	 }
		            	 var str = "<li class='aui-list-item' id='tzqh'><div class='aui-list-item-inner'><div class='aui-list-item-label'>投注期号：</div>"+
				                "<div class='aui-list-item-input'><p>"+result.periods+"</p></div></div>"+
				        		"</li>"+
		            	 "<li class='aui-list-item' id='tznr'><div class='aui-list-item-inner'><div class='aui-list-item-label'>投注内容：</div>"+
				                "<div class='aui-list-item-input'><p>"+types+"</p></div></div>"+
				        		"</li><li class='aui-list-item' id='kjjg'><div class='aui-list-item-inner'><div class='aui-list-item-label'>开奖结果：</div>"+
			                	"<div class='aui-list-item-input'><p>"+result.perResult+"</p></div></div></li><li class='aui-list-item' id='zbbz'><div class='aui-list-item-inner'><div class='aui-list-item-label'>帐变备注：</div>"+
				                "<div class='aui-list-item-input'><p id='remarks'></p></div></div>"+
				        		"</li>";
			             $("#changeRecode").append(str);
			             $("#remarks").html(iswin);
		             }else if(type==3){
		            	 if(result.lotRecode.types==0){
		            		 types = "重庆-"+result.result;
		            	 }else{
		            		 types = "腾讯-"+result.result;
		            	 }
		            	 var str = "<li class='aui-list-item' id='tzqh'><div class='aui-list-item-inner'><div class='aui-list-item-label'>投注期号：</div>"+
			                "<div class='aui-list-item-input'><p>"+result.periods+"</p></div></div>"+
			        		"</li>"+
	            	 		"<li class='aui-list-item' id='tznr'><div class='aui-list-item-inner'><div class='aui-list-item-label'>投注内容：</div>"+
			                "<div class='aui-list-item-input'><p>"+types+"</p></div></div>"+
			        		"</li><li class='aui-list-item' id='kjjg'><div class='aui-list-item-inner'><div class='aui-list-item-label'>开奖结果：</div>"+
		                	"<div class='aui-list-item-input'><p>"+result.perResult+"</p></div></div></li><li class='aui-list-item' id='zbbz'><div class='aui-list-item-inner'><div class='aui-list-item-label'>帐变备注：</div>"+
			                "<div class='aui-list-item-input'><p id='remarks'></p></div></div>"+
			        		"</li>";
			        	 $("#changeRecode").append(str);
		            	 $("#typetz").html("中奖");
		            	 $("#remarks").html("中奖");
		             }else{
		            	 $("#typetz").html("佣金");
		            	 $("#changeRecode").append(remarks);
		            	 $("#remarks").html("返点");
		             }
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