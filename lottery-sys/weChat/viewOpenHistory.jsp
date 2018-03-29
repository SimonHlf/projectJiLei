<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/personalCen/css/setPassword.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/pullRefresh.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_jlzw4ts3bi9vygb9.css"/>
	<link href="${pageContext.request.contextPath }/weChat/reception/css/mobiscroll.core-2.5.2.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/weChat/reception/css/mobiscroll.animation-2.5.2.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/weChat/reception/css/mobiscroll.android-ics-2.5.2.css" rel="stylesheet" type="text/css" />
	<title>查看历史开奖记录</title>
<style type="text/css">
	html{
		overflow:hidden;
	}
	body{
		overflow:hidden;
		position:relative;
	}
	.hisTabNav{
		height:38px;
		line-height:38px;
		background:#fff;
		border-top:1px solid #ccc;
		border-bottom:1px solid #ccc;
		margin-bottom:4px;
	}
	.hisTabNav li{
		width:50%;
		height:100%;
		text-align:center;
		float:left;
		position:relative;
		font-size:0.7rem;
		position:relative;
	}
	.hisTabNav li span{
		width: 2px;
		height: 1rem;
		background: #e1e1e1;
		overflow: hidden;
		position: absolute;
		right: 0px;
		top: 8px;
	}
	.hisTabNav li.active{
		/*border-bottom:3px solid #cf3e46;*/
		height:37px;
		color:#cf3e46 !important;
	}
	.hisTabNav li.active i{
		position:absolute;
		left:0;
		bottom:0;
		width:100%;
		height:3px;
		background:#cf3e46;
	}
	.listConDiv{
		width:100%;
	}
	.listConNav{
		width:100%;
		height:35px;
		line-height:35px;
		background:#f4f4f4;
	}
	.listConNav li,
	.comScroller li p{
		float:left;
		font-size:0.7rem;
		text-align:center;
	}
	.listConNav li{color:#b8b8b8;}
	.listConNav li:nth-of-type(1),
	.comScroller li p:nth-of-type(1){
		width:28%;
	}
	.listConNav li:nth-of-type(2),
	.comScroller li p:nth-of-type(2){
		width:42%;
	}
	.listConNav li:nth-of-type(3),
	.comScroller li p:nth-of-type(3){
		width:30%;
	}
	/*.listConNav li:nth-of-type(3),
	.comScroller li p:nth-of-type(3){
		width:15%;
	}*/
	.comListDiv{
		display:none;
		opacity:0;
		filter:alpha(opacity=0);
	}
	.comScroller li p{
		height: 2rem;
		line-height: 2rem;
	}
	.comScroller li p.flexP{
		display: -webkit-flex;
		display: flex;
		-webkit-justify-content: space-around;
		justify-content: space-around;
		-webkit-align-items: center;
		align-items: center;
	}
	.comScroller li p span{
		width: 1.2rem;
		height: 1.2rem;
		line-height: 1.2rem;
		border-radius: 50%;
		text-align: center;
		background: #b8b8b8;
		color: #fff;
		display: inline-block;
	}
	.comScroller li p span.active{
		background: #cf3e46;
		color: #fff;
	}
	.searBtn{
		width:3rem;
		height:38px;
		line-height:38px;
		text-align:center;
		color:#fff;
		background:#cf3e46;
		display:inline-block;
		float:left;
		border-radius:0 4px 4px 0;
	}
</style>
</head>
<body>
	<div class="aui-bar aui-bar-nav headerNav">
        <a class="aui-pull-left aui-btn" href="javascript:void(0)" tapmode onclick="history.go(-1)">
        	<span class="aui-iconfont aui-icon-left"></span>
        </a>
        <div class="aui-title">历史开奖记录</div>
    </div>
    <div class="comInpBox" style="position:relative;">
   		<ul>
   			<li style="margin-top:10px;margin-bottom:10px;">
                <div class="txtDiv">
                   	选择时间：
                </div>
                <div class="inpDiv" style="width:46%;border-radius:4px 0 0 4px;border-right:none;">
                    <input id="startTimeInp" name="startTime" value="${time }" type="text" placeholder="请选择时间"/>
                </div>
                <a class="searBtn" tapmode href="javascript:void(0)" onclick="query();">
                	<i class="iconfont icon-chaxun"></i>
                </a>
            </li>
   		</ul>
   	</div>
   	<input type="hidden" value="${type }" id="ssc" />
    <!-- tabNav -->
    <div class="hisTabNav">
    	<ul class="clearfix">
    		<li class="active">重庆时时彩<i></i><span></span></li>
    		<li>腾讯分分彩<i></i></li>
    	</ul>
    </div>
    <div class="listConDiv">
    	<ul class="listConNav">
    		<li>期次</li>
    		<li>开奖号码</li>
    		<li>开奖结果</li>
    	</ul>
    	<!-- 重庆时时彩 -->
    	<div id="chongqingWrap" class="comListDiv" style="display:block;opacity:1;">
    		<div id="cqInnerWrap" class="comScroller">
	    		<ul id="cqul">
	    			<c:forEach items="${list }" var="list">
	 					<li class="clearfix">
	 						<p  >${list.periodsNum }</p>
	 						<p class="openNunLi flexP">
	 							<span class="active">${list.resultNumOne }</span>
	 							<span class="active">${list.resultNumTwo }</span>
	 							<span class="active">${list.resultNumThere }</span>
	 							<span class="active">${list.resultNumFout}</span>
	 							<span class="active">${list.resultNumFive }</span>
	 						</p>
	 						<p>${list.result }</p>
	 					</li>
					</c:forEach>
		    	</ul>
		    	<div id="pullUp" class="pullUp">
					<span class="pullup-icon"></span>
					<span class="pullUpLabel">上拉加载更多...</span>
				</div>
	    	</div>
    	</div>
    	<!-- 腾讯分分彩 -->
    	<div id="tengxunWrap" class="comListDiv">
    		<div id="tenInnerWrap" class="comScroller">
    		 	<ul id="txul"></ul>
    		</div>
    	</div>
    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/aui-dialog.js"></script>
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
		var hisType = "chongqing";
		var optionsNum = 0;
		var myScroll,myScroll_1,pullUpEl, pullUpOffset;
		var pageNo_cq = 1;
		var pageNo_ten = 1;
		var wrapperObj = "chongqingWrap";
		$(function(){
			initDate("startTimeInp");
			calHeight();
			getHistoryList("0");
		});
		function calHeight(){
			var cliHei = $(window).height();
			var oHeadNavHei = $(".headerNav").height();
			var oInpHei = $(".comInpBox").height();
			var HisHei = $(".hisTabNav").height();
			$(".listConDiv").height(cliHei - oHeadNavHei - oInpHei - HisHei - 23);
			$(".comListDiv").height($(".listConDiv").height() - $(".listConNav").height());
			switchHisTab();
		}
		document.addEventListener('touchmove', function (e) { e.preventDefault(); }, {passive:false});
		
		function loadedDetail() {
			pullUpEl = document.getElementById('pullUp');
			pullUpOffset = pullUpEl.offsetHeight;;//表示获取元素自身的高度	 
			myScroll = new iScroll(wrapperObj, {
				checkDOMChanges: true,
				onRefresh: function () {
					pullUpEl = document.getElementById('pullUp');
					if (pullUpEl.className == "loading") {
						pullUpEl.className = '';
					}
				},
				onScrollMove: function () {  //onScrollMove：主要表示根据用户下拉或上拉刷新的高度值,来显示不同的交互文字;
					//this.y 表示手指下拉的高度
					pullUpEl = document.getElementById('pullUp');
					if (this.y < (this.maxScrollY - 5) && !pullUpEl.className.match('flip')) {//向上滑动
						pullUpEl.className = 'flip';
						pullUpEl.querySelector('.pullUpLabel').innerHTML = '释放加载更多...';
						this.maxScrollY = this.maxScrollY;
					}else if (this.y > (this.maxScrollY + 5) && pullUpEl.className.match('flip')) {
						pullUpEl.className = '';
						pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
						this.maxScrollY = pullUpOffset;
					}
				},
				onScrollEnd: function () { //onScrollEnd:表示用户下拉刷新完,放开手指时所显示的不同的交互文字
					pullUpEl = document.getElementById('pullUp');
					//pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...'
					if (pullUpEl.className.match('flip')) {
						pullUpEl.className = 'loading';
						pullUpEl.querySelector('.pullUpLabel').innerHTML = '加载数据中...';	
						if(optionsNum == 0){
							pullUpAction("chongqing");// Execute custom function (ajax call?)
						}else if(optionsNum == 1){
							pullUpAction("tencent");
						}
						
					}
				}
			});
		}
		function pullUpAction (hisType) {
			setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
				getHistoryListMore(hisType);
				myScroll.refresh();// 数据加载完成后，调用界面更新方法 Remember to refresh when contents are loaded (ie: on ajax completion)
			}, 1000);	// <-- Simulate network congestion, remove setTimeout from production!
				
		}
		function getHistoryListMore(hisTypeTmp){
			console.log(hisTypeTmp)
			var pageNo_temp = 1;
			var startTimeInp = $("#startTimeInp").val();
			var type = $("#ssc").val();
			hisType = hisTypeTmp;
			if(hisType == "chongqing"){
				pageNo_cq++;
				pageNo_temp = pageNo_cq;
			}else if(hisType == "tencent"){
				pageNo_ten++;
				pageNo_temp = pageNo_ten;
			}
			$.ajax({
				  type:"post",
				  dataType:"json",
				  data:{"time":startTimeInp,"type":type},
				  url:"${pageContext.request.contextPath }/lotterts/fingByQH.htm?page="+pageNo_temp,
				  success:function (data){ 
					  console.log("jinlai")
					  var result = data.listDto;
					  if(result.length > 0){
						  $(".pullUpLabel").html("上拉加载更多...")
						  var str = "";
			        	  $.each(result, function (n, value) {
			        		 str+="<li class='clearfix'>"+
		 						"<p class='timeNumLi'>"+value.periodsNum+"</p>"+
		 						"<p class='openNunLi flexP'>"+
		 						"	<span class='active'>"+value.resultNumOne+"</span>"+
		 						"	<span class='active'>"+value.resultNumTwo+"</span>"+
		 						"	<span class='active'>"+value.resultNumThere+"</span>"+
		 						"	<span class='active'>"+value.resultNumFout+"</span>"+
		 						"	<span class='active'>"+value.resultNumFive+"</span>"+
		 						"</p>"+
		 						"<p>"+value.result+"</p>"+
		 						"</li>";
			        	  });
			        	  if(type == "0"){
			        		 $("#cqul").append(str);
			        	  }else if(type == "1"){
			        		 $("#txul").append(str);
			        	  }
			        	  $(".comListDiv li:odd").addClass("oddColor");
					  }else{
						  pullUpEl.querySelector('.pullUpLabel').innerHTML = '没有更多了...';
						  pullUpEl.className = "";
					  }
				  }
			});
		}
		function switchHisTab(){
			$(".hisTabNav li").each(function(i){
				$(this).click(function(){
					var cqPullDiv = $("#cqul").siblings();
					var tenPullDiv = $("#txul").siblings();
					$(".hisTabNav li").removeClass("active");
					$(this).addClass("active");
					$(".comListDiv").hide().css({"opacity":0});
					$(".comListDiv").eq(i).show().animate({"opacity":1});
					if(i == 0){//重庆时时彩
						$("#ssc").val("0");
						var startTimeInp = $("#startTimeInp").val();
						getHistoryList($("#ssc").val());
						wrapperObj = "chongqingWrap";
						optionsNum = 0;
						if(tenPullDiv.length > 0){
							tenPullDiv.remove();//删除第二个pullUp
						}
						var str_cqPull = "<div id='pullUp' class='pullUp'><span class='pullup-icon'></span><span class='pullUpLabel'>上拉加载更多...</span></div>";
						if(cqPullDiv.length == 0){
							$("#cqInnerWrap").append(str_cqPull);
						}
						if($("#cqul li").length == 0){
							$("#pullUp").hide();
						}else{
							loadedDetail();
							$("#pullUp").show();
						}
					}else{//腾讯分分彩 
						$("#ssc").val("1");
						var startTimeInp = $("#startTimeInp").val();
						getHistoryList($("#ssc").val());
						wrapperObj = "tengxunWrap";
						optionsNum = 1;
						if(cqPullDiv.length > 0){
							cqPullDiv.remove();//删除第一个pullUp
						}
						var str_tenPull = "<div id='pullUp' class='pullUp'><span class='pullup-icon'></span><span class='pullUpLabel'>上拉加载更多...</span></div>";
						if(tenPullDiv.length == 0){
							$("#tenInnerWrap").append(str_tenPull);
						}
						if($("#txul li").length == 0){
							$("#pullUp").hide();
						}else{
							loadedDetail();
							$("#pullUp").show();
						}
					}
				});
			});
		}
		//查询 
		function query(type){
			var ssc = $("#ssc").val();
			getHistoryList(ssc);
		}
		function getHistoryList(type){
			var startTimeInp = $("#startTimeInp").val();
			$.ajax({
   			 	 method:'post',
   			 	 data:{"time":startTimeInp,"type":type},
		         url:'${pageContext.request.contextPath }/lotterts/fingByQH.htm',
		         success:function (data) {
		        	 var str = "";
		        	 var result = jQuery.parseJSON(data).listDto;
		        	 if(result.length > 0){
		        		 $(".noDataDiv").remove();
		        		 $("#pullUp").show();
		        		 $(".pullUpLabel").html("上拉加载更多...");
		        		 var cqPullDiv = $("#cqul").siblings();
						 var tenPullDiv = $("#txul").siblings();
			        	 $.each(result, function (n, value) {
			        		 str+="<li class='clearfix'>"+
		 						"<p class='timeNumLi'>"+value.periodsNum+"</p>"+
		 						"<p class='openNunLi flexP'>"+
		 						"	<span class='active'>"+value.resultNumOne+"</span>"+
		 						"	<span class='active'>"+value.resultNumTwo+"</span>"+
		 						"	<span class='active'>"+value.resultNumThere+"</span>"+
		 						"	<span class='active'>"+value.resultNumFout+"</span>"+
		 						"	<span class='active'>"+value.resultNumFive+"</span>"+
		 						"</p>"+
		 						"<p>"+value.result+"</p>"+
		 						"</li>";
			        	 });
			        	 if(type == "0"){
			        		 $("#cqul").html(str);
			        	 }else if(type == "1"){
			        		 console.log("11")
			        		 $("#txul").html(str);
			        	}
			        	loadedDetail();
		        	 }else{
		        		 $("#pullUp").hide();
		        		 if(type == "0"){
		        			 $("#cqul").html("");
		        			 $("#chongqingWrap").append("<div class='noDataDiv'><i class='iconfont icon-zanwuyituichudingdan'></i><p>暂无记录</p></div>");
		        		 }else if(type == "1"){
		        			 $("#txul").html("");
		        			 $("#tengxunWrap").append("<div class='noDataDiv'><i class='iconfont icon-zanwuyituichudingdan'></i><p>暂无记录</p></div>");
		        		 }
		        	 }
		         }
   			});
		}
	</script>
</body>
</html>