<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
	<title>用户管理</title>
	<link rel="stylesheet" href="../weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_6u90gnv3u6hzd7vi.css"/>
	<link rel="stylesheet" href="../weChat/reception/css/setPassword.css">
	<link rel="stylesheet" href="../weChat/reception/css/footer.css"/>
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
        <div class="aui-title">用户管理</div>
    </header>
    <div class="comInpBox" style="margin-top: 2.6rem;">
    	<ul>
    		<li>
                <div class="txtDiv">
                   	搜寻会员：
                </div>
                <div class="inpDiv">
                    <input id="accountInp" type="text" placeholder="请输入查询账号">
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
					<!-- topPart -->
					<input type="hidden" id="superId" value="${person.frontUser.userId }">
					<div class="listTop">
						<h4>账号：${person.frontUser.cellPhone }</h4>
					</div>
					<!-- botPart -->
					
					<div class="listBot clearfix">
						<p>充值总额：${person.cz_moneyo}</p>
						<p>提现总额：${person.cz_moneyt}</p>
						<p>投注金额：${person.cz_moneyts}</p>
						<p>中奖金额：${person.cz_moneyf}</p>
						<p>佣金金额：${person.cz_moneyfs}</p>
						<%-- <p>总<span class="thirdBlank"></span>盈<span class="thirdBlank"></span>亏：${person.cz_moneymm}</p> --%>
					</div>
					
					<a class="checkNextBtn" href="javascript:void(0)" onclick="superior()">查看下级</a>
				</div>
				</c:forEach>
				
		</div>
		<c:forEach items="${lists}" var="person">
		<div class="comListCon" id="testPers" style="display:none;">
					<!-- topPart -->
					<div class="listTop">
						<h4 id="fir0">账号：查询值</h4>
					</div>
					<!-- botPart -->
					
					<div class="listBot clearfix">
						<p id="fir1">充值总额：查询值</p>
						<p id="fir2">提现总额：查询值</p>
						<p id="fir3">投注金额：查询值</p>
						<p id="fir4">中奖金额：查询值</p>
						<p id="fir5">佣金金额：查询值</p>
						<!-- <p id="fir6">总<span class="thirdBlank"></span>盈<span class="thirdBlank"></span>亏：800.00</p> -->
					</div>
					
					<a class="checkNextBtn" href="javascript:void(0)" onclick="superior()">查看下级</a>
				</div>
				</c:forEach>
	</div>
	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="../weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/personalCenter.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/layer/layer.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/aui-dialog.js"></script>
	<script type="text/javascript">
		$(function(){

		});
		
	</script>
	<script type="text/javascript">
	//查看上下级
	function superior(){
		window.location.href="superior.htm?id="+$("#superId").val();
	}
	
	
	function searchMyPeople(){
		var accountInpVal = $.trim($("#accountInp").val());
		$.ajax({
	        type:'post',
	        url:'searchMyPeople.htm',
	        data:{
	             
	        	cellPhone:accountInpVal
	        },
	        success:function(data){
	        	
	        	var data = eval("(" + data + ")"); 
	        	
	        	if(data.result == 'success'){
	        		
	        		$("#nextConDiv").css('display','none');	
					$("#testPers").css('display','block');
					$("#fir0").text("账号:"+data.result0);
		        	$("#fir1").text("充值总额："+data.person.cz_moneyo);
		        	$("#fir2").text("体现总额"+data.person.cz_moneyt);
		        	$("#fir3").text("投注总额:"+data.person.cz_moneyts);
		        	$("#fir4").text("中奖总额:"+data.person.cz_moneyf);
		        	$("#fir5").text("佣金总额:"+data.person.cz_moneyfs);
	        		
	        	}else{
	        		dialog("没有该下级!");
	        	}
	        	
	        },
	        error:function(){
	        	dialog("网络错误,请稍后再试");
	        }
	    })
		
	}
	 
	</script>
</body>
</html>