<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>${product.name}商品详情</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/productDetail/css/productDetail.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/location.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/pagination.css"/>
	</head>
	<body>
		<%@ include file="../../head.jsp"%>  
		
		<div class="proDetailCon w1100">
			<!-- 面包屑 -->
			<!-- <p class="smNavP"><a href="">首页</a>&gt;<a href="">官方推荐</a>&gt;<a href="">竞拍</a>&gt;<a href="">红色石榴石</a></p> -->
			<div class="detialPro clearfix">
				<!-- 左侧产品图 -->
				<div class="leftProImg">
					<div id="preview" class="spec-preview"> 
						<span class="jqzoom">
							<input type="hidden" name="id" id="pid" value="${product.id}">
							<input type="hidden" name="sttr1" id="attr1" value="${product.attr1}">
							<img jqimg="" src="/${firstImg}" alt="">
						</span> 
					</div>
					<!-- 缩略图 -->
					<div class="spec-scroll"> 
						<a class="prev">&lt;</a> 
						<a class="next">&gt;</a>
				      	<div class="items">
				      		<ul>
					      		<c:forEach var="n" items="${ImgLunbos}">
				      				<li><img bimg="/${n.picture}" src="/${n.attr0}" onmousemove="preview(this);"></li>
	      						</c:forEach>	
				      		</ul>
				      	</div>
				    </div>
				    <div class="favPro">
				    	<!-- <p>商品编码：10020127953213</p> -->
				    </div>
				</div>
				<!-- 产品名称以及属性类别 -->
				<div class="rightProInfo">
					<div class="topRightPro">
						<h2 class="productName">${product.name}</h2>
						<p class="proIntro">${product.briefly}</p>
						
						<c:if test="${product.type==1 || product.type==4}">
							<p class="prodPrice">
								<span class="priceDec">¥</span>
								<span class="priceSpan" id="proPrice">${product.price}<!-- <em class="discrot">4折</em> --></span>
								<span class="oldPricSP">¥${product.marketprice}</span>
							</p>
						</c:if>
						<c:if test="${product.type==2}">
							<p class="prodPrice">
								<span class="priceDec"></span>
								<span class="priceSpan" id="proPrice">${product.price}<!-- <em class="discrot">4折</em> --></span>
								<span class="priceSpan">金币</span>
								<span class="oldPricSP">${product.marketprice}金币</span>
							</p>
						</c:if>
						<c:if test="${product.type==3}">
							<p class="prodPrice">
								<span class="priceDec"></span>
								<span class="priceSpan" id="proPrice">${product.price}<!-- <em class="discrot">4折</em> --></span>
								<span class="priceSpan">积分</span>
								<span class="oldPricSP">${product.marketprice}积分</span>
							</p>
						</c:if>
						<!-- <p class="discortInfo">
							<span class="disDecSp">折扣</span>
							<span>购物既享受八折，满两件即享七折(您的特价优惠)</span>
						</p> -->
						<!-- <div class="proProperty">
							<div class="clearfix">
								<span class="propertyTit fl">配送</span>
								<div class="dd fl clearfix">
									<div id="store-selector">
										<div class="text"><div></div><b></b></div>                   
										<div onclick="$('#store-selector').removeClass('hover')" class="close"></div>
									</div>store-selector end
									<div id="store-prompt"><strong></strong></div>store-prompt end-
								</div>
							</div>
						</div> -->
						<div class="comPorperty clearfix">
							<span class="propertyTit1 fl">运费</span>
							<p class="fl">
								<span>¥<b>${product.trans}</b></span>
								<!-- <span>(单笔满288免邮费)</span> -->
							</p>
						</div>
						<c:if test="${product.attr1 != '0'}">
							<c:forEach items="${maplist}" var="n">
								<input class="categIdInp" type="hidden" value="${n.attr.id}"/>
								<div class="comPorperty paddR clearfix">
									<span class="propertyTit2 fl">${n.attr.attrName}</span>
									<div class="xinghao">
										<input type="hidden" class="comCategInp"/>
										<c:forEach items="${n.values}" var="v">
											<label for="">
												<span>${v.valueName}</span>
												<input type="radio" class="xinghaoRad" onclick="getAttrValue(this,${n.attr.id})" value="${v.id}"/>
											</label>
										</c:forEach>  
									</div>
								</div>
							</c:forEach>
						</c:if>
						<div class="comPorperty clearfix">
							<span class="propertyTit1 fl">数量</span>
							<div class="buyNum fl">
								<span class="leftSp reduce" id="reduceNum">-</span>
								<p><input id="proNum" type="number" value="1"  onblur="checkProNum(this)" onkeyup="checkProNum(this)" onkeydown="checkProNum(this)"/></p>
								<span class="rightSp plus" id="plusNum">+</span>
							</div>
						</div>
						<div class="btnWrap">
							<div class="goBuyBtn fl">
								<button id="goBuyButton" onclick="goBuy()">立即购买</button>
							</div>
							<div class="paimaiBtn fl">
								<span class="paiMaiIcon"></span>
								<button onclick="addCart(${product.id})">加入购物车</button>
							</div>
						</div>
						<!-- <p class="memberP">您是 <span>铁牌</span> 会员，购买最多可获得 <span>1988</span> 个积分(会员等级越高兑换礼品不同)</p> -->
					</div>
					<p class="serveP"><span>服务</span><!-- 该商品支持换货，订单签收7天内可申请换货 --></p>
					<ul class="serveUl">
						<li>
							<span class="comServIcon zhengpinIcon"></span>
							<span>100%正品</span>
							<span class="lineSpan"></span>
						</li>
						<li>
							<span class="comServIcon qitianIcon"></span>
							<span>7天无理由放心退</span>
							<span class="lineSpan rightSpec"></span>
						</li>
						<li>
							<span class="comServIcon tuihuanIcon"></span>
							<span>支持退换货</span>
						</li>
					</ul>
				</div>
			</div>
			<!-- 商品介绍 规格包装 售后保障 -->
			<div class="details clearfix">
				<div class="detailTabNav posRel">
					<ul>
						<li class="active">商品介绍</li>
						<!-- <li>规格与包装</li> -->
						<li>累计评价 <span>${count}</span></li>
						<!-- <li>售后保障</li> -->
					</ul>
					<a class="smBuyBtn" href="javascript:void(0)">立即购买</a>
				</div>
				<!-- 商品介绍 -->
				<div class="detailsCon" style="display: block;">
					<p class="introTxtPro">品牌：<span>${brand.name}</span></p>
					<ul class="proInfoUl clearfix">
						<li>商品名称：${product.name}</li>
						<!-- <li>商品编号：1025871312</li> -->
						<li>商品毛重：${product.weight}${product.unit}</li>
						<li>商品产地：${region.regionname}</li>
						<!-- <li>商品货号：DH210879413171</li> -->
						<!-- <li>商品证书：其他</li>
						<li>用途：生日礼物</li>
						<li>图案造型：其他</li> -->
						<!-- <li>商品材质：和田玉</li> -->
						<!-- <li>适用人群：情侣</li> -->
					</ul>
					<c:forEach items="${Imgdetails}" var="img">
					<div class="proImgCon">
						<img src="/${img.picture}"/>
					</div>
					</c:forEach>
				</div>
				<!-- 规格与吧包装 -->
				<!-- <div class="detailsCon">
					规格与包装
				</div> -->
				<!-- 累计评价 -->
				<div class="detailsCon" id="commentPro">
					<!-- proTag -->
					<div class="tagDiv clearfix">
						<div class="leftTagTit">
							<p>与描述相符</p>
							<strong>${fenshu}</strong>分
						</div>
						<div class="rightTagList">
							<ul id="evaTag">
								<c:forEach items="${taglist}" var="tag">
									<li >
										<label onclick="queryByTag(${tag.id})">
											<input type="radio" name="commentTag" />
											<span id="tag_${tag.id}">${tag.tagName}
											<c:if test="${tag.num==null}">(0)</c:if>
											<c:if test="${tag.num!=null}">(${tag.num})</c:if>
											</span>
										</label>
									</li>
								</c:forEach>	
								
							</ul>
						</div>
					</div>
					<!-- 评论主要内容 -->
					<div class="mainComment">
						<table class="commentTab" cellpadding="0" cellspacing="0" id="listProUl" >
							
						</table>
						<div id="Pagination" class="pagination"></div>
					</div>
				</div>
				<!-- 售后保障 -->
				<!-- <div class="detailsCon">
					售后保障
				</div> -->
			</div>
		</div>
		<%@ include file="../../foot.jsp"%>  
		<script src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/web/js/jquery.jqzoom.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/web/js/base.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/web/js/location.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery.pagination.js"></script>
		<script type="text/javascript">
		var pageSize = '${page.pageSize}';
			var pavId='';
			$(function(){
				switchTabPro();
				showPageMBInfo();
			})
			
			function switchTabPro(){
				$(".detailTabNav li").each(function(i){
					$(this).click(function(){
						$(".detailsCon").hide();
						$(this).addClass("active").siblings().removeClass("active");
						$(".detailsCon").eq(i).show();
					});
				});
				getCategId();
			}
			function showBigImg(obj){
				var bigSrc = $(obj).attr("data-src");
				$(obj).addClass("active").siblings().removeClass("active");
				$("#proImg1").show();
				$("#bigPreviewImg1").attr("src",bigSrc)
				/*$("img").load(function(){
				    $("div").text("图像已加载");
				});*/
			}
			function closeBigImg(parId){
				$("#" + parId).hide().find("img").attr("src","");
				$("#proImgUl1").find("li").removeClass("active");
			}
			function getAttrValue(obj,attrId){
				$(obj).parent().addClass("active").siblings().removeClass("active");
				$("#xinghaoInp_" + attrId).val($(obj).val());
				var valueIds = "-1";//所选规格id
				$(".comCategInp").each(function(i){
					if($(".comCategInp").eq(i).val()==''){
						
					}else{
						valueIds=valueIds+","+$(".comCategInp").eq(i).val();
					}
				});
				
				 $.ajax({
				        method:'post',
				        url:'${pageContext.request.contextPath }/web/shop/productDetailApi/queryAttr.htm',
				        data:{valueIds:valueIds},
				        success:function (data) {
				            // data=eval("("+data+")");
				            if(data.result=="ok"){
				            	$("#proPrice").html(data.pav.parentPrice);
				            	pavId=data.pav.id;
				            }
				            if(data.result=="fail"){
				            	//alert(data.msg)
				            }
				        }
				    });
				
			}
			function getCategId(){
				$(".categIdInp").each(function(i){
					$(".comCategInp").eq(i).attr("id","xinghaoInp_" + $(".categIdInp").eq(i).val())
				});	
			}
			$(window).scroll(function(){
				var scrollTop = $(window).scrollTop();
				if(scrollTop >= 787){
					$(".detailTabNav ").removeClass("posRel").addClass('posFixed');
					$(".smBuyBtn").show();
				}else{
					$(".detailTabNav ").removeClass("posFixed").addClass('posRel');
					$(".smBuyBtn").hide();
				}
			});

			$("#reduceNum").click(function(){
				var num=Number($("#proNum").val());
				var endNum=num-1;
				if(endNum<1){
					endNum=1	
				}
				$("#proNum").val(endNum);
			});	
			$("#plusNum").click(function(){
				var num = Number($("#proNum").val());
				var endNum=num+1;
				$("#proNum").val(endNum);
			});	
			function checkProNum(obj){
				var num=$(obj).val();
				if(num<1){
					$(obj).val(1);
				}
			}
			function goBuy(){
				var valueIds = "-1";//所选规格id
				var selFlag = true;
				var num=$("#proNum").val();
				var pid=$("#pid").val();
				var attr1=$("#attr1").val();
				if(attr1!="0"){
					$(".comCategInp").each(function(i){
						if($(".comCategInp").eq(i).val()==''){
							selFlag = false;
						}else{
							selFlag = true;
							valueIds=valueIds+","+$(".comCategInp").eq(i).val();
						}
					});
					if(selFlag == false){
						alert("请选择规格");
						return;
					}
				}
				
				window.location.href="${pageContext.request.contextPath }/web/shop/orderApi/toCreateOrder.htm?pid="+pid+"&num="+num+"&valueIds="+valueIds;	
					
			}	
			
			
		function addCart(id){
			var attr1=$("#attr1").val();
			var valueIds = "-1";//所选规格id
			var selFlag = true;
			if(attr1!="0"){
				$(".comCategInp").each(function(i){
					if($(".comCategInp").eq(i).val()==''){
						selFlag = false;
					}else{
						selFlag = true;
						valueIds=valueIds+","+$(".comCategInp").eq(i).val();
					}
				});
				if(selFlag == false){
					alert("请选择规格");
					return;
				}
			}
			
			var nums=$("#proNum").val();
			 $.ajax({
			        method:'post',
			        url:'${pageContext.request.contextPath }/web/shop/productDetailApi/addCart.htm',
			        data:{productid:id,nums:nums,pavId:pavId},
			        success:function (data) {
			            // data=eval("("+data+")");
			            if(data.result=="ok"){
			            	alert(data.msg)
			            }
			            if(data.result=="fail"){
			            	alert(data.msg)
			            }
			        }
			    });
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
			var pid=$("#pid").val();
			$.ajax({
				type : "post",
				data:{page:page,pageSize:pageSize,pid:pid},
				url : "${pageContext.request.contextPath }/web/shop/productDetailApi/commentPage.htm",
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
		//点击评价标签
		function queryByTag(tagId){
			var pid=$("#pid").val();
			$.ajax({
				type : "post",
				data:{tagId:tagId,pid:pid},
				url : "${pageContext.request.contextPath }/web/shop/productDetailApi/commentTagPage.htm",
				success : function(html) {
				//alert(html)
				//console.log(html)
				$("#commentPro").html(html);
				showPageMBInfo1();
				
				
				
				}
			});
			
			
		}
		
		
		
		</script>
	</body>
</html>
