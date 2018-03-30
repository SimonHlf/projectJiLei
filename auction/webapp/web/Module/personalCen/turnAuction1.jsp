<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="UTF-8">
		<title>转拍</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/turnAuction.css"/>
		<script src="${pageContext.request.contextPath }/web/js/My97DatePicker/WdatePicker.js"></script> 
	</head>
<body>
	<%@ include file="../../head.jsp"%>  
	<div class="personalCenCon clearfix w1100">
			<%@ include file="personalHead.jsp" %>
			<form id="subform" action="${pageContext.request.contextPath}/web/auctionOrder/save1.htm" method="post">
				<div class="rightPersonal fr">
					<strong class="rightTit"><span></span>我的拍卖&gt;转拍</strong>
					<div class="rightCon">
						<div class="turnWrap">
							<div class="formTurn clearfix">
								<div class="leftTurnImg">
									<img src="/${order.images }"/>
								</div>
								<div class="rightTurnInfo">
									<div class="clearfix">
										<div class="leftProTit fl clearfix">
											<p class="tiitP">${order.name }</p>
											<!-- <div class="auctingTxt fl">
												交易时间<span></span>
											</div> -->
										</div>
										<!-- <div class="setClock fr">
											<a href="javascript:void(0)">
												<img src="../auctionProDetail/images/clock.png">
												<span>设置提醒</span>
											</a>
										</div> -->
									</div>
									<div class="botSetJifen">
										<span style="color: red;margin-left: 80px">提示：价格只能输入数字和小数点，小数点后保留两位小数</span>	
										<div class="comSetJifen">
											<strong>最低积分</strong>
											<input type="text" onkeyup="clearNoNum(this)" name="startPrice" id="startPrice"  />
										</div>
										<div class="comSetJifen margT">
											<strong>最高积分</strong>
											<input type="text" name="hightPrice" id="hightPrice" />
										</div>
										<div class="comSetJifen margT">
											<strong>每次加价幅度</strong>
											<input type="text" name="ladder" id="ladder" />
										</div>
										<div class="comSetJifen margT">
											<strong>保<span class="oneBlank"></span>证<span class="oneBlank"></span>金</strong>
											<input type="text" name="bond" id="bond" />
										</div>
										<div class="comSetJifen margT">
											<strong>开始时间</strong>
											<input type="text" name="startTime" id="startTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" />
										</div>
										<div class="comSetJifen margT">
											<strong>结束时间</strong>
											<input type="text" name="endTime" id="endTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" />
										</div>
										<input type="hidden" name="auctionId" id="auctionId" value="${order.id }">
										<a class="saveBtn" onclick="submits()" href="javascript:void(0)">确定</a>
									</div>
								</div>
							</div>
						<!-- 	<div class="sameRecommend">
								<strong class="recomTit">同场推荐</strong>
								<div class="sameRecomCon">
									<div class="comTri leftTri"></div>
									<div class="comTri rightTri"></div>
									<ul class="clearfix">
										<li>
											<div class="recomImgDiv">
												<img src="images/recommend.jpg"/>
												<p class="proTit">
													<a href="">金玉满堂金玉满堂</a>
												</p>
											</div>
											<p class="nowPrice1">当前价：<span>¥2500</span></p>
										</li>
										<li>
											<div class="recomImgDiv">
												<img src="images/recommend.jpg"/>
												<p class="proTit">
													<a href="">金玉满堂金玉满堂</a>
												</p>
											</div>
											<p class="nowPrice1">当前价：<span>¥2500</span></p>
										</li>
										<li>
											<div class="recomImgDiv">
												<img src="images/recommend.jpg"/>
												<p class="proTit">
													<a href="">金玉满堂金玉满堂</a>
												</p>
											</div>
											<p class="nowPrice1">当前价：<span>¥2500</span></p>
										</li>
									</ul>
								</div>
							</div> -->
						</div>
					</div>
				</div>
			</form>
		</div>
		<%@ include file="../../foot.jsp"%>  
		<script type="text/javascript">
			function submits(){
				var startPrice = $("#startPrice").val();
				var hightPrice = $("#hightPrice").val();
				var ladder = $("#ladder").val();
				var bond = $("#bond").val();
				var startTime = $("#startTime").val();
				var endTime = $("#endTime").val();
				if(startPrice=='' || hightPrice=='' || ladder=='' || bond=='' || startTime=='' || endTime=='') {
					alert('请将数据填写完整');
					return ;
				}
				$("#subform").submit();
			}
			
			function clearNoNum(obj) {  
	        	obj.value = obj.value.replace(/[^\d.]/g,""); //清除"数字"和"."以外的字符  
	            obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字而不是  
	            obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的  
	            obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");  
	            obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'); //只能输入两个小数  
		    }  
		</script>
</body>
</html>