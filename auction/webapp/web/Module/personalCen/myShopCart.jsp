<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的购物车</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/myShopCart.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/pagination.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/layer.css"/>
	</head>
	<body>
		<div id="content">
		<%@ include file="../../head.jsp"%>  
		<!-- 个人中心内容 -->
		<div class="personalCenCon clearfix w1100">
		
			<%@ include file="personalHead.jsp"%>  
			
			<div class="rightPersonal fr">
				<strong class="rightTit"><span></span>我的购物车</strong>
				<div class="rightCon">
					<div class="yongjinListNav">
						<ul class="clearfix">
							<li><a href="javascript:queryByType(1)">现金商品</a></li>
							<li><a href="javascript:queryByType(4)">优乐购</a></li>
							<li><a href="javascript:queryByType(3)">积分商品</a></li>
							<li><a href="javascript:queryByType(2)">金币商品</a></li>
						</ul>
					</div>
					<div class="cartConNav">
						<ul>
							<li class="oneCartWid">
								<span>商品信息</span>
							</li>
							<li class="twoCartWid">
								<span>单价</span>
							</li>
							<li class="twoCartWid">
								<span>数量</span>
							</li>
							<li class="twoCartWid">
								<span>金额</span>
							</li>
							<li class="twoCartWid">
								<span>操作</span>
							</li>
						</ul>
					</div>
					<div class="innerCartCon">
						<ul id="listProUl">
					
							<li class="loseEfficacy clearfix" style="display:none">
								<div class="comInnerCart oneCartWid1">
									<span class="loseTag">失效</span>
									<div class="cartThumb">
										<img src="images/cartPro.jpg"/>
									</div>
									<div class="cartProTit">
										<a href="">phon爆膜</a>
									</div>
									<div class="shopImg">
										<a href="">
											<img src="images/shopThumb.jpg"/>
											<span>西藏锦绣</span>
										</a>
									</div>
									<div class="cartCateg"><p>颜色分类：5/5S/SE闪粉【白色】前后</p></div>
								</div>
								<div class="comInnerCart twoCartWid">
									<p class="oldPrice">¥2600</p>
									<p>¥2000</p>
								</div>
								<div class="comInnerCart twoCartWid">
									<div class="buyNum fl">
										<span class="leftSp reduce">-</span>
										<p><input type="text" value="1" disabled></p>
										<span class="rightSp plus">+</span>
									</div>
								</div>
								<div class="comInnerCart twoCartWid">
									<p class="totalPrice">¥2600</p>
								</div>
								<div class="comInnerCart twoCartWid">
									<a class="delOrder" href=""></a>
									<a class="findSame" href="">找相似</a>
								</div>
							</li>
						</ul>
						<div id="Pagination" class="pagination"></div>
						<div class="botPay">
							<label for="selAllInp">
								<input id="selAllInp" type="checkbox" value="" name=""  onclick="sellAllGoods(this)" />
								<span>全选</span>
							</label>
							<a class="botPayDel" href="javascript:delCart(1,1)">删除</a>
							<!-- <a href="javascript:void(0)">清除失效宝贝</a> -->
							<span class="hasSelSpan">已选商品<em id="selNumEm">0</em>件</span>
							<span class="totalSpan">合计（不含运费）：<em id="totalPricEm">0.00</em>元</span>
							<a class="goPayA noSelA" href="javascript:jiesuan()" onclick="Test()">结算</a>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		</div>
	<%@ include file="../../foot.jsp"%>  
		
	<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery.pagination.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/layer.js"></script>	
	<script type="text/javascript">
	var pageSize = '${page.pageSize}';
	var type='${type}';
	var proIdArray = [];
	var proNumArray = [];
	var globalFlag = "false";

	if(type==1){
		$(".yongjinListNav ul li").eq(0).addClass("active");
	}
	if(type==4){
		$(".yongjinListNav ul li").eq(1).addClass("active");
	}
	if(type==2){
		$(".yongjinListNav ul li").eq(3).addClass("active");
	}
	if(type==3){
		$(".yongjinListNav ul li").eq(2).addClass("active");
	}
	
	
	$(function(){
		showPageMBInfo('');
	});
	function Test(id){
		//alert(proNumArray.length + "len")
		for(var i=0;i<proNumArray.length;i++){
			//alert(proNumArray[i])
		}
	}
	function reduceProNum(obj,proId,optionBig){
		var singPri = $("#singPri_" + proId).html();
		var proNum = $("#proNum_" + proId).val();
		commonCalPrice(obj,proId,optionBig);
	}
	function plusProNum(obj,proId,optionBig){
		commonCalPrice(obj,proId,optionBig);
		totalPriceNum = Number($("#totalPricEm").html());
	}
	//商品数量加减公共方法 
	function commonCalPrice(obj,proId,options){
		var num=Number($("#proNum_"+proId).val());
		var singlePri = Number($("#singPri_"+proId).html());
		var checkFalg = $(obj).attr("checkAttr");
		var attrInpFlag = $("#proNum_" + proId).attr("attrCheck");
		if(options == 'reduce'){
			var endNum=num-1;
		}else{
			var endNum=num+1;
		}
		if(options == 'reduce'){
			if(endNum<1){
				endNum=1;	
			}
		}
		$("#proNum_"+proId).val(endNum);
		$("#totalPriSp_"+proId).html((endNum*singlePri).toFixed(2));
		if(attrInpFlag != "false" || globalFlag != "false"){//说明数量可以点击结算总价格改变并且当前商品已经被选中 
			var tmpTotalNum = 0;
			$(".hasSelToalPri").each(function(i){
				tmpTotalNum += Number($(".hasSelToalPri").eq(i).html());
			});
			$("#totalPricEm").html(tmpTotalNum.toFixed(2));
		}
		proNumArray.length = 0;
		$(".hasSelectNum").each(function(i){
			//获取商品数量
			proNumArray.push($(".hasSelectNum").eq(i).val());
		});
	}
	//全选
	function sellAllGoods(obj){
		var checkStatus = $(obj).is(":checked");
		if(!checkStatus){//全部取消
			$("[name='listProInp_money']").attr("checked",false);
			$(".goPayA").removeClass("hasSelA").addClass("noSelA");
			$(".selProNumInp").removeClass("hasSelectNum");
			proIdArray.length = 0;
			proNumArray.length = 0;
			$("#selNumEm").html("0");
			$(".totalPriSp").removeClass("hasSelToalPri");
			$("#totalPricEm").html("0")
		}else{//全选 
			$(".selProNumInp").addClass("hasSelectNum");
			$("[name='listProInp_money']").attr("checked",true);
			$("[name='listProInp_money']").each(function(i){
				//获取商品id
				proIdArray.push($("[name='listProInp_money']").eq(i).val());
			});
			$("[name='listProInp_money']").each(function(i){
				//获取商品数量
				proNumArray.push($("[name='listProNum_money']").eq(i).val());
			});
			$(".goPayA").removeClass("noSelA").addClass("hasSelA");
			$("#selNumEm").html($("[name='listProInp_money']").length);
			$(".totalPriSp").addClass("hasSelToalPri");
			getTotalPrice();
			globalFlag = "true";
			proNumArray.length = 0;
			$(".hasSelectNum").each(function(i){
				console.log($(".hasSelectNum").eq(i).val() + "全选中 ");
				proNumArray.push($(".hasSelectNum").eq(i).val());
			});
			
		}	
		totalPriceNum = Number($("#totalPricEm").html());
	}
	var totalPriceNum = 0;
	function selListPro(obj,proId){
		var checkStatus = $("#proInp_money_"+proId).is(":checked");
		var noCheckedLen = $("[name='listProInp_money']").not(":checked").length;
		var hasCheckedLen = $("[name='listProInp_money']:checked").length;
		var singPri = $("#singPri_" + proId).html();
		var proNum = $("#proNum_" + proId).val();
		var attrInpFlag = $("#proNum_" + proId).attr("attrCheck");
		
		if(!checkStatus){
			if(noCheckedLen == $("[name='listProInp_money']").length){
				$(".goPayA").removeClass("hasSelA").addClass("noSelA");
				$("#selNumEm").html("0");
				proIdArray.length = 0;
				proNumArray.length = 0;
			}else{
				console.log("jinlaile>?")
				$("#selNumEm").html(hasCheckedLen);
				proIdArray.length = 0;
				proNumArray.length = 0;
				$("[name='listProInp_money']:checked").each(function(i){
					proIdArray.push($("[name='listProInp_money']:checked").eq(i).val());
				});
			}
			$("#selAllInp").attr("checked",false);
			$("#proNum_" + proId).removeClass("hasSelectNum");
			$(".hasSelectNum").each(function(i){
				console.log($(".hasSelectNum").eq(i).val() + "取消选中 ");
				proNumArray.push($(".hasSelectNum").eq(i).val());
			});
			$("#totalPriSp_" + proId).removeClass("hasSelToalPri");
			totalPriceNum = totalPriceNum - Number(singPri * proNum);
			globalFlag = "false";
		}else{
			$(".goPayA").removeClass("noSelA").addClass("hasSelA");
			if(hasCheckedLen == $("[name='listProInp_money']").length){
				$("#selAllInp").attr("checked",true);
			}
			$("#selNumEm").html(hasCheckedLen);
			proIdArray.push($(obj).val());
			$("#proNum_" + proId).addClass("hasSelectNum");
			proNumArray.length = 0;
			$(".hasSelectNum").each(function(i){
				proNumArray.push($(".hasSelectNum").eq(i).val());
			});
			$("#totalPriSp_" + proId).addClass("hasSelToalPri");
			totalPriceNum += Number(singPri * proNum);
			console.log(totalPriceNum + "选中后的值")
			globalFlag = "true";
		}
		$("#totalPricEm").html(totalPriceNum.toFixed(2));
	}
	function getTotalPrice(){
		var tmpTotalNum = 0;
		$(".totalPriSp").each(function(i){
			tmpTotalNum += Number($(".totalPriSp").eq(i).html());
		});
		$("#totalPricEm").html(tmpTotalNum.toFixed(2));
		totalPriceNum = tmpTotalNum.toFixed(2);
	}
	//分页用
	function showPageMBInfo(){
		var allCount = '${page.total}';
	    $("#Pagination").pagination(allCount, {
	        callback: pageselectCallback,  //PageCallback() 为翻页调用次函数。
	        prev_text: "上一页",
	        next_text: "下一页 ",
	        items_per_page:pageSize,
	        ellipse_text:"...",
	        num_edge_entries: 1,       //两侧首尾分页条目数
	        num_display_entries: 3   //连续分页主体部分分页条目数
	    });
	}
	//显示出列表数据
	function pageselectCallback(page_index,jq){
		getMBList(page_index+1,pageSize);
	}
	function getMBList(page,pageSize){
		$.ajax({
			type : "post",
			data:{page:page,pageSize:pageSize,type:type},
			url : "${pageContext.request.contextPath }/web/shop/myCartApi/myCartJspPage.htm",
			success : function(html) {
				if(html.trim()==""){
					$("#Pagination").hide();
					$("#listProUl").html("<div class='noDataDiv'><img src='${pageContext.request.contextPath }/web/images/noDataImg.png'/><p>暂无数据</p></div>");
				}else{
					$("#listProUl").html(html);
				}
			}
		});
	}
	//点击不同类型商品
	function queryByType(type){
		
		window.location.href="${pageContext.request.contextPath }/web/shop/myCartApi/toMyCartJsp.htm?type="+type+"&sort=3";
		
	}
	
	
	
	//删除购物车商品
	function delCart(type,id){
		var ids='';
		if(type==0){
			ids=id;
		}else{
			
		}

		$.ajax({
            method: 'post',
            url: "${pageContext.request.contextPath }/web/shop/myCartApi/delCart.htm",
            data: {ids:ids},
            success: function (data) {
            	// data=eval("("+data+")");
               if(data.result=="ok"){
            	   layer.msg('删除成功');
            	   setTimeout('window.location.href = "${pageContext.request.contextPath }/web/shop/myCartApi/toMyCartJsp.htm"',1500); 
               }
               if(data.result=="fail"){
            	   layer.msg('删除失败');
               }
               
                
            },error:function(){
            	layer.msg('操作失败');
            }
        })
	}
	//结算
	function jiesuan(){
		 
		window.location.href="${pageContext.request.contextPath }/web/shop/myCartApi/cartToPay.htm?ids="+proIdArray+"&nums="+proNumArray;
	}
	
	


	function message(username){
		mymsg(username);
	}
	

	function mymsg(str){
		$.ajax({
			type:'post',
			data:"username="+str,
			url:'${pageContext.request.contextPath}/web/tuimsgController/getPersonTuimsg.htm',
			success:function(data){
				$("#content").html(data);	
			},
			error:function(data){
			}
		});			
	}
	
	</script>
	</body>
</html>
