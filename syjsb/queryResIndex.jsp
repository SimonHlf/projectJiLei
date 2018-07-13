<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta  charset="UTF-8"  name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
		<title>首届濮阳食品药品“双百”诚信企业评选活动</title>
		<link rel="stylesheet" type="text/css" href="css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="css/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/queryRes.css"/>
		<link rel="stylesheet" type="text/css" href="css/pullRefresh.css"/>
		<link rel="stylesheet" type="text/css" href="css/tipInfo.css"/>
		<link rel="stylesheet" type="text/css" href="css/footer.css"/>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/resources/ui/lib/layer3.1/layer.js?v=20151225"></script>
		<script type="text/javascript" src="js/vote.common.js"></script>
		<script type="text/javascript">
			var keyword = '${param.keyword}';
			var globalUrl = '${ctx}/vote/';
			var noDataInfo = "<p class='noDataInfo'><i class='iconfont icon-zanwu'></i><span>暂无搜索结果！</span></p>";
			$(function(){
				$("#allDistrict").height($(window).height() - $(".queryHead").height());
				getQueryRes();
			});
			
			//获取搜索结果
			function getQueryRes(){
				var pageTmp = 1;
				$(".loadingDiv").show();
				$.ajax({
					type : 'POST',
					url : globalUrl + 'getEnterpriseList.ht?&groupId=all&page='+ pageTmp +'&pageSize=10',
					data : {
						keyword : keyword
					},
					success : function(data){
						$(".loadingDiv").hide();
						var total = JSON.parse(data).data.dataObject.total;
						var data = JSON.parse(data).data.dataObject.rows;
						if(total == 0){
							//console.log('暂无搜索结果');
							$(".comScroller").append(noDataInfo);
							return;
						}
						getData(data);
					}
				});
			}
			function getData(data){
				var oUl = document.getElementById('allDataUl');
				var aLi = oUl.getElementsByTagName("li");

				for(var i=0;i<data.length;i++){
					var _index = getShortLi(aLi);
					var oImg = document.createElement("img");
			        var oDiv = document.createElement("div");
			    	oDiv.setAttribute('class','product_picture');
			    	oDiv.setAttribute("voteId",data[i].id);
			    	oImg.addEventListener('touchend',function(){
			    		location.href='mine.jsp?id='+oDiv.getAttribute("voteId");
			    	});
			        //oImg.src = app_param.path+'/'+data[i].coverUrl;
			        oImg.src = '${ctx}/'+data[i].coverUrl;
			        //oImg.style.width = iWidth + 'px';
					//oImg.style.height = (data[i].height * (iWidth/data[i].width)) + "px";
					oDiv.appendChild(oImg);
					var oParTxt = document.createElement("div");
					var oStrong = document.createElement("strong");
					oStrong.setAttribute('class','ellip');
					var oSpan = document.createElement("span");
					var oBotDiv = document.createElement("div");
					oBotDiv.setAttribute('class','botDivFun clearfix');
					oParTxt.setAttribute('class','product_ie');
					var oVoteNumP = document.createElement("p");
					var oVote = document.createElement("a");
					oVote.setAttribute("voteId",data[i].id);
					oVote.setAttribute("ontouchend","voteFn(this)");
					oBotDiv.appendChild(oVoteNumP);
					oParTxt.appendChild(oStrong);
					insertAfter(oSpan,oStrong);
					insertAfter(oBotDiv,oSpan);
					insertAfter(oVote,oVoteNumP);
					oDiv.appendChild(oParTxt);
					
					oStrong.innerHTML = data[i].name;
					oSpan.innerHTML = data[i].seNumber + "： ("+ data[i].groupId +"组) ";
					oVoteNumP.innerHTML = "<em>"+ data[i].voteNumber +"</em>票";
					oVote.innerHTML="投票";
					
					aLi[_index].appendChild(oDiv);
				}	
			};
			function getShortLi(aLi){
				var index = 0;
				var iLen = aLi.length;
				var ih = aLi[index].offsetHeight;
				for(var i=1;i<iLen;i++ ){
					if(aLi[i].offsetHeight < ih){
						index = i;
						ih = aLi[i].offsetHeight;
					}
				}
				return index;
			}
			function insertAfter(newEl, targetEl){
			    var parentEl = targetEl.parentNode; 
			    if(parentEl.lastChild == targetEl){
			        parentEl.appendChild(newEl);
			    }else{
			        parentEl.insertBefore(newEl,targetEl.nextSibling);
			    }            
			}
		</script>
	</head>
	<body>
		<div class="queryHead">
			<a class="backBtn" href="index.jsp">
				<i class="iconfont icon-fanhui"></i>
			</a>
			<span>搜索结果</span>
		</div>
		<div id="allDistrict">
	    	<div id="innerAllDis" class="tabContent">
	        	<div class="comScroller">
	        		<ul id="allDataUl" class="listDataUl waterFullUl clearfix" class="clearfix">
	        			<li></li>
	        			<li></li>
	        		</ul>
	       		</div>
	    	</div>
		</div>
		<!-- loading -->
		<div class="loadingDiv">
			<div class="loadEffect">
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
			</div>
			<p>正在加载...</p>
		</div>
	    <script type="text/javascript" src="js/flexible.js" ></script>
	    <script src="js/iScroll.js"></script>
	</body>
</html>
