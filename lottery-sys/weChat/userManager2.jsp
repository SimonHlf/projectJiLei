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
        <div class="aui-title">用户管理</div>
    </header>
     <div class="comInpBox" style="margin-top: 2.6rem;">
    	
    </div> 
	<!-- listCon -->
	<div class="listPar">
		
		<div id="nextConDiv">
		<p style="color:red">${result }</p>
			<c:forEach items="${list1}" var="list">
				<div class="comListCon">
					<!-- topPart -->
					<input type="hidden" id="superId" value="${list.frontUser.userId }">
					<div class="listTop">
						<h4>账号：${list.frontUser.cellPhone }</h4>
					</div>
					<!-- botPart -->
					
					<div class="listBot clearfix">
						<p>充值总额：${list.cz_moneyo}</p>
						<p>提现总额：${list.cz_moneyt}</p>
						<p>投注金额：${list.cz_moneyts}</p>
						<p>中奖金额：${list.cz_moneyf}</p>
						<p>佣金金额：${list.cz_moneyfs}</p>
					</div>
					<c:if test="${message=='success' }">
					<a class="checkNextBtn" href="javascript:void(0)" onclick="superior()">查看下级</a>
					</c:if>
				</div>
				</c:forEach>
				
		</div>
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
	</div>
	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="../weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/personalCenter.js"></script>
	<script type="text/javascript">
		$(function(){

		});
		function searchMyPeople(){
			var accountInpVal = $("#accountInp").val();
			var id = $("#userId").val();
			if(accountInpVal == ""){
				dialog('请输入您要查询的账号');
				return;
			}else{
				var list="";
				$.ajax({
					        type:'post',
					        url:'searchMyPeople.htm',
					        data:{
					        	cellPhone:accountInpVal
					        },
					        success:function(data){
					        	
					        	var json = eval(data); //数组
							   $("#nextConDiv").css('display','none');	
							   $("#testPers").css('display','block');
							  
							   $.each(json, function (index, item) {  
					                 //循环获取数据    
					                 var cellPhone = json[index].cellPhone;
					                 
					                 $("#fir1").text(data.balance);
					                 
					             });  		
								 
					        },
					        error:function(){
					            alert("网络错误,请稍后再试");
					        }
					    })
			}
		}
	</script>
	<script type="text/javascript">
	//查看下下级
	function superior(){
		 
		window.location.href="${pageContext.request.contextPath }/personal/superior.htm?id="+$("#superId").val();
	}
	 
	</script>
</body>
</html>