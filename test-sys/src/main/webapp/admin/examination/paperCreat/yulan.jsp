<html id="body">
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="UTF-8">
	<title>试卷预览</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/reset.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/module/exam/css/exam.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_547918_39n6uhr143877gb9.css"/>
</head>
<body>
	<!-- header -->
	<div class="header">
		<div class="innerHeader w1100 clearfix">
			<h3 class="fl">${setting.attr3}</h3>
		</div>
	</div>
	<div class="mainCon w1100 clearfix">
		<div class="leftMainPart fl">
			<!-- quesType -->
			<c:if test="${not empty danxuanToList}">
				<div class="quesType">
				<strong class="typeStrong">单选题</strong>
				<span class="totalSpan">共${danxuanToList.size()}题，合计${danxuantiZong}分</span>
			</div>
			<!-- 单选 -->
			<c:forEach items="${danxuanToList}" var="danxuanTo">
				<div id="quesList_${danxuanTo.id}" class="quesList">
					<div class="quesTit clearfix">
						<!-- 题号 -->
						<span class="quesNum fl">${danxuanTo.attr7}</span>
						<!-- 题干 -->
						<div class="quesTitCon fl">
							<p>(${duanxuanFen}分)${danxuanTo.name}</p>
						</div>
						<c:if test="${danxuanTo.image!=null && danxuanTo.image!=''}">
							<div class="quesTitCon hasImgTitCon fl">
							<img src="/${danxuanTo.image}" style="width: 250px;height: 240px;"/>
						</div>
						</c:if>
						
					</div>
					<div id="quesSelCon_${danxuanTo.id}" class="quesSelCon">
						<ul>
							<li class="danxuan">
								<label for="${danxuanTo.id}_1">
									<span></span>
									<input type="radio" id="${danxuanTo.id}_1" name="${danxuanTo.id}_option_radio" onclick="selectSingleAnswer(this,${danxuanTo.id})" class="comSelInp" />
									<p class="fl">A、${danxuanTo.optionA}</p>
								</label>
							</li>
							<li class="danxuan">
								<label for="${danxuanTo.id}_2">
									<span></span>
									<input type="radio" id="${danxuanTo.id}_2" name="${danxuanTo.id}_option_radio" onclick="selectSingleAnswer(this,${danxuanTo.id})" class="comSelInp" />
									<p class="fl">B、${danxuanTo.optionB}</p>
								</label>
							</li>
							<li class="danxuan">
								<label for="${danxuanTo.id}_3">
									<span></span>
									<input type="radio" id="${danxuanTo.id}_3" name="${danxuanTo.id}_option_radio" onclick="selectSingleAnswer(this,${danxuanTo.id})" class="comSelInp" />
									<p class="fl">C、${danxuanTo.optionC}</p>
								</label>
							</li>
							<li class="danxuan">
								<label for="${danxuanTo.id}_4">
									<span></span>
									<input type="radio" id="${danxuanTo.id}_4" name="${danxuanTo.id}_option_radio" onclick="selectSingleAnswer(this,${danxuanTo.id})" class="comSelInp" />
									<p class="fl">D、${danxuanTo.optionD}</p>
								</label>
							</li>
						</ul>
					</div>
				</div>
			</c:forEach>
			</c:if>
			
			
			
			<c:if test="${not empty duoxianToList}">
				<!-- quesType -->
			<div class="quesType">
				<strong class="typeStrong">多选题</strong>
				<span class="totalSpan">共${duoxianToList.size()}题，合计${duoxuantiZong}分</span>
			</div>
			<c:forEach items="${duoxianToList}" var="duoxianTo">
				<div id="quesList_${duoxianTo.id}" class="quesList">
					<div class="quesTit clearfix">
						<!-- 题号 -->
						<span class="quesNum fl">${duoxianTo.attr7}</span>
						<!-- 题干 -->
						<div class="quesTitCon fl">
							<p>(${duoxuanFen}分)${duoxianTo.name}</p>
						</div>
					</div>
					<div id="quesSelCon_${duoxianTo.id}" class="quesSelCon">
						<ul>
							<li class="duoxuan">
								<label for="${duoxianTo.id}_1">
									<span></span>
									<input type="checkbox" id="${duoxianTo.id}_1" name="answer_option_checkbox" onclick="selectMultAnswer(this,${duoxianTo.id})" class="comSelInp" />
									<p class="fl">A、${duoxianTo.optionA}</p>
								</label>
							</li>
							<li class="duoxuan">
								<label for="${duoxianTo.id}_2">
									<span></span>
									<input type="checkbox" id="${duoxianTo.id}_2" name="answer_option_checkbox" onclick="selectMultAnswer(this,${duoxianTo.id})" class="comSelInp" />
									<p class="fl">B、${duoxianTo.optionB}</p>
								</label>
							</li>
							<li class="duoxuan">
								<label for="${duoxianTo.id}_3">
									<span></span>
									<input type="checkbox" id="${duoxianTo.id}_3" name="answer_option_checkbox" onclick="selectMultAnswer(this,${duoxianTo.id})" class="comSelInp" />
									<p class="fl">C、${duoxianTo.optionC}</p>
								</label>
							</li>
							<li class="duoxuan">
								<label for="${duoxianTo.id}_4">
									<span></span>
									<input type="checkbox" id="${duoxianTo.id}_4" name="answer_option_checkbox" onclick="selectMultAnswer(this,${duoxianTo.id})" class="comSelInp" />
									<p class="fl">D、${duoxianTo.optionD}</p>
								</label>
							</li>
						</ul>
					</div>
				</div>
			</c:forEach>
			</c:if>
			
			<!-- <button onclick=""></button> -->
			<!-- quesType -->
			
			<c:if test="${not empty panduanToList}">
				<div class="quesType">
				<strong class="typeStrong">判断题</strong>
				<span class="totalSpan">共${panduanToList.size()}题，合计${panduantiZong}分</span>
			</div>
			<c:forEach items="${panduanToList}" var="panduanTo">
				<div id="quesList_${panduanTo.id}" class="quesList">
					<div class="quesTit clearfix">
						<!-- 题号 -->
						<span class="quesNum fl">${panduanTo.attr7}</span>
						<!-- 题干 -->
						<div class="quesTitCon fl">
							<p>(${panduanFen}分)${panduanTo.name}</p>
						</div>
					</div>
					
					<div id="quesSelCon_${panduanTo.id}" class="quesSelCon">
						<ul>
							<li class="panduan">
								<label for="${panduanTo.id}_1">
									<span></span>
									<input type="radio" id="${panduanTo.id}_1" name="${panduanTo.id}_panduan_radio" onclick="selJudgeAns(this,${panduanTo.id})" class="comSelInp" />
									<p class="fl">正确</p>
								</label
								>
							</li>
							<li class="panduan">
								<label for="${panduanTo.id}_2">
									<span></span>
									<input type="radio" id="${panduanTo.id}_2" name="${panduanTo.id}_panduan_radio" onclick="selJudgeAns(this,${panduanTo.id})" class="comSelInp" />
									<p class="fl">错误</p>
								</label>
							</li>
						</ul>
					</div>
				</div>
			</c:forEach>
			</c:if>
			
			
		</div>
	</div>
	<!-- 答题卡层  -->
	<div class="quesCard_begin">
		<p class="remainP">答题卡</p>
		<div id="parCard" class="quesTypeCard">
			<div id="sonCard" class="scroller">
				<!-- 单选题 -->
				<div class="comQuesType">
					<p class="comTypeTit">单选题</p>
					<ul class="clearfix">
						<c:forEach items="${danxuanToList}" var="danxuanTo">
							<li><a id="singleSelCardA_${danxuanTo.id}" href="#quesList_${danxuanTo.id}">${danxuanTo.attr7}</a></li>
						</c:forEach>
					</ul>
				</div>
				<!-- 多选题 -->
				<div class="comQuesType">
					<p class="comTypeTit">多选题</p>
					<ul class="clearfix">
						<c:forEach items="${duoxianToList}" var="duoxianTo">
							<li><a id="multiSelCardA_${duoxianTo.id}" href="#quesList_${duoxianTo.id}">${duoxianTo.attr7} </a></li>
						</c:forEach>
					</ul>
				</div>
				<!-- 判断题 -->
				<div class="comQuesType">
					<p class="comTypeTit">判断题</p>
					<ul class="clearfix">
						<c:forEach items="${panduanToList}" var="panduanTo">
							<li><a id="judgeSelA_${panduanTo.id}" href="#quesList_${panduanTo.id}">${panduanTo.attr7}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="handPaper w1100">
		<a class="backPerBtn" onclick="guanbi()" href="#">返回</a>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/web/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/web/jsPlugin/scrollBar.js"></script>
	<script type="text/javascript">
		var cliWid = $(window).width();
		$(function(){
			$(".quesCard_begin").css({"right":parseInt((cliWid-1000)/2)});
			createScrollBar();
			checkTitCon();
		});
		function createScrollBar(){
			var parHei = $("#parCard").height();
			var sonHei = $("#sonCard").height();
			var oScroll = "<div id='scrollParent' class='parentScroll'><div id='scrollSon' class='sonScrollBar'></div></div>";
			if(sonHei > parHei){//动态创建模拟滚动条
				$("#parCard").append(oScroll);
				scrollBar("parCard","sonCard","scrollParent","scrollSon",10);
			}
		}
		function checkTitCon(){
			if($(".hasImgTitCon").length != 0){
				$(".hasImgTitCon").each(function(i){
					$(".hasImgTitCon").eq(i).prev().addClass("noBorTitCon");
				});
			}
		}
		$(window).resize(function(){
			var tmpCliWid = $(window).width();
			cliWid = tmpCliWid;
			$(".quesCard_begin").css({"right":parseInt((cliWid-1000)/2)});
		});
		//单选
		function selectSingleAnswer(obj,index){
			$("#quesSelCon_" + index).find("span").removeClass("active");
			$("#selIcon_"+index).remove();
			$(obj).prev().addClass("active").append("<i id=selIcon_"+ index +" class='iconfont icon-successful'></i>");
			$("#singleSelCardA_" + index).parent().addClass("active");
		}
		//多选
		function selectMultAnswer(obj,index){
			if(obj.checked){//选中
				$(obj).prev().addClass("active").append("<i class='iconfont icon-successful'></i>");
				$("#multiSelCardA_" + index).parent().addClass("active");
			}else{
				$(obj).prev().removeClass("active");
				$(obj).prev().find('i').remove();
				if(!$(obj).parent().parent().siblings().find("input").is(':checked')){
					$("#multiSelCardA_" + index).parent().removeClass("active");
				}
			}
		}
		//判断题 
		function selJudgeAns(obj,index){
			$("#quesSelCon_" + index).find("span").removeClass("active");
			$("#selIcon_"+index).remove();
			$(obj).prev().addClass("active").append("<i id=selIcon_"+ index +" class='iconfont icon-successful'></i>");;
			$("#judgeSelA_" + index).parent().addClass("active");
		}
		
		
		function guanbi(){
			window.close();
			
		}
	</script>
</body>
</html>