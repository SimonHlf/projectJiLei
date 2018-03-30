<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>优乐购</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/topFootPart.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/comCategory.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/pagination.css"/>
	</head>
	<body>
		<%@ include file="../../head.jsp"%>  
		<!-- 查询条件显示层  -->
		<div class="queryCategDiv w1100">
			<div class="fl">
				<span class="fl">全部结果</span>
				<i class="arrowI fl"></i>
			</div>
			<!-- 通过筛选条件带过来的 -->
			<div class="selQuery fl"></div>
			<!-- 通过导航顶部搜索栏进来时 -->
			<div class="fromSearInp fl" style="display:none;">
				<i class="arrowI fl"></i>
				<strong>"微单相机"</strong>
			</div>
		</div>
		<div class="categoryDiv w1100">
			<dl class="clearfix">
				<input id="categroyInp4" type="hidden"/>
				<dt><span></span>类别</dt>
				<dd>
					<c:forEach items="${categories}" var="c">
						<a href="javascript:void(0)" class="categroyAttr4" value="${c.id}">${c.shopTypeName}</a>
					</c:forEach>	
				</dd>
			</dl>
			<dl class="clearfix">
				<input id="categroyInp1" type="hidden"/>
				<dt><span></span>品牌</dt>
				<dd>
					<c:forEach items="${bandList}" var="band">
						<a href="javascript:void(0)" class="categroyAttr1" value="${band.id}">${band.name}</a>
					</c:forEach>	
				</dd>
			</dl>
			<dl class="clearfix">
				<input id="categroyInp2" type="hidden"/>
				<dt><span></span>克重</dt>
				<dd>
					<a href="javascript:void(0)" class="categroyAttr2" value="0-2">2克以内</a>
					<a href="javascript:void(0)" class="categroyAttr2" value="2.1-3">2.1-3克</a>
					<a href="javascript:void(0)" class="categroyAttr2" value="3.1-5">3.1-5克</a>
					<a href="javascript:void(0)" class="categroyAttr2" value="5.1-7">5.1-7克</a>
					<a href="javascript:void(0)" class="categroyAttr2" value="7.1-10">7.1-10克</a>
					<a href="javascript:void(0)" class="categroyAttr2" value="10.1-15">10.1-15克</a>
					<a href="javascript:void(0)" class="categroyAttr2" value="15-">15克以上</a>
				</dd>
			</dl>
			<dl class="clearfix">
				<input id="categroyInp3" type="hidden"/>
				<dt><span></span>价位区间</dt>
				<dd>
					<a href="javascript:void(0)" class="categroyAttr3" value="0-500">0-500元</a>
					<a href="javascript:void(0)" class="categroyAttr3" value="500-1000">500-1000元</a>
					<a href="javascript:void(0)" class="categroyAttr3" value="1000-1500">1000-1500元</a>
					<a href="javascript:void(0)" class="categroyAttr3" value="1500-2000">1500-2000元</a>
					<a href="javascript:void(0)" class="categroyAttr3" value="2000-">2000元以上</a>
					<!-- <div class="diyPriceDiv">
						<input id="stPrice" type="text" placeholder="¥" />
						<span>-</span>
						<input id="endPrice" type="text" placeholder="¥"/>
						<em class="surePrice">确定</em>
					</div> -->
				</dd>
			</dl>
		</div>
		<!-- 条件查询 -->
		<div class="queryDiv w1100">
			<ul>
				<li class=""><a href="javascript:void(0)" onclick="queryBy('0')">综合</a></li>
				<li><a href="javascript:void(0)">
					<span>价格</span>
					<div class="tirDiv">
						<span class="comTri topTri colTri_top" onclick="queryBy('1')"></span>
						<span class="radiusSpan"></span>
						<span class="comTri botTri colTri_bot" onclick="queryBy('2')"></span>
					</div>
				</a></li>
				<li class="tirDiv"><a href="javascript:void(0)" onclick="queryBy('3')">点击量</a></li>
				<!-- <li><a href="javascript:void(0)">
					<span>折扣</span>
					<div class="tirDiv">
						<span class="comTri topTri colTri_top"></span>
						<span class="radiusSpan"></span>
						<span class="comTri botTri colTri_bot"></span>
					</div>
				</a></li> -->
				<!-- <li>
					<a href="javascript:void(0)">
						<label>
							<input type="checkbox" />
							<span>只看有货商品</span>
						</label>
					</a>
				</li> -->
			</ul>
		</div>
		<!-- 产品list -->
		<div class="listProDiv w1100">
			<ul id="listProUl" class="clearfix">
				
			</ul>
			<div id="Pagination" class="pagination"></div>
		</div>
		<!-- 可能喜欢 -->
		<div class="maybeLike w1100" style="display:none">
			<p class="maybeLikeTit">
				<span>您可能喜欢的宝贝</span>
				<a href="javascript:void(0)">
					<em class="leftTri"></em>
					<span>1</span>/<span>2</span>
					<em class="rightTri"></em>
				</a>
			</p>
			<div class="mayLikeList">
				<ul class="clearfix">
					<li>
						<a href="">
							<div class="maylikeImg">
								<img src="images/mayLike.jpg"/>
							</div>
							<div class="mayLikeTxt">
								<p class="fl ellip">和田玉平安扣吊坠情侣玉坠</p>
								<span class="fr"><em>1.2</em> 折起</span>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div class="maylikeImg">
								<img src="images/mayLike.jpg"/>
							</div>
							<div class="mayLikeTxt">
								<p class="fl ellip">和田玉平安扣吊坠情侣玉坠</p>
								<span class="fr"><em>1.2</em> 折起</span>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div class="maylikeImg">
								<img src="images/mayLike.jpg"/>
							</div>
							<div class="mayLikeTxt">
								<p class="fl ellip">和田玉平安扣吊坠情侣玉坠</p>
								<span class="fr"><em>1.2</em> 折起</span>
							</div>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<%@ include file="../../foot.jsp"%>  
		
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery.pagination.js"></script>
		<script type="text/javascript">
			var pageSize = '${page.pageSize}';
			var totalListNum = '${page.total}';
			var title="";
			
			//筛选条件
			var brandid="${brandid}";
			var brandname="${brandname}";
			var weight="${weight}";
			var weightname='${weightname}';
			var price="${price}";
			var pricename='${pricename}';
			var price_order='${price_order}';
			var cid="${cid}";
			var cname="${cname}";
			var keywords="${keywords}";
			
			if(price_order==0 || price_order==""){
				$(".w1100 ul li").eq(0).addClass("active");
			}
			if(price_order==1 || price_order==2){
				$(".w1100 ul li").eq(1).addClass("active");
			}
			if(price_order==3){
				$(".w1100 ul li").eq(2).addClass("active");
			}
			$(function(){
				showPageMBInfo('');
				console.log('${pageContext.request.contextPath }${url}')
				getCategory("categroyAttr1",'categroyInp1');
				getCategory("categroyAttr2",'categroyInp2');
				getCategory("categroyAttr3",'categroyInp3');
				getCategory("categroyAttr4",'categroyInp4');
				var str="";
				if(cid!=""){
					str+='<a href="javascript:void(0)" value='+ cid +' onclick=removeAttr("categroyAttr4")>'+
					'<span>'+cname+'</span>'+
					'<em></em>'+
					'</a>';
				}
				if(brandname!=""){
					str+='<a href="javascript:void(0)" value='+ brandid +' onclick=removeAttr("categroyAttr1")>'+
					'<span>'+brandname+'</span>'+
					'<em></em>'+
					'</a>';
				}
				if(weight!=""){
					str+='<a href="javascript:void(0)" value='+ weight +' onclick=removeAttr("categroyAttr2")>'+
					'<span>'+weightname+'</span>'+
					'<em></em>'+
					'</a>';
				}
				
				if(price!=""){
					str+='<a href="javascript:void(0)" value='+ price +' onclick=removeAttr("categroyAttr3")>'+
					'<span>'+pricename+'</span>'+
					'<em></em>'+
					'</a>';
				}
				
				
				
				$(".selQuery").append(str);
				$(".queryCategDiv").show();
				if(brandid =="" && weight == "" && price == "" && cid == ""){
					$(".queryCategDiv").hide();
				}
			});
			//删除attr
			function removeAttr(options){
				if(options == 'categroyAttr1'){
					brandid = "";
				}else if(options == 'categroyAttr2'){
					weight = "";
					weightname="";
				}else if(options == 'categroyAttr3'){
					price = "";
					pricename="";
				}else if(options == 'categroyAttr4'){
					cid="";
					cname="";
				}
				window.location.href="${pageContext.request.contextPath }/web/shop/youLeBuyApi/toYouleBuyJsp.htm?brandid="+brandid+"&price="+price+"&weight="+weight+"&weightname="+weightname+"&pricename="+pricename+"&price_order="+price_order+"&cid="+cid+"&cname="+cname+"&keywords="+keywords+"&cmd=2";
			}
			function getCategory(obj,hidInp){
				$("." + obj).each(function(i){
					$(this).click(function(){
						//1:获取属性id 2:获取属性innerText 
						$("#"+hidInp).val($(this).attr("value"));
						/* 执行ajax查询讲参数插入后台 */
						if(obj=="categroyAttr1"){
							brandid=$(this).attr("value");
						}
						if(obj=="categroyAttr2"){
							weight=$(this).attr("value");
							weightname=$(this).html();
						}
						if(obj=="categroyAttr3"){
							price=$(this).attr("value");
							pricename=$(this).html();    
						}
						if(obj=="categroyAttr4"){
							cid=$(this).attr("value");
							cname=$(this).html();    
						}
						
						window.location.href="${pageContext.request.contextPath }/web/shop/youLeBuyApi/toYouleBuyJsp.htm?brandid="+brandid+"&price="+price+"&weight="+weight+"&weightname="+weightname+"&pricename="+pricename+"&price_order="+price_order+"&cid="+cid+"&cname="+cname+"&keywords="+keywords+"&cmd=2";
						//$(".queryCategDiv").show();
					});
				});
			}
			
			function queryBy(str){
				if(str==1){
					price_order=1;
				}
				if(str==2){
					price_order=2;
				}
				if(str==3){
					price_order=3;//按照点击量查询
				}
				if(str==0){
					price_order=0;//按照综合
				}
				window.location.href="${pageContext.request.contextPath }/web/shop/youLeBuyApi/toYouleBuyJsp.htm?brandid="+brandid+"&price="+price+"&weight="+weight+"&weightname="+weightname+"&pricename="+pricename+"&price_order="+price_order+"&cid="+cid+"&cname="+cname+"&keywords="+keywords+"&cmd=2";
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
					data:{page:page,pageSize:pageSize},
					url : "${pageContext.request.contextPath }/web/shop/youLeBuyApi/toYouleBuyPage.htm?brandid="+brandid+"&price="+price+"&weight="+weight+"&weightname="+weightname+"&pricename="+pricename+"&price_order="+price_order+"&cid="+cid+"&cname="+cname+"&keywords="+keywords,
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
			
			//商品详情	
			function proDetail(id){
				 window.location.href="${pageContext.request.contextPath }/web/shop/productDetailApi/toRmbProDetailJsp.htm?pid="+id;
						
			}	
		</script>
	</body>
</html>
