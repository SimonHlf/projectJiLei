<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>我的竞拍提醒</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/myAuctionRemind.css"/>
</head>
<body>
	<!-- 顶部副导航 -->
	<%@ include file="../../head.jsp"%>  
	<!-- 个人中心内容 -->
	<div class="personalCenCon clearfix w1100">
		<%@ include file="personalHead.jsp" %>
		<div class="rightPersonal fr">
			<strong class="rightTit"><span></span>我的竞拍提醒</strong>
			<div class="rightCon">
				<div class="remindWrap">
					<div class="remindNav">
						<ul>
							<li class="remindWid1">拍品</li>
							<li class="remindWid2">当前价格</li>
							<li class="remindWid2">拍品状态</li>
							<li class="remindWid3">截止时间</li>
							<li class="remindWid2">操作</li>
						</ul>
					</div>
					<div class="remindCon">
						<ul>
							<c:forEach items="${listDto }" var="remind">
								<li class="clearfix">
									<div class="innerRemindCon remindWid1">
										<div class="paipinImg">
											<img src="/${remind.images }"/>
										</div>
										<div class="paiPinTit">
											<p><a href="${pageContext.request.contextPath}/web/productInfoWeb/detail.htm?id=${remind.pid}&upId=${remind.setId}&cmd=7">${remind.name }</a></p>
										</div>
									</div>
									<div class="innerRemindCon remindWid2 lineHei">
										<p class="txtCen">当前价格：<span>${remind.offer }</span></p>
									</div>
									<div class="innerRemindCon remindWid2 lineHei">
										<p  class="txtCen"><span>${remind.status }</span></p>
									</div>
									<div class="innerRemindCon remindWid3 lineHei">
										<p  class="txtCen">${remind.endTime }</p>
									</div>
									<div class="innerRemindCon remindWid2 lineHei">
										<p  class="txtCen"><a href="javascript:void(0)" onclick="reminding(${remind.pid },${remind.setId })">删除提醒</a></p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="topFootPart">
			<div class="topDec"></div>
			<div class="tianchongL"></div>
			<div class="tianchongR"></div>
			<div class="leftDec"></div>
			<div class="rightDec"></div>
			<div class="innerTopFoot w1100 clearfix">
				<dl class="comFootDl telDl">
					<dt>
						<span></span>
						<strong>037188888888</strong>	
						<p>Tel:15093397465</p>
					</dt>
					<dd class="margTdd">郑州市台商大厦23楼</dd>
					<dd>客服邮箱：56410674@qq.com</dd>
				</dl>
				<dl class="comFootDl xinshouDl margLOne">
					<dt>
						<span></span>
						<strong>新手指南</strong>	
					</dt>
					<dd class="margTdd"><a href="">用户协议</a></dd>
					<dd><a href="">常见问题</a></dd>
					<dd><a href="">网站购物流程</a></dd>
				</dl>
				<dl class="comFootDl xinshouDl margLTwo">
					<dt>
						<span></span>
						<strong>新手指南</strong>	
					</dt>
					<dd class="margTdd"><a href="">配送收费标准</a></dd>
					<dd><a href="">配送时间</a></dd>
				</dl>
				<dl class="comFootDl xinshouDl margLThree">
					<dt>
						<span></span>
						<strong>关于我们</strong>	
					</dt>
					<dd class="margTdd"><a href="">了解西藏锦绣</a></dd>
					<dd><a href="">联系我们</a></dd>
					<dd><a href="">隐私声明</a></dd>
				</dl>
			</div>
		</div>
		<div class="botFootPart">
			<div class="w1100">
				<p class="paddTp">友情链接：<a href="">西藏锦绣官网</a></p>
				<p>CopyrightR 2009-2018 xizangguanwang,All rights Reserved 中国西藏锦绣有限公司 版权所有</p>
				<p style="margin-top: 15px;">
					<a href="">
						<img src="../../images/shengming.png"/>
					</a>
					<a href="" style="margin-left: 15px;">
						<img src="../../images/shengming1.png"/>
					</a>
				</p>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function reminding(pid,upId){
			$.ajax({
		         method:'post',
		         url:'${pageContext.request.contextPath}/web/productInfoWeb/reminding.htm',
		         data:{upId:upId},
		         success:function (data) {
		        	 if(data==0){
		        		 layer.msg("取消成功");
		        		 location.href="${pageContext.request.contextPath}/web/remind/myRemind.htm?cmd=7";
		        	 }else{
		        		 layer.msg("出现异常，请联系客服");
		        	 }
		         }
		     });
		}
	</script>
</body>
</html>
