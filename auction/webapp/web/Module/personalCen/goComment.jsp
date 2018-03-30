<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的评价</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/goComment.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/layer.css"/>
	</head>
	<body>
		<!-- 顶部副导航 -->
		<%@ include file="../../head.jsp"%> 
		<div class="commentCon w1100">
			<div class="commentNav">
				<ul>
					<li class="commentWid1">商品</li>
					<li class="commentWid2">商品属性</li>
					<li class="commentWid2">单价</li>
					<li class="commentWid2">数量</li>
				</ul>
			</div>
			<div class="commentDetail">
				<ul>
					<c:forEach items="${list}" var="order">
						<li class="clearfix">
							<div class="comInnerCon commentWid3 detailCon">
								<div class="thumbnailImg">
										<img src="/${order.thumbnailUrl}">
									</div>
								<div class="topProDetail">
									<a href="">${order.productName}</a>
								</div>
							</div>
							<div class="comInnerCon commentWid2 paddT">${order.specComment}</div>
							<c:if test="${order.type == 1 || order.type==4}">
								<div class="comInnerCon commentWid2 paddT">单价：¥${order.buyPrice}</div>
							</c:if>
							<c:if test="${order.type == 2}">
								<div class="comInnerCon commentWid2 paddT">单价：${order.buyPrice}积分</div>
							</c:if>
							<c:if test="${order.type == 3}">
								<div class="comInnerCon commentWid2 paddT">单价：${order.buyPrice}金币</div>
							</c:if>
							<div class="comInnerCon commentWid2 paddT">${order.number}</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="tagDiv clearfix">
				<div class="leftTagTit">
					<p>与描述相符</p>
					<strong>${fenshu}</strong>
					分
				</div>
				<div class="rightTagList">
					<ul id="tag_list">
						<c:forEach items="${tags}" var="t">
							<li>
								<label>
									<input type="checkbox" name="commentTag"  value="${t.id}"/>
									<span>${t.tagName}</span>
								</label>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="writeComment">
				<strong class="tits">其他买家，需要你的建议哦！</strong>
				<div class="clearfix margT">
					<div class="leftWrite">
					<form id="addForm">
					<input type="hidden" name="ordernum" value="${orderNum}">
					<input type="hidden" name="productid" value="${productId}">
						<div class="commentGoods">
							<span>评价商品</span>
							<textarea name="content" id="content" placeholder="请输入商品评价，最多300个字" maxlength="300"></textarea>
						</div>
						<div class="upCommentImg">
							<span>晒图片</span>
							<div id="upImgDiv" class="upImgDiv">
								<!-- div class="itemImg">
									<img src="images/refundImg.jpg"/>
									<a href="javascript:void(0)" title="删除图片"></a>
								</div -->
								<input type="file" id="upLoadImgInp" name="pictures" multiple style="display:none;"/>
								<a id="addBtn" class="upBtn" href="javascript:void(0)" onclick="selectImg()"></a>
								<p style="display:none;"><em id="nowNumSp" style="font-style:normal;">0</em>/6</p>
							</div>
						</div>
					</form>
					</div>
					<div class="rightStar">
						<div id="scoreStar" class="judgeBox clearfix">
			    			<p class="fl"><span>*</span>评分：</p>
			    			<input type="hidden" id="descScore"/>
			    			<ul class="clearfix fl">
			    				<li data-title="1分失望"></li>
			    				<li data-title="2分不满"></li>
			    				<li data-title="3分一般"></li>
			    				<li data-title="4分满意"></li>
			    				<li data-title="5分惊喜"></li>
			    			</ul>
			    			<span id="scoreTxt_desc" class="scoreTxt"></span>
			    		</div>
			    	<!-- 	<div id="scoreStar_seller" class="judgeBox clearfix">
			    			<input type="hidden" id="sellerScore" />
			    			<p class="fl"><span>*</span>卖家服务：</p>
			    			<div class="clearfix fl">
			    				<li data-title="1分失望"></li>
			    				<li data-title="2分不满"></li>
			    				<li data-title="3分一般"></li>
			    				<li data-title="4分满意"></li>
			    				<li data-title="5分惊喜"></li>
			    			</div>
			    			<span id="scoreTxt_seller" class="scoreTxt"></span>
			    		</div>
			    		<div id="scoreStar_trade" class="judgeBox clearfix">
			    			<input type="hidden" id="tradeScore" />
			    			<p class="fl"><span>*</span>物流服务：</p>
			    			<ul class="clearfix fl">
			    				<li data-title="1分失望"></li>
			    				<li data-title="2分不满"></li>
			    				<li data-title="3分一般"></li>
			    				<li data-title="4分满意"></li>
			    				<li data-title="5分惊喜"></li>
			    			</ul>
			    			<span id="scoreTxt_trade" class="scoreTxt"></span>
			    		</div> -->
					</div>
				</div>
				<div class="subDiv">
					<label for="anonymousInp">
						<input id="anonymousInp" type="checkbox" checked/>
						<span>匿名评价</span>
					</label>
					<input type="button" name="submitBtn" value="提交" onclick="submitComment()" />
				</div>
			</div>
		</div>
		<%@ include file="../../foot.jsp"%>  
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/layer.js"></script>
		<script type="text/javascript">
			//长传图片的数量
			var upImgNum = 0;
			var firstFlag = true;
			$(function(){
				judgeByStar('scoreStar','scoreTxt_desc','descScore','descOpt');
				//judgeByStar('scoreStar_seller','scoreTxt_seller','sellerScore','sellOpt');
				//judgeByStar('scoreStar_trade','scoreTxt_trade','tradeScore','tradeOpt');
			}); 
		    //处理input选择的图片
		    function handleFileSelect(evt) {
		        var files = evt.target.files;
		        var addBtn = document.getElementById("addBtn");
		        console.log(files);
		        upImgNum += files.length;
		        $("#nowNumSp").html(upImgNum);
		        for(var i=0, f; f=files[i];i++){
		            // 过滤掉非图片类型文件
		            if(!f.type.match('image.*')){
		            	continue;
		            }
		            // 过滤掉重复上传的图片
		            var tip = false;
		           /* for(var j=0; j<(ele.files).length; j++){
						console.log((ele.files)[j].name)
		                if((ele.files)[j].name == f.name){
		                    tip = true;
		                    break;
		                }
		            }*/
		           // if(!tip){
		                // 图片文件绑定到容器元素上
		                //ele.files.push(f);
						//console.log( ele.files.length)
		                var reader = new FileReader();
		                reader.onload = (function (theFile) {
		                    return function (e) {
		                        var oDiv = document.createElement('div');
		                        oDiv.className = 'itemImg img-item';
		                        // 向图片容器里添加元素
		                        oDiv.innerHTML = '<img src="'+e.target.result+'" />'+
		                                        '<a href="javscript:;" class="img-remove"></a>'

								document.querySelector("#upImgDiv").insertBefore(oDiv, addBtn);
		                    };
		                })(f);

		                reader.readAsDataURL(f);
		            //}
		        }
		    }
			function selectImg(){
				document.querySelector('#upLoadImgInp').value = null;
				document.querySelector('#upLoadImgInp').click();
				document.querySelector('#upLoadImgInp').addEventListener('change', handleFileSelect, false);
			}
		    // 获取删除的节点的索引
		    function getIndex(ele){
		        if(ele && ele.nodeType && ele.nodeType == 1) {
		            var oParent = ele.parentNode;
		            var oChilds = oParent.children;
		            for(var i = 0; i < oChilds.length; i++){
		                if(oChilds[i] == ele)
		                    return i;
		            }
		        }else {
		            return -1;
		        }
		    }
		    // 删除图片
		    function removeImg(evt) {
		    	var ele = document.querySelector('#upImgDiv');
		        if(evt.target.className.match(/img-remove/)){
		            // 根据索引删除指定的文件对象
		            var index = getIndex(evt.target.parentNode);
		            ele.removeChild(evt.target.parentNode);
		            if(index < 0){
		                return;
		            }
		        }
		    }
		    document.querySelector("#upImgDiv").addEventListener('click', removeImg, false);
			//评分函数
			function judgeByStar(obj,descTxt,hiddInp,options){
				var oScoreStar = document.getElementById(obj);
				var aLi = oScoreStar.getElementsByTagName("li");
				var oSpan = oScoreStar.getElementsByTagName("span")[1];
				var oSpan = $("#"+obj).find("span")[1];
				var iScore = iStar = iStar_sell = iStar_trade = 0;
				for (i = 1; i <= aLi.length; i++){
					aLi[i - 1].index = i;
					//鼠标移过显示分数
					aLi[i - 1].onmouseover = function (){
						fnPoint(this.index);
					};
					//鼠标离开后恢复上次评分
					aLi[i - 1].onmouseout = function (){
						fnPoint();
					};
					//点击后进行评分处理
					aLi[i - 1].onclick = function (){
						
						if(options == "sellOpt"){
							iStar_sell = this.index;
						}else if(options == "tradeOpt"){
							iStar_trade = this.index;
						}else{
							iStar = this.index;
						}
						if(this.index == 1 || this.index == 2){
							$("#" + descTxt).removeClass("goodTxt").addClass("badTxt");
						}else{
							$("#" + descTxt).removeClass("badTxt").addClass("goodTxt");
						}
						oSpan.innerHTML = $(this).attr("data-title");
						$("#"+hiddInp).val(this.index);
					};
				}
				//评分处理
				function fnPoint(iArg){
					//分数赋值
					if(options == "sellOpt"){
						iScore = iArg || iStar_sell;
					}else if(options == "tradeOpt"){
						iScore = iArg || iStar_trade;
					}else{
						iScore = iArg || iStar;
					}
					for (i = 0; i < aLi.length; i++) {
						if(i < iScore){
							aLi[i].className = "on";
						}else{
							aLi[i].className = "";
						}
					}
				}
				
			}
			var tids="-1";
			$("#tag_list li label input:checked").each(function() {
				tids = tids + "," + $(this).val();
			});
			function submitComment(){
				var checks=$("#tag_list li label input:checked");
				if(checks.length==0){
					layer.msg("请选择评价标签");
					return false;
				}
				
				var content=$("#content").val();
				if(content==""){
					layer.msg("请输入评价内容");
					return false;
				}
				var nums=$("#descScore").val();
				alert(nums)
				console.log(nums)
				if(nums==""){
					layer.msg("请选择评分");
					return false;
				}
				var tids="-1";
				$("#tag_list li label input:checked").each(function() {
					tids = tids + "," + $(this).val();
				});
				
				$.ajax({
				    type: 'post',  
				    cache: false,
		            contentType: false,
		            processData: false,
		            data: new FormData($("#addForm")[0]),
				    url: "${pageContext.request.contextPath }/web/shop/orderApi/addComment.htm?tags="+tids,
				    success: function (data) {	
				    	alert("gfgf")
				    	alert(data)
				    	 if(data.result=="ok"){
				    		layer.msg(data.msg);
				    		setTimeout('window.location.href = "${pageContext.request.contextPath }/web/shop/orderApi/myOrderList.htm?sort=2"',1500);
				    	 }else{
				    		 layer.msg(data.msg);
				    		 
				    	 }  
				    }
				    });
				
				
				
			}
			
			
		</script>
	</body>
</html>
