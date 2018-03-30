<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- 顶部副导航 -->
		<div class="topSmNav">
			<div class="innerSmNav w1100">
				<p class="helloTxt fl">您好，欢迎来到西藏锦绣!</p>
				<c:if test="${sessionScope.userInfo == null }">
				<div class="regLogin fr">
					<a class="loginBtn" href="javascript:void(0)" onclick="qudenglu()">登录</a>
					<a href="javascript:void(0)" onclick="quregister()">注册</a>
				</div>
				</c:if>
				<!-- 登录进去后的个人信息 -->
				<c:if test="${sessionScope.userInfo != null }">
				<div class="perInfo fr">
					<span>${sessionScope.userInfo.useraccount }</span>
					<a href="${pageContext.request.contextPath }/web/shop/userCenterApi/toUserCenterJsp.htm?sort=0">会员中心</a>
					<a class="cartBtn" href="${pageContext.request.contextPath }/web/shop/myCartApi/toMyCartJsp.htm?type=1&sort=3">购物车</a>
					<a href="${pageContext.request.contextPath }/web/shop/orderApi/myOrderList.htm?sort=2">我的订单</a>
					<a class="exitBtn" href="javascript:void(0)" onclick="onlogout()">退出</a>
				</div>
				</c:if>
			</div>
		</div>
		<!-- 搜索部分 -->
		<div class="searchPart w1100">
			<div class="fl">
				<img class="logo" src="${pageContext.request.contextPath }/web/images/logo.png" alt="玉商通竞拍" width='106' height='106'/>
				<!-- <a class="locationA" href="javascript:void(0)"></a> -->
				<img class="logoTxt" src="${pageContext.request.contextPath }/web/images/logoTxt .png" alt="近在咫尺的西藏锦绣"/>
			</div>
			<div class="innerSearch fr">
				<div class="topSearch clearfix">
					<div class="inpTxtPart fl">
						<span class="iconSear fl"></span>
						<input type="text fl" id="hot_name" class="searInp" placeholder="请输入您要搜索商品的名字"/>
					</div>
					<a class="buttonPart fl" href="javascript:searchHot()">搜索</a>
				</div>
				<div class="hotSearch">
					<span>热门搜索：</span>
					<div id="hot_search"></div> 
					
				</div>
			</div>
		</div>
		<!-- 导航部分 -->
		<div class="navPart">
			<div class="innerNav w1100">
				<p><a href="${pageContext.request.contextPath}/web/shop/indexApi/toIndexJsp.htm?cmd=0">首页</a></p>
				<p><a href="${pageContext.request.contextPath}/web/shop/categoryApi/toCategoryJsp.htm?cmd=1">商品类别</a></p>
				<p><a href="${pageContext.request.contextPath}/web/shop/youLeBuyApi/toYouleBuyJsp.htm?cmd=2">优乐购</a></p>
				<p><a href="${pageContext.request.contextPath}/web/shop/jiFenBuyApi/toJifenJsp.htm?cmd=3">积分专区</a></p>
				<p><a href="${pageContext.request.contextPath}/web/productInfoWeb/list.htm?cmd=4">竞拍专区</a></p>
				<p><a href="${pageContext.request.contextPath}/web/shop/metaInfoController/metaList.htm?cmd=5">文化荟萃</a></p>
				<p><a href="${pageContext.request.contextPath}/web/aboutUs/list.htm?cmd=6">关于我们</a></p>
				<c:if test="${index == 'index' }">
					<!-- 分类式导航栏 -->
			        <div class="catagNav">
			            <div class="detailNavLeft">
			                <ul>
			                    <c:forEach items="${categories}" var="cate">
			                        <li data-id="${cate.id}">
			                            <strong><a href="">${cate.shopTypeName}</a></strong>
					                    <a href="javascript:queryPro('${cate.id}',1)" value="${cate.id}">${cate.description}</a>
			                        </li>
			                    </c:forEach>
			                </ul>
			            </div>
			            <div class="js-nav hide">
			
			                <c:forEach items="${maplist}" var="c">
			                    <div class="jsDetailNav hide" data-id="${c.cate1.id}">
			                        <dl>
			                            <dt><a href="">${c.cate1.shopTypeName}
			
			</a>&gt;</dt>
					                            <dd>
					                                <c:forEach items="${c.categories2}" 
			
			var="c2">
			                                    <a href="javascript:queryPro
			
			('${c2.id}',2)" value="${c2.id}">${c2.shopTypeName}</a>
			                                </c:forEach>
			                            </dd>
			                        </dl>
			                    </div>
			                </c:forEach>
			            </div>
			        </div>
				</c:if>
			</div>
		</div>
	<script src="${pageContext.request.contextPath}/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>	
	<script type="text/javascript">	
		var cmd = '${param.cmd}';
		$(function(){
			if(cmd=='') cmd = '20';
			$($(".innerNav p")[parseInt(cmd)]).addClass("active");
			//加载热门搜索
			$.ajax({
		        method:'post',
		        url:'${pageContext.request.contextPath}/web/shop/indexApi/hotSearch.htm',
		        success:function (data) {
		        	var str="";
		           for(var i=0;i<data.length;i++){
		        	   str+='<a href="javascript:queryHot(\''+data[i].name+'\')">'+data[i].name+'</a>';
		           }
		            $("#hot_search").append(str);
		        }
		    })
			
		})
		 //点击热门搜索
	    function queryHot(name){
			window.location.href="${pageContext.request.contextPath}/web/shop/categoryApi/toCategoryJsp.htm?keywords="+name+"&cmd=1";
		}
	    //搜索框
		function searchHot(){
			var name=$("#hot_name").val();
			window.location.href="${pageContext.request.contextPath}/web/shop/categoryApi/toCategoryJsp.htm?keywords="+name+"&cmd=1";
		}
		//到登录页
		function qudenglu(){
            var requri = encodeURI(window.location.href);
			window.location.href="${pageContext.request.contextPath}/web/shop/userLoginApi/getLoginJsp.htm?requri=" + requri;
		}
		//到注册页
		function quregister(){
			window.location.href="${pageContext.request.contextPath}/web/shop/userLoginApi/getRegistJsp.htm";
		}
		
		//退出登录
		function onlogout(){
			window.location.href="${pageContext.request.contextPath}/web/shop/userLoginApi/logoutUser.htm";
		}
		
	</script>