<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>首页</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/reception/css/index.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_bfgfkfoxhdh4obt9.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weChat/footer/footer.css"/>
	<!-- link href="${pageContext.request.contextPath }/admin/assets/layui/css/layui.css" rel="stylesheet" type="text/css" / -->
</head>
<body>
	<header class="aui-bar aui-bar-nav headerNav" style="position: fixed;left: 0;top:0;">
        <a class="aui-pull-left aui-btn" href="javascript:void(0)">
        </a>
        <div class="aui-title">首页</div>
    </header>
    <!-- 公告 -->
     <c:if test="${notice.isOpen==1 }">
        <div class="marquee" style="position: fixed;">
	      <i class="iconfont icon-gonggao1"></i>
		  <div>
		    <span>${notice.content }</span>
			<span>${notice.content }</span>
		  </div>
		</div>
    </c:if> 
   
    <!-- div class="marquee" style="position: fixed;">
      <i class="iconfont icon-gonggao1"></i>
	  <div>
	    <span>我是公告内容我是公告内容我是公告内容</span>
	    <span>我是公告内容我是公告内容我是公告内容</span>
	  </div>
	</div 
	-->
 	<div class="comTabNav noPubRep_nav" style="position: fixed;left: 0;">
 		<ul class="clearfix">
 			<li class="active_nav" onclick="showOtherPlay();">
 				<p id="nowPlayWayP"></p>
 				<input type="hidden" id="nowHidePlayWays"/>
 				<span class="decSpan"></span>
 				<i class="iconfont icon-jiantou arrowIcon"></i>
 			</li>
 			<li tapmode onclick="goKefu()">
 				<i class="iconfont icon-kefu comSmIcon"></i>
 				<p>客服</p>
 				<span class="decSpan"></span>
 			</li>
 			<li tapmode onclick="golinks()">
 				<i class="iconfont icon-share comSmIcon"></i>
 				<p>分享赚钱</p>
 			</li>
 		</ul>
 	</div>
 	
 	<!-- 5.58rem 4.25rem -->
 	<div class="caipiaoDiv noPubRep_caipiao">
 		<!-- 期刊 -->
 		<c:if test="${type==0 }">
	 		<c:choose>
	 			<c:when test="${isflag==0 }">
		 			<div class="topPart">
			 			<p class="numP aui-pull-left">
						           第<span id="pNums">${pNum }</span>期</p>
			 			<div class="leftTimeDiv aui-pull-left">
			 				<p class="aui-pull-left">投注倒计时</p>
			 				<p id="a1" alltime="" class="timeLayer aui-pull-left dtime"></p>
			 			</div>
			 		</div>
	 			
	 			</c:when>
	 			<c:otherwise>
	 				<div class="topPart">
	 					<div style="text-align:center;color:#cf3e46;font-size:0.8rem;">重庆时时彩系统维护中</div>
	 					<div class="leftTimeDiv aui-pull-left" style="display: none;">
			 				<p class="aui-pull-left">投注倒计时</p>
			 				<p id="a1" alltime="" class="timeLayer aui-pull-left dtime"></p>
			 			</div>
	 				</div>
	 			</c:otherwise>
	 		</c:choose>
 		</c:if>
 		<c:if test="${type==1 }">
 			<c:choose>
	 			<c:when test="${isflagTen==0 }">
		 			<div class="topPart">
			 			<p class="numP aui-pull-left">
						           第<span id="pNums">${pNum }</span>期</p>
			 			<div class="leftTimeDiv aui-pull-left">
			 				<p class="aui-pull-left">投注倒计时</p>
			 				<p id="a1" alltime="" class="timeLayer aui-pull-left dtime"></p>
			 			</div>
			 		</div>
	 			
	 			</c:when>
	 			<c:otherwise>
	 				<div class="topPart">
	 					<div style="text-align:center;color:#cf3e46;font-size:0.8rem;">腾讯分分彩系统维护中</div>
	 					<div class="leftTimeDiv aui-pull-left" style="display: none;">
			 				<p class="aui-pull-left">投注倒计时</p>
			 				<p id="a1" alltime="" class="timeLayer aui-pull-left dtime"></p>
			 			</div>
	 				</div>
	 			</c:otherwise>
	 		</c:choose>
 		</c:if>
 		
 		<!-- selBet -->
 		<div class="selBetDiv">
 			<ul class="selBetUlNav">
 				<li class="timeNumLi">期次</li>
 				<li class="openNunLi">开奖号码</li>
 				<li class="resLi">结果</li>
 			</ul>
 			<!-- ABC -->
 			<div class="listBetDiv" style="display:block;opacity:1;">
 				<ul  id="resultA">
 					<c:forEach items="${list }" var="list">
 					<li class="clearfix">
 						<p class="timeNumLi">${list.periodsNum }</p>
 						<p class="openNunLi flexP">
 							<span class="active">${list.resultNumOne }</span>
 							<span>${list.resultNumTwo }</span>
 							<span>${list.resultNumThere }</span>
 							<span>${list.resultNumFout}</span>
 							<span class="active">${list.resultNumFive }</span>
 						</p>
 						<p class="resLi">${list.result}</p>
 					</li>
 					</c:forEach>
 				</ul>
 			</div>
 			<!-- 猜数字 -->
 			<div class="listBetDiv">
 				<ul id="CSZ">
 					<c:forEach items="${list }" var="list">
 					<li class="clearfix">
 						<p class="timeNumLi">${list.periodsNum }</p>
 						<p class="openNunLi flexP">
 							<span class="active">${list.resultNumOne }</span>
 							<span class="active">${list.resultNumTwo }</span>
 							<span class="active">${list.resultNumThere }</span>
 							<span class="active">${list.resultNumFout}</span>
 							<span class="active">${list.resultNumFive }</span>
 						</p>
 						<!-- <p class="resLi">1</p> -->
 					</li>
 					</c:forEach>
 				</ul>
 			</div>
 			<!-- 大小单双 -->
 			<div class="listBetDiv">
 				<ul id="DXDS">
 					<c:forEach items="${list }" var="list">
 					<li class="clearfix">
 						<p class="timeNumLi">${list.periodsNum }</p>
 						<p class="openNunLi flexP">
 							<span>${list.resultNumOne }</span>
 							<span>${list.resultNumTwo }</span>
 							<span>${list.resultNumThere }</span>
 							<span>${list.resultNumFout}</span>
 							<span class="active">${list.resultNumFive }</span>
 						</p>
 						<p class="resLi">${list.sAndD}</p>
 					</li>
 					</c:forEach>
 				</ul>
 			</div>
 		</div>
 		<!-- 查看历史记录 -->
 		<a class="showHisBtn" tapmode href="${pageContext.request.contextPath }/lotterts/toOpen.htm" onclick="showBetHistory()">查看历史开奖记录<i class="iconfont icon-shuangjiantou"></i></a>
 		<div class="playWayDiv">
 			<div class="layer_inner" tapmode onclick="closeBetIntro();"></div>
 			<div class="playWayHead">
 				<div class="comTabNav">
			 		<ul class="tabNavUl clearfix">
			 			<c:if test="${type==0 }">
			 				<li id="abcNavLi" class="active">
				 				<p>ABC</p>
				 				<span class="decSpan"></span>
				 			</li>
			 			</c:if>
			 			<c:if test="${type==1 }">
			 				<li class="active tenAbcAct">
				 				<p>ABC</p>
				 				<span class="decSpan"></span>
				 			</li>
			 			</c:if>
			 			<c:if test="${type==0 }">
				 			<li>
				 				<p>猜数字</p>
				 				<span class="decSpan"></span>
				 			</li>
				 			<li>
				 				<p>大小单双</p>
				 			</li>
			 			</c:if>
			 		</ul>
			 	</div>
			 	<div class="noteDiv">
			 		<!-- 投注说明层 -->
				 	<div class="betIntro" tapmode onclick="closeBetIntro();">
				 		<span class="triSpan"></span>
				 		<div id="betIntroTxt"></div>
				 	</div>
			 		<span class="aui-pull-left" style="margin-left: 10px;">下注：</span>
			 		<span class="aui-pull-right" tapmode onclick="showBetIntro();"><i class="iconfont icon-shuoming"></i>投注说明</span>
			 	</div>
 			</div>
 			<div class="playMainPart">
 				<input type="hidden" id="innerPlayWayInp" value="ABC"/>
 				<!-- ABC玩法 -->
				<div class="comPayWayDiv clearfix" style="display: block;opacity: 1;">
					<input type="hidden" id="abcHideInp_radi"/>
					<div class="comABCDiv">
						<label for="aPlayWay_radio">
							<span>A</span>
							<input id="aPlayWay_radio" type="radio" name="tenc_abc_radio" value="A" tapmode onclick="selABCPlay(this);" />
						</label>
						<label for="bPlayWay_radio">
							<span>B</span>
							<input id="bPlayWay_radio" type="radio" name="tenc_abc_radio" value="B" tapmode onclick="selABCPlay(this);"/>
						</label>
						<label for="cPlayWay_radio">
							<span>C</span>
							<input id="cPlayWay_radio" type="radio" name="tenc_abc_radio" value="C" tapmode onclick="selABCPlay(this);"/>
						</label>
					</div>
					<div class="innerBetDiv">
						<div class="txtInpDiv_bigSm">
							<input type="number" id="abcInpTxt" placeholder="请输入下注金额" disabled/>
						</div>
						<a href="javascript:void(0)" class="betBtn innerBtn" tapmode onclick="goBet('abcPlay');">立即投注</a>
					</div>
 				</div>
 				<!-- 猜数字玩法 -->
 				<div class="comPayWayDiv">
 					<div class="innerPlayWay guessPlayWay">
 						<input type="hidden" id="guessHideInp_radi"/>
						<div class="comGuessDiv">
							<label for="gues0Play_radio">
								<span>0</span>
								<input id="gues0Play_radio" value="0" type="radio" class="comGuessInpRad" name="tenc_guess_radio">
							</label>
							<label for="gues1Play_radio">
								<span>1</span>
								<input id="gues1Play_radio" class="comGuessInpRad" value="1" type="radio" name="tenc_guess_radio">
							</label>
							<label for="gues2Play_radio">
								<span>2</span>
								<input id="gues2Play_radio" class="comGuessInpRad" value="2" type="radio" name="tenc_guess_radio">
							</label>
							<label for="gues3Play_radio">
								<span>3</span>
								<input id="gues3Play_radio" class="comGuessInpRad" value="3" type="radio" name="tenc_guess_radio">
							</label>
							<label for="gues4Play_radio">
								<span>4</span>
								<input id="gues4Play_radio" class="comGuessInpRad" value="4" type="radio" name="tenc_guess_radio">
							</label>
						</div>
						<div class="comGuessDiv" style="margin-top: 15px;">
							<label for="gues5Play_radio">
								<span>5</span>
								<input id="gues5Play_radio" class="comGuessInpRad" value="5" type="radio" name="tenc_guess_radio">
							</label>
							<label for="gues6Play_radio">
								<span>6</span>
								<input id="gues6Play_radio" class="comGuessInpRad" value="6" type="radio" name="tenc_guess_radio">
							</label>
							<label for="gues7Play_radio">
								<span>7</span>
								<input id="gues7Play_radio" class="comGuessInpRad" value="7" type="radio" name="tenc_guess_radio">
							</label>
							<label for="gues8Play_radio">
								<span>8</span>
								<input id="gues8Play_radio" class="comGuessInpRad" value="8" type="radio" name="tenc_guess_radio">
							</label>
							<label for="gues9Play_radio">
								<span>9</span>
								<input id="gues9Play_radio" class="comGuessInpRad" value="9" type="radio" name="tenc_guess_radio">
							</label>
						</div>
						<div class="innerBetDiv">
							<div class="txtInpDiv_gues">
								<input id="guessBetInpTxt" disabled type="number" placeholder="请输入下注金额"/>
							</div>
							<a href="javascript:void(0)" tapmode onclick="goBet('guessPlay');" class="betBtn innerBtn">立即投注</a>
						</div>
 					</div>
 				</div>
 				<!-- 大小单双 -->
 				<div class="comPayWayDiv">
 					<div class="innerPlayWay bigSmPlayWay">
 						<input type="hidden" id="bigSmHideInp_radi"/>
						<div class="comBigSmDiv">
							<label for="bigSmBigPlay_radio">
								<span>大</span>
								<input id="bigSmBigPlay_radio" type="radio" name="tenc_bigSm_radio" value="大" tapmode onclick="selBigSmPlay(this);" />
							</label>
							<label for="bigSmSmPlay_radio">
								<span>小</span>
								<input id="bigSmSmPlay_radio" type="radio" name="tenc_bigSm_radio" value="小" tapmode onclick="selBigSmPlay(this);"/>
							</label>
							<label for="bigSmSingPlay_radio">
								<span>单</span>
								<input id="bigSmSingPlay_radio" type="radio" name="tenc_bigSm_radio" value="单" tapmode onclick="selBigSmPlay(this);"/>
							</label>
							<label for="bigSmDobPlay_radio">
								<span>双</span>
								<input id="bigSmDobPlay_radio" type="radio" name="tenc_bigSm_radio" value="双" tapmode onclick="selBigSmPlay(this);"/>
							</label>
						</div>
						<div class="innerBetDiv">
							<div class="txtInpDiv_bigSm">
								<input type="number" id="bigSmBetInpTxt" placeholder="请输入下注金额" disabled/>
							</div>
							<a href="javascript:void(0)" class="betBtn innerBtn" tapmode onclick="goBet('bigSmBet')">立即投注</a>
						</div>
 					</div>
 				</div>
 			</div>
 		</div>
 	</div>
 	<div class="layer" tapmode onclick="closeChange();"></div>
 	<div class="layer_1"></div>
 	<!-- 投注确定信息层 -->
 	<div class="betConfirm">
 		<div class="topTipDiv">提示</div>
 		<div class="confirmCon">
 			<p id="tipInfoP" class="tipInfoP">您当前投注${pNum }期：</p>
 			<p id="nowBetInfo" class="nowBetInfo">
 				<span id="playWays">重庆</span>-【<span id="nowSelPlay"></span>】，<span id="nowBetNum"></span>元
 			</p>
 			<a href="javascript:void(0)" class="cancelBtn" tapmode onclick="cancelBet();">取消</a>
 			<a href="javascript:void(0)" onclick="submitNowSel();" class="sureBtn">确定</a>
 		</div>
 	</div>
 	
 	<!-- 切换彩票玩法 -->
	<div class="changeCaipiao">
		<span class="triSpan_top"></span>
		<label for="chong_change_radio">
			<input id="chong_change_radio" type="radio" value="0" name="changeRadio" tapmode onclick="selPlayWay(this)"/>
			<p>重庆时时彩</p>
		</label>
		<label for="ten_change_radio">
			<input id="ten_change_radio" type="radio" value="1" name="changeRadio" tapmode onclick="selPlayWay(this)" />
			<p>腾讯分分彩</p>
		</label>
	</div>
	
	<jsp:include page="footer.jsp" />
	<input type="hidden" value="${frontUser.userId }" id="currUser" />
	<input type="hidden" value="${lotId }" id="lotterId">
	<input type="hidden" value="${flag }" id="flag">
	<input type="hidden" value="${pNum }" id="periods">
	<input type="text" value="${sealingPlate }" id="sealingPlate">
	<form id="forms" action="${pageContext.request.contextPath }/lotterts/reception.htm" method="post">
		<input type="hidden" name="type" id="CPType" />
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/aui-toast.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/jquery.countdown.js"></script>

	<script type="text/javascript">
		var globalType = '${type}';
		var countDownTime = '${countDownTime}';
		//var countDownTime = '10';
		var perNum = '${pNum}';
		$(function(){
			$("#a1").attr("alltime",countDownTime)
			tbdTimeCountdown({id:"a1",//含有倒计时容器
			  alltime:'alltime',//倒计时总秒数
			  end:function(){//倒计时
				  /*$.ajax({
			            method:'post',
			            url:'${pageContext.request.contextPath }/lotterts/perNum.htm',
			            success:function (data) {
			            	var data = eval("(" + data + ")");
			            	$("#pNums").html("");
			            	$("#pNums").html(data[0]);
			            	countDownTime = data[1];
			            }
			        });*/
			        //alert(perNum);
			        dialog("当前"+perNum+"期投注结束,请注意投注时间");
					setTimeout(function(){
						$("#CPType").val(globalType);
		            	$("#forms").submit();
					},3000);
			        
			  },
			 });
			initGlobalType();
			$(".listBetDiv li:odd").addClass("oddColor");
			changeDiffPlayBet();
			if($(".marquee").length != 0){
				$(".comTabNav").removeClass("noPubRep_nav").addClass("hasPubRep_nav");
				$(".caipiaoDiv").removeClass("noPubRep_caipiao").addClass("hasPubRep_caipiao");
			}
			
			setInterval(function(){
				ajaxsx();
			},180000);
		});
		function betIntroTxt(playIntro){
			var str = "";
 			if(playIntro == "abcIntro"){
 				str = '<strong class="introTit">ABC玩法说明</strong>';
 				str += '<p>开奖结果首位与末位做大小比较:</p>';
 				str += '<p>01、首位>末位为A，赔率1:2,单注限额1-150000；</p>';
 				str += '<p>02、首位&lt;末位为B，赔率1:2,单注限额1-150000；</p>';
 				str += '<p>03、首位=末位为C，赔率1:9,单注限额1-30000；</p>'
 			}else if(playIntro == "guessIntro"){
 				str = '<strong class="introTit">猜数字玩法说明</strong>';
 				str += '<p>开奖结果中任意一位与投注数字相同即为中奖</p>';
 				str += '<p>赔率1:2,单注限额1-150000；</p>';
 			}else if(playIntro == "bigSmIntro"){
 				str = '<strong class="introTit">大小单双玩法说明</strong>';
 				str += '<p>仅判断开奖结果末位数字</p>';
 				str += '<p>5,6,7,8,9为大，赔率1:1.8,单注限额1-150000；</p>';
 				str += '<p>0,1,2,3,4为小，赔率1:1.8,单注限额1-150000；</p>';
 				str += '<p>1,3,5,7,9为单，赔率1:1.8,单注限额1-150000；</p>';
 				str += '<p>0,2,4,6,8为双，赔率1:1.8,单注限额1-150000；</p>';
 			}
			$("#betIntroTxt").html(str);
		}
		function showBetHistory(){
			window.location.href = "${pageContext.request.contextPath }/personal/showBetHistory.htm"
		}
		function tbdTimeCountdown(args){//倒计时函数
			  var ele=document.getElementById(args.id);
			  var alltime=Number(ele.getAttribute(args.alltime));
			  var arr=[];
			 
			  var t=Math.floor(alltime/(24*60*60));
			  var yt=alltime%(24*60*60);
			 
			  var s=Math.floor(yt/(60*60));
			  var ys=yt%(60*60);
			 
			  var f=Math.floor(ys/(60));
			  var yf=ys%(60);
			 
			  var m=yf;
			 
			  arr[0]=[t,"天"];
			  arr[1]=[s,"小时"];
			  arr[2]=[f,"分"];
			  arr[3]=[m,"秒结束"];
			 
			  var s=ce(arr,0);
			 
			  ele.innerHTML=s;
			 
			  var dong;
			 
			  dong=setInterval(function(){
			   alltime-=1;
			   ele.setAttribute(args.alltime,alltime);
			   if(alltime<=0){
			    clearInterval(dong);
			    ele.innerHTML="<span>0</span>秒";
			    args.end();
			   }else{
			    t=Math.floor(alltime/(24*60*60));
			    yt=alltime%(24*60*60);
			 
			    s=Math.floor(yt/(60*60));
			    ys=yt%(60*60);
			 
			    f=Math.floor(ys/(60));
			    yf=ys%(60);
			 
			    m=yf;
			 
			    arr[0]=[t,"天"];
			    arr[1]=[s,"小时"];
			    arr[2]=[f,"分"];
			    arr[3]=[m,"秒结束"];
			 
			    var s=ce(arr,0);
			 
			    ele.innerHTML=s;
			   };      
			  },1000);
			 
			  function ce(arr,sta){
			   var i=sta;
			   if(i<arr.length){
			    if(arr[i][0]!=0){
			     var s="";
			     for(var j=i;j<arr.length;j++){
			      s+="<span>"+arr[j][0]+"</span>"+arr[j][1];
			     };
			     return s;
			    }else{
			     return ce(arr,i+1);
			    };
			   };
			};
		};
		function initGlobalType(){
			$("#nowHidePlayWays").val(globalType);
			if($("#nowHidePlayWays").val() == '0'){//重庆时时彩
				$("#nowPlayWayP").html('重庆时时彩');
			}else{//腾讯分分彩
				$("#nowPlayWayP").html('腾讯分分彩');
			}
			betIntroTxt("abcIntro");
		}
		
		//切换彩票玩法
		function showOtherPlay(){
			$(".layer").show().animate({"opacity":1},200,function(){
				$(".changeCaipiao").show();
			});
		}
		//关闭切换彩票玩法
		function closeChange(){
			$(".changeCaipiao").hide();
			$(".layer").animate({"opacity":0},200,function(){
				$(".layer").hide();
			});
		}
		//选中一项彩票玩法
		function selPlayWay(obj){
			$("#nowHidePlayWays").val($(obj).val());
			$("#nowPlayWayP").html($(obj).siblings().html());
			var globalPlaWay = $("#nowHidePlayWays").val();
			$("#CPType").val(globalPlaWay);
			$("#forms").submit();
			closeChange();
		}
		//投注说明
		function showBetIntro(){
			$(".layer_inner").show().animate({"opacity":1},200,function(){
				$(".betIntro").show().css({"top":30})
			});
		}
		//关闭投注说明
		function closeBetIntro(){
			$(".betIntro").hide();
			$(".layer_inner").animate({"opacity":0},200,function(){
				$(".layer_inner").hide();
			});
		}
		//切换不同类型的投注 ABC 猜数字 大小单双
		function changeDiffPlayBet(){
			$(".tabNavUl li").each(function(i){
				$(this).click(function(){
					$(".tabNavUl li").removeClass("active");
					$(this).addClass("active");
					$(".comPayWayDiv").hide().css({"opacity":0});
					$(".listBetDiv").hide().css({"opacity":0});
					$(".comPayWayDiv").eq(i).show().animate({"opacity":1});
					$(".listBetDiv").eq(i).show().animate({"opacity":1})
					$("#innerPlayWayInp").val($(this).find("p").html());
					if(i == 0){
						$(".resLi").show().css({"width":"15%"});
						$(".openNunLi").css({"width":"50%"});
						$(".comGuessDiv label").removeClass("active");
						$("#guessHideInp_radi").val("");
						$(".txtInpDiv_gues input").attr("disabled",true).val("");

						$(".comBigSmDiv label").removeClass("active");
						$("#bigSmHideInp_radi").val("");
						$(".txtInpDiv_bigSm input").attr("disabled",true).val("");
						betIntroTxt("abcIntro");
					}else if(i == 1){
						$(".resLi").hide().css({"width":0});
						$(".openNunLi").css({"width":"65%"});
						$(".comABCDiv label").removeClass("active");
						$("#abcInpTxt").attr("disabled",true).val("");
						$("#abcHideInp_radi").val("");

						$(".comBigSmDiv label").removeClass("active");
						$("#bigSmHideInp_radi").val("");
						$(".txtInpDiv_bigSm input").attr("disabled",true).val("");
						selGuessNumPlay();
						betIntroTxt("guessIntro");
					}else{
						$(".resLi").show().css({"width":"15%"});
						$(".openNunLi").css({"width":"50%"});
						$(".comABCDiv label").removeClass("active");
						$("#abcInpTxt").attr("disabled",true).val("");
						$("#abcHideInp_radi").val("");

						$(".comBigSmDiv label").removeClass("active");
						$("#guessHideInp_radi").val("");
						$(".txtInpDiv_gues input").attr("disabled",true).val("");
						betIntroTxt("bigSmIntro");
					}
				});
			});
		}
		//ABC玩法
		function selABCPlay(obj){
			$(".comABCDiv label").removeClass("active");
			$(obj).parent().addClass('active');
			$("#abcHideInp_radi").val($(obj).val());
			$("#abcInpTxt").attr("disabled",false);
		}
		//猜数字玩法
		function selGuessNumPlay(){
			$(".comGuessInpRad").each(function(i){
				$(this).click(function(){
					$(".comGuessDiv label").removeClass("active");
					$(this).parent().addClass("active");
					$("#guessHideInp_radi").val($(this).val());
					$("#guessBetInpTxt").attr("disabled",false);
				});
			});
		}
		//大小单双玩法
		function selBigSmPlay(obj){
			$(".comBigSmDiv label").removeClass("active");
			$(obj).parent().addClass('active');
			$("#bigSmHideInp_radi").val($(obj).val());
			$("#bigSmBetInpTxt").attr("disabled",false);
		}
		$(document).on('input propertychange','#aPlayWay_txt',function (e) {
		    if (e.type === "input" || e.orignalEvent.propertyName === "value"){
		        $("#abcHideInp_txt").val(this.value)
		    }
		})
		$(document).on('input propertychange','#bPlayWay_txt',function (e) {
		    if (e.type === "input" || e.orignalEvent.propertyName === "value"){
		        $("#abcHideInp_txt").val(this.value)
		    }
		})
		$(document).on('input propertychange','#cPlayWay_txt',function (e) {
		    if (e.type === "input" || e.orignalEvent.propertyName === "value"){
		        $("#abcHideInp_txt").val(this.value)
		    }
		})
		//abc玩法
		function abcPlay(){
			var abcHideInp_radiVal = $("#abcHideInp_radi").val();
			var abcHideInp_txtVal = $("#abcInpTxt").val();
			if(abcHideInp_radiVal == ""){
				dialog("请选择要下的注");
				return false;
			}else if(abcHideInp_txtVal == ""){
				dialog("请输入下注金额");
				return false;
			}else{
				if(abcHideInp_txtVal < 1){
					dialog("下注金额最低为1元");
					return false;
				}
				if(abcHideInp_radiVal == "A" || abcHideInp_radiVal == "B"){
					if(abcHideInp_txtVal > 150000){
						dialog("下注金额最低为1元最高为15万");
						return false;
					}
				}else if(abcHideInp_radiVal == "C"){
					if(abcHideInp_txtVal > 30000){
						dialog("下注金额最低为1元最高为3万");
						return false;
					}
				}
				$(".layer_1").show().animate({"opacity":1},200,function(){
					$(".betConfirm").show();
					$("#playWays").html($("#nowPlayWayP").html());
					$("#innerPlayWays").html($("#innerPlayWayInp").val());
					$("#nowSelPlay").html($("#abcHideInp_radi").val());
					$("#nowBetNum").html($("#abcInpTxt").val());
				});
			}	
		}
		//猜数字
		function guessPlay(){
			var guessHideInp_radiVal = $("#guessHideInp_radi").val();
			var guessBetInpTxtVal = $("#guessBetInpTxt").val();
			if(guessHideInp_radiVal == ""){
				dialog("请选择要下的注");
				return false;
			}else if(guessBetInpTxtVal == ""){
				dialog("请输入下注金额");
				return false;
			}else{
				if(guessBetInpTxtVal < 1){
					dialog("下注金额最低为1元最高为15万");
					return false;
				}else if(guessBetInpTxtVal > 150000){
					dialog("下注金额最低为1元最高为15万");
					return false;
				}
				$(".layer_1").show().animate({"opacity":1},200,function(){
					$(".betConfirm").show();
					$("#playWays").html($("#nowPlayWayP").html());
					$("#innerPlayWays").html($("#innerPlayWayInp").val());
					$("#nowSelPlay").html($("#guessHideInp_radi").val());
					$("#nowBetNum").html($("#guessBetInpTxt").val());
				});
			}
		}
		//大小单双
		function bigSmBetPlay(){
			var bigSmHideInp_radiVal = $("#bigSmHideInp_radi").val();
			var bigSmBetInpTxtVal = $("#bigSmBetInpTxt").val();
			if(bigSmHideInp_radiVal == ""){
				dialog("请选择要下的注");
				return false;
			}else if(bigSmBetInpTxtVal == ""){
				dialog("请输入下注金额");
				return false;
			}else{
				if(bigSmBetInpTxtVal < 1){
					dialog("下注金额最低为1元最高为15万");
					return false;
				}else if(bigSmBetInpTxtVal > 150000){
					dialog("下注金额最低为1元最高为15万");
					return false;
				}
				$(".layer_1").show().animate({"opacity":1},function(){
					$(".betConfirm").show();
					$("#playWays").html($("#nowPlayWayP").html());
					$("#innerPlayWays").html($("#innerPlayWayInp").val());
					$("#nowSelPlay").html($("#bigSmHideInp_radi").val());
					$("#nowBetNum").html($("#bigSmBetInpTxt").val());
				});
			}
		}
		//立即投注
		function goBet(options){
			var flag = $("#flag").val();
			if(flag==1){
				dialogCb('未登录,是否跳转登陆页面','取消','确定',function(){
					location.href = "${pageContext.request.contextPath }/personal/bindPhoneNums.htm";
				});
				return;
			}
			
			if(globalType==0){
				var flag=true;
				$.ajax({
		            method:'post',
		            url:'${pageContext.request.contextPath }/lotterts/querySealing.htm',
		            success:function (data) {
		            	if(jQuery.parseJSON(data)=="1"){
		            		dialog("重庆已经封盘，不能购买彩票");
		            	}else{
		            		if(options == "abcPlay"){
		            			abcPlay();
		        			}else if(options == "guessPlay"){
		        				guessPlay();
		        			}else{
		        				bigSmBetPlay();
		        			}
		            	}
		            }
		        });
			}else{
				var flag=true;
				$.ajax({
		            method:'post',
		            url:'${pageContext.request.contextPath }/lotterts/querySealingTx.htm',
		            success:function (data) {
		            	if(jQuery.parseJSON(data)=="1"){
		            		dialog("腾讯已经封盘，不能购买彩票");
		            	}else{
		            		if(options == "abcPlay"){
		            			abcPlay();
		        			}else if(options == "guessPlay"){
		        				guessPlay();
		        			}else{
		        				bigSmBetPlay();
		        			}
		            	}
		            }
		        });
			}
			
		}
		//取消下注
		function cancelBet(){
			$(".betConfirm").hide();
			$(".layer_1").animate({"opacity":0},function(){
				$(".layer_1").hide();
			});
		}
		//联系客服
		function goKefu(){
			window.location.href= "${pageContext.request.contextPath }/personal/goShare.htm";
		}
		//分享链接
		function golinks(){
			var flag = $("#flag").val();
			if(flag==1){
				dialogCb('未登录,是否跳转登陆页面','取消','确定',function(){
					location.href = "${pageContext.request.contextPath }/personal/bindPhoneNums.htm";
				});
			}else{
				window.location.href= "${pageContext.request.contextPath }/lotterts/shareMoney.htm";
			}
		}
		function submitNowSel(){
			var lottertId = $("#lotterId").val();//彩票id
			var currUser = $("#currUser").val();//用户id
			var flag = $("#flag").val();//用户id
			var globalPlaWay = $("#nowHidePlayWays").val();
			var playType = $("#innerPlayWayInp").val();
			var periods = $("#periods").val();
			
			if(globalPlaWay == 0){//重庆时时彩
				if(playType == "ABC"){
					var innerPlayWays = $("#innerPlayWayInp").val();//ABC
					var nowSelAct = $("#abcHideInp_radi").val();//A
					var nowBetMoney = $("#abcInpTxt").val();
					$.ajax({
			            method:'post',
			            url:'${pageContext.request.contextPath }/lotrecodes/add.htm',
			            data:{
			            	'userId':currUser,
			            	'lotId':lottertId,
			            	'types':globalPlaWay,
			            	'palyA':nowSelAct,
			            	'money':nowBetMoney
			            	},
			            success:function (data) {
			            	if(data==0){
			            		cancelBet();
			            		dialog("余额不足，请先进行充值");
			            	}else if(data==1){
			            		cancelBet();
			            		 dialogCb('本期已经封盘，自动购买下一期彩票，是否确定？','取消','确定',function(){
			         				$.ajax({
			         		            method:'post',
			         		            url:'${pageContext.request.contextPath }/lotrecodes/addQD.htm',
			         		            data:{
			         		            	'userId':currUser,
			         		            	'lotId':lottertId,
			         		            	'types':globalPlaWay,
			         		            	'palyA':nowSelAct,
			         		            	'money':nowBetMoney,
			         		            	'pNum':periods
			         		            	},
			         		            success:function (data) {
			         		            	dialog("购彩成功");
			         	            		cancelBet();
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
			         			});
			            	}else{
			            		toast("购彩成功","success");
			            		cancelBet();
			            		$.ajax({
			            			 method:'post',
			    			         url:'${pageContext.request.contextPath }/lotterts/ajaxMoney.htm',
			    			         success:function (data) {
			    			             $("#balances").html("");
			    			             $("#balances").html(data);
			    			         }
			            		});
			            	}
			            }
			        });
				}else if(playType == "猜数字"){
					var innerPlayWays = $("#innerPlayWayInp").val();//ABC
					var nowSelAct = $("#guessHideInp_radi").val();//A
					var nowBetMoney = $("#guessBetInpTxt").val();
					$.ajax({
			            method:'post',
			            url:'${pageContext.request.contextPath }/lotrecodes/add.htm',
			            data:{
			            	'userId':currUser,
			            	'lotId':lottertId,
			            	'types':globalPlaWay,
			            	'palyB':nowSelAct,
			            	'money':nowBetMoney
			            	},
			            success:function (data) {
			            	if(data==0){
			            		cancelBet();
			            		dialog("余额不足，请先进行充值");
			            	}else if(data==1){
			            		cancelBet();
			            		 dialogCb('本期已经封盘，自动购买下一期彩票，是否确定？','取消','确定',function(){
			         				$.ajax({
			         		            method:'post',
			         		            url:'${pageContext.request.contextPath }/lotrecodes/addQD.htm',
			         		            data:{
			         		            	'userId':currUser,
			         		            	'lotId':lottertId,
			         		            	'types':globalPlaWay,
			         		            	'palyA':nowSelAct,
			         		            	'money':nowBetMoney,
			         		            	'pNum':periods
			         		            	},
			         		            success:function (data) {
			         		            	dialog("购彩成功");
			         	            		cancelBet();
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
			         			});
			            	}else{
			            		toast("购彩成功","success");
			            		cancelBet();
			            		$.ajax({
			            			 method:'post',
			    			         url:'${pageContext.request.contextPath }/lotterts/ajaxMoney.htm',
			    			         success:function (data) {
			    			             $("#balances").html("");
			    			             $("#balances").html(data);
			    			         }
			            		});
			            	}
			            }
			        });
				}else{//大小单双
					var innerPlayWays = $("#innerPlayWayInp").val();//ABC
					var nowSelAct = $("#bigSmHideInp_radi").val();//A
					var nowBetMoney = $("#bigSmBetInpTxt").val();
					$.ajax({
			            method:'post',
			            url:'${pageContext.request.contextPath }/lotrecodes/add.htm',
			            data:{
			            	'userId':currUser,
			            	'lotId':lottertId,
			            	'types':globalPlaWay,
			            	'palyC':nowSelAct,
			            	'money':nowBetMoney
			            	},
			            success:function (data) {
			            	if(data==0){
			            		cancelBet();
			            		dialog("余额不足，请先进行充值");
			            	}else if(data==1){
			            		cancelBet();
			            		 dialogCb('本期已经封盘，自动购买下一期彩票，是否确定？','取消','确定',function(){
			         				$.ajax({
			         		            method:'post',
			         		            url:'${pageContext.request.contextPath }/lotrecodes/addQD.htm',
			         		            data:{
			         		            	'userId':currUser,
			         		            	'lotId':lottertId,
			         		            	'types':globalPlaWay,
			         		            	'palyA':nowSelAct,
			         		            	'money':nowBetMoney,
			         		            	'pNum':periods
			         		            	},
			         		            success:function (data) {
			         		            	dialog("购彩成功");
			         	            		cancelBet();
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
			         			});
			            	}else{
			            		toast("购彩成功","success");
			            		cancelBet();
			            		$.ajax({
			            			 method:'post',
			    			         url:'${pageContext.request.contextPath }/lotterts/ajaxMoney.htm',
			    			         success:function (data) {
			    			             $("#balances").html("");
			    			             $("#balances").html(data);
			    			         }
			            		});
			            	}
			            }
			        });
				}
			}else{//腾讯
				var innerPlayWays = $("#innerPlayWayInp").val();//ABC
				var nowSelAct = $("#abcHideInp_radi").val();//A
				var nowBetMoney = $("#abcInpTxt").val();
				$.ajax({
		            method:'post',
		            url:'${pageContext.request.contextPath }/lotrecodes/add.htm',
		            data:{
		            	'userId':currUser,
		            	'lotId':lottertId,
		            	'types':globalPlaWay,
		            	'palyD':nowSelAct,
		            	'money':nowBetMoney
		            	},
		            success:function (data) {
		            	if(data==0){
		            		cancelBet();
		            		dialog("余额不足，请先进行充值");
		            	}else if(data==1){
		            		cancelBet();
		            		//dialogCb('本期已经封盘，自动购买下一期彩票，是否确定？','取消','确定',function(){
		            			$.ajax({
		    			            method:'post',
		    			            url:'${pageContext.request.contextPath }/lotrecodes/addQD.htm',
		    			            data:{
		    			            	'userId':currUser,
		    			            	'lotId':lottertId,
		    			            	'types':globalPlaWay,
		    			            	'palyA':nowSelAct,
		    			            	'money':nowBetMoney,
		    			            	'pNum':periods
		    			            	},
		    			            success:function (data) {
		    			            	toast("购彩成功","success");
					            		cancelBet();
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
		            	}else{
		            		toast("购彩成功","success");
		            		cancelBet();
		            		$.ajax({
		            			 method:'post',
		    			         url:'${pageContext.request.contextPath }/lotterts/ajaxMoney.htm',
		    			         success:function (data) {
		    			             $("#balances").html("");
		    			             $("#balances").html(data);
		    			         }
		            		});
		            	}
		            }
		        });
			}
		}
		
	 function ajaxsx(){
		 var innerPlayWays = $("#innerPlayWayInp").val();//ABC
		 $.ajax({
			 method:'post',
	         url:'${pageContext.request.contextPath }/lotterts/autoRefresh.htm',
	         success:function (data) {
	        	 var result = jQuery.parseJSON(data).listDto;
	        	 var str = "";
	        	 $.each(result, function (n, value) {
	        		 $("#balances").html("");
		             $("#balances").html(value.money);
	 					if(innerPlayWays=="ABC"){
	 						 str += "<li class='clearfix'><p class='timeNumLi'>"+value.periodsNum +"</p><p class='openNunLi flexP'>"+
	 	 							"<span class='active'>"+value.resultNumOne +"</span>"+
	 	 							"<span>"+value.resultNumTwo+" </span>"+
	 	 							"<span>"+value.resultNumThere +"</span>"+
	 	 							"<span>"+value.resultNumFout+"</span>"+
	 	 							"<span class='active'>"+value.resultNumFive+" </span></p>"+
	 	 							"<p class='resLi'>"+value.result+"</p></li>";
	 					}else if(innerPlayWays=="大小单双"){
	 						str += "<li class='clearfix'><p class='timeNumLi'>"+value.periodsNum +"</p><p class='openNunLi flexP'>"+
	 							"<span>"+value.resultNumOne +"</span>"+
	 							"<span>"+value.resultNumTwo+" </span>"+
	 							"<span>"+value.resultNumThere +"</span>"+
	 							"<span>"+value.resultNumFout+"</span>"+
	 							"<span class='active'>"+value.resultNumFive+" </span></p>"+
	 							"<p class='resLi'>"+value.sAndD+"</p></li>";
	 					}else if(innerPlayWays=="猜数字"){
	 						str += "<li class='clearfix'><p class='timeNumLi'>"+value.periodsNum +"</p><p class='openNunLi flexP'>"+
 							"<span class='active'>"+value.resultNumOne +"</span>"+
 							"<span class='active'>"+value.resultNumTwo+" </span>"+
 							"<span class='active'>"+value.resultNumThere +"</span>"+
 							"<span class='active'>"+value.resultNumFout+"</span>"+
 							"<span class='active'>"+value.resultNumFive+" </span></p></li>";
	 					}
	        	 });
	        		 $("#resultA").html(str);
	        		 $("#DXDS").html(str);
	        		 $("#CSZ").html(str);
	         }
		});
	}
	</script>
</body>
</html>