
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="UTF-8">
	<title>考试记录</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/reset.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/module/exam/css/exam.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_547918_39n6uhr143877gb9.css"/>
</head>
<script>
	var test = '${duoxianToLists}';
	/*$(function(){
		alert("000")
		var test = '${duoxianToLists}';
		console.log(JSON.parse(test))
	});*/
    function exit() {
        if (window.confirm("确定要退出登陆吗?")) {
            window.location = "${pageContext.request.contextPath}/web/module/login/exit.jsp";
        }
    }
</script>
<body>
	<!-- header -->
	<%-- <div class="header">
		<div class="innerHeader w1100 clearfix">
			<h3 class="fl">${setting.attr3}</h3>
			<div class="rightPart fr">
				<span>${frontUser.nickName}，你好！欢迎来到${setting.attr3}</span>
				<span class="oneBlank">|</span>
				<a href="javascript:exit()">退出系统</a>
			</div>
		</div>
	</div> --%>
	<div class="mainCon w1100 clearfix">
		<div class="leftMainPart fl">
			<!-- quesType -->
			<c:if test="${danxuanToLists.size()!=0}">
			<div class="quesType">
				<strong class="typeStrong">单选题</strong>
				<span class="totalSpan">共${danxuanToLists.size()}题，合计${countFen}分</span>
			</div>
			<c:forEach items="${danxuanToLists}" var="danxuan">
				<!-- 循环quesList -->
				<div id="quesList_${danxuan.id}" class="quesList">
					<div class="quesTit clearfix">
						<!-- 题号 -->
						<span class="quesNum fl">${danxuan.attr7}</span>
						<!-- 题干 -->
						<div class="quesTitCon fl">
							<p>(${danxuan.attr6}分)${danxuan.title}</p>
						</div>
						<c:if test="${danxuan.image!=null && danxuan.image!=''}">
							<div class="quesTitCon hasImgTitCon fl">
								<img src="/${danxuan.image}" style="width: 250px;height: 240px;"/>
							</div>
						</c:if>
					</div>
					<div class="quesSelCon">
						<ul>
							<li>
								<label class="noCursor" for="${danxuan.id}_1">
									<span></span>
									<input type="radio" id="${danxuan.id}_1" name="${danxuan.id}_option_radio" class="comSelInp" />
									<p class="fl">A、${danxuan.optionA}</p>
								</label>
							</li>
							<li>
								<label class="noCursor" for="${danxuan.id}_2">
									<span></span>
									<input type="radio" id="${danxuan.id}_2" name="${danxuan.id}_option_radio" class="comSelInp" />
									<p class="fl">B、${danxuan.optionB}</p>
								</label>
							</li>
							<li>
								<label class="noCursor" for="${danxuan.id}_3">
									<span></span>
									<input type="radio" id="${danxuan.id}_3" name="${danxuan.id}_option_radio" class="comSelInp" />
									<p class="fl">C、${danxuan.optionC}</p>
								</label>
							</li>
							<li>
								<label class="noCursor" for="${danxuan.id}_4">
									<span></span>
									<input type="radio" id="${danxuan.id}_4" name="${danxuan.id}_option_radio" class="comSelInp" />
									<p class="fl">D、${danxuan.optionD}</p>
								</label>
							</li>
						</ul>
					</div>
					<c:if test="${danxuan.answer!=danxuan.attr0}">
						<!-- 做完题显示的层 -->
					<div class="endExamDiv">
						<p class="ansTit">本题答案：</p>
						<p class="ansP thisAns">${danxuan.answer}</p>
						<p class="ansTit">您选择的答案：</p>
						<c:if test="${danxuan.attr0!='E'}">
							<p class="ansP myAns">${danxuan.attr0}</p>
						</c:if>
						<c:if test="${danxuan.attr0=='E'}">
							<p class="ansP myAns">您未选择</p>
						</c:if>
						<p class="ansTit">答案解析：</p>
						<c:if test="${danxuan.attr1!=null && danxuan.attr1!=''}">
						<p class="ansP ansAnlysis">${danxuan.attr1}</p>
						</c:if>
						<c:if test="${danxuan.attr1==null || danxuan.attr1==''}">
						<p class="ansP ansAnlysis">暂无解析，敬请期待</p>
						</c:if>
					</div>
					</c:if>
					
				</div>
			</c:forEach>
			</c:if>



			<!-- quesType -->
			<c:if test="${duoxianToLists.size()!=0}">
			<div class="quesType">
				<strong class="typeStrong">多选题</strong>
				<span class="totalSpan">共${duoxianToLists.size()}题，合计${countFen}分</span>
			</div>
			
			<c:forEach items="${duoxianToLists}" var="duoxianTo">
				<div id="quesList_${duoxianTo.id}" class="quesList">
					<div class="quesTit clearfix">
						<!-- 题号 -->
						<span class="quesNum fl">${duoxianTo.attr7}</span>
						<!-- 题干 -->
						<div class="quesTitCon fl">
							<p>(${duoxianTo.attr6}分)${duoxianTo.title}</p>
						</div>
						<c:if test="${duoxianTo.image!=null && duoxianTo.image!=''}">
							<div class="quesTitCon hasImgTitCon fl">
								<img src="/${duoxianTo.image}" style="width: 250px;height: 240px;"/>
							</div>
						</c:if>
					</div>
					<div id="quesSelCon_${duoxianTo.id}" class="quesSelCon">
						<ul>
							<li class="duoxuan">
								<label class="noCursor" for="${duoxianTo.id}_1">
									<span></span>
									<input type="checkbox" id="${duoxianTo.id}_1" name="answer_option_checkbox" class="comSelInp" />
									<p class="fl">A、${duoxianTo.optionA}</p>
								</label>
							</li>
							<li class="duoxuan">
								<label class="noCursor" for="${duoxianTo.id}_2">
									<span></span>
									<input type="checkbox" id="${duoxianTo.id}_2" name="answer_option_checkbox" class="comSelInp" />
									<p class="fl">B、${duoxianTo.optionB}</p>
								</label>
							</li>
							<li class="duoxuan">
								<label class="noCursor" for="${duoxianTo.id}_3">
									<span></span>
									<input type="checkbox" id="${duoxianTo.id}_3" name="answer_option_checkbox" class="comSelInp" />
									<p class="fl">C、${duoxianTo.optionC}</p>
								</label>
							</li>
							<li class="duoxuan">
								<label class="noCursor" for="${duoxianTo.id}_4">
									<span></span>
									<input type="checkbox" id="${duoxianTo.id}_4" name="answer_option_checkbox" class="comSelInp" />
									<p class="fl">D、${duoxianTo.optionD}</p>
								</label>
							</li>
						</ul>
					</div>
					<c:if test="${duoxianTo.answer!=duoxianTo.attr0}">
							<!-- 做完题显示的层 -->
					<div class="endExamDiv">
						<p class="ansTit">本题答案：</p>
						<p class="ansP thisAns">${duoxianTo.answer}</p>
						<p class="ansTit">您选择的答案：</p>
						<%--<input type="text" value="${duoxianTo.attr0}"/>--%>
						<c:if test="${duoxianTo.attr0!='EEEE'}">
						<p class="ansP myAns">${duoxianTo.attr0}</p>
						</c:if>
						<c:if test="${duoxianTo.attr0=='EEEE'}">
						<p class="ansP myAns">您未选择</p>
						</c:if>
						<p class="ansTit">答案解析：</p>
						<c:if test="${duoxianTo.attr1!=null && duoxianTo.attr1!=''}">
						<p class="ansP ansAnlysis">${duoxianTo.attr1}</p>
						</c:if>
						<c:if test="${duoxianTo.attr1==null || duoxianTo.attr1==''}">
						<p class="ansP ansAnlysis">暂无解析，敬请期待</p>
					</c:if>
					</div>
					</c:if>
					
					
					
				</div>
			</c:forEach>
			</c:if>
			
			<!-- quesType -->
			<c:if test="${panduanToLists.size()!=0}">
			<div class="quesType">
				<strong class="typeStrong">判断题</strong>
				<span class="totalSpan">共${panduanToLists.size()}题，合计${panCountFen}分</span>
			</div>
			<c:forEach items="${panduanToLists}" var="panduanTo">
				<div id="quesList_${panduanTo.id}" class="quesList">
					<div class="quesTit clearfix">
						<!-- 题号 -->
						<span class="quesNum fl">${panduanTo.attr7}</span>
						<!-- 题干 -->
						<div class="quesTitCon fl">
							<p>(${panduanTo.attr6}分)${panduanTo.title}</p>
						</div>
						<c:if test="${panduanTo.image!=null && panduanTo.image!=''}">
							<div class="quesTitCon hasImgTitCon fl">
								<img src="/${panduanTo.image}" style="width: 250px;height: 240px;"/>
							</div>
						</c:if>
					</div>
					<div class="quesSelCon">
						<ul>
							<li>
								<label class="noCursor" for="${panduanTo.id}_1">
									<span></span>
									<input type="radio" id="${panduanTo.id}_1" name="${panduanTo.id}_option_radio" class="comSelInp" />
									<p class="fl">A、正确</p>
								</label>
							</li>
							<li>
								<label class="noCursor" for="${panduanTo.id}_2">
									<span></span>
									<input type="radio" id="${panduanTo.id}_2" name="${panduanTo.id}_option_radio" class="comSelInp" />
									<p class="fl">B、错误</p>
								</label>
							</li>
						</ul>
					</div>
					
					<c:if test="${panduanTo.answer!=panduanTo.attr0}">
						<!-- 做完题显示的层 -->
					<div class="endExamDiv">
						<p class="ansTit">本题答案：</p>
						<c:if test="${panduanTo.answer==0}">
							<p class="ansP thisAns">A</p>
						</c:if>
						<c:if test="${panduanTo.answer==1}">
							<p class="ansP thisAns">B</p>
						</c:if>
						<p class="ansTit">您选择的答案：</p>
						<c:if test="${panduanTo.attr0==0}">
							<p class="ansP myAns">A</p>
						</c:if>
						<c:if test="${panduanTo.attr0==1}">
							<p class="ansP myAns">B</p>
						</c:if>
						<c:if test="${panduanTo.attr0==2}">
							<p class="ansP myAns">您未选择</p>
						</c:if>
						<p class="ansTit">答案解析：</p>
						<c:if test="${panduanTo.attr1!=null && panduanTo.attr1!=''}">
						<p class="ansP ansAnlysis">${panduanTo.attr1}</p>
						</c:if>
						<c:if test="${panduanTo.attr1==null || panduanTo.attr1==''}">
						<p class="ansP ansAnlysis">暂无解析，敬请期待</p>
					</c:if>
					</div>
					</c:if>
					
				</div>
			</c:forEach>
			</c:if>
		</div>
		<div class="rightMainPart noFixed">
			<!-- 考试成绩 -->
			<div class="myExamResult">
				<p class="remainP">考试成绩</p>
				<div class="myResult">
					<p class="comSummaryP totalSucP">您共答对了
						<c:choose>
							<c:when test="${empty rightNum}">
								0
							</c:when>
							<c:otherwise>
								${rightNum}
							</c:otherwise>
						</c:choose>道题</p>
					<p class="comSummaryP myExamNum">本次考试成绩：<strong>
						<c:choose>
							<c:when test="${empty zongDeFen}">
								0
							</c:when>
							<c:otherwise>
								${zongDeFen}
							</c:otherwise>
						</c:choose>分</strong></p>
					<p class="comSummaryP marginTopP">单选题：正确<span>
						<c:choose>
							<c:when test="${empty danxuanRighrNum}">
								0
							</c:when>
							<c:otherwise>
								${danxuanRighrNum}
							</c:otherwise>
						</c:choose></span>道，错误<span>
						<c:choose>
							<c:when test="${empty danxuanWrongNum}">
								0
							</c:when>
							<c:otherwise>
								${danxuanWrongNum}
							</c:otherwise>
						</c:choose></span>道</p>
					<p class="comSummaryP">多选题：正确<span>
						<c:choose>
							<c:when test="${empty duoxuanRightNum}">
								0
							</c:when>
							<c:otherwise>
								${duoxuanRightNum}
							</c:otherwise>
						</c:choose></span>道，错误<span>
						<c:choose>
							<c:when test="${empty duoxuanWrongNum}">
								0
							</c:when>
							<c:otherwise>
								${duoxuanWrongNum}
							</c:otherwise>
						</c:choose></span>道</p>
					<p class="comSummaryP">判断题：正确<span>
						<c:choose>
							<c:when test="${empty panduanRightNum}">
								0
							</c:when>
							<c:otherwise>
								${panduanRightNum}
							</c:otherwise>
						</c:choose></span>道，错误<span>
						<c:choose>
							<c:when test="${empty panduanWrongNum}">
								0
							</c:when>
							<c:otherwise>
								${panduanWrongNum}
							</c:otherwise>
						</c:choose></span>道</p>
					
					
					
					<div class="quesResultCard">
						<div class="succResult">
							<p class="titResP">正确题号</p>
							<!-- 单选题 -->
							<div class="comQuesType singleTypeRes">
								<p class="comTypeTit">单选题</p>
								<ul class="clearfix">
									<c:if test="${danxuanRighrList.size()!=0}">
										<c:forEach items="${danxuanRighrList}" var="danxuanRighr">
										<li class="active"><a href="javascript:void(0)">${danxuanRighr}</a></li>
									</c:forEach>
									</c:if>
									<c:if test="${danxuanRighrList.size()==0}">
										没有答对的单选题
									</c:if>
								</ul>
							</div>
							<!-- 多选题 -->
							<div class="comQuesType singleTypeRes">
								<p class="comTypeTit">多选题</p>
								<ul class="clearfix">
								<c:if test="${duoxuanRightList.size()!=0}">
									<c:forEach items="${duoxuanRightList}" var="duoxuanRight">
										<li class="active"><a href="javascript:void(0)">${duoxuanRight}</a></li>
									</c:forEach>
								</c:if>
								<c:if test="${duoxuanRightList.size()==0}">
									没有答对的多选题
								</c:if>
									
								</ul>
							</div>
							<div class="comQuesType singleTypeRes">
								<p class="comTypeTit">判断题</p>
								<ul class="clearfix">
								<c:if test="${panduanRightList.size()!=0}">
									<c:forEach items="${panduanRightList}" var="panduanRight">
										<li class="active"><a href="javascript:void(0)">${panduanRight}</a></li>
									</c:forEach>
								</c:if>
								<c:if test="${panduanRightList.size()==0}">
									没有答对的判断题
								</c:if>
									
								</ul>
							</div>
						</div>

						<div class="errResult">
							<p class="titResP">错题题号</p>
							<!-- 单选题 -->
							<div class="comQuesType singleTypeRes">
								<p class="comTypeTit">单选题</p>
								<ul class="clearfix">
								<c:if test="${danxuanWrongList.size()!=0}">
									<c:forEach items="${danxuanWrongList}" var="danxuanWrong">
										<li class="err"><a href="javascript:void(0)">${danxuanWrong}</a></li>
									</c:forEach>
								</c:if>
								<c:if test="${danxuanWrongList.size()==0}">
									没有答错的单选题
								</c:if>
									
								</ul>
							</div>
							<!-- 多选题 -->
							<div class="comQuesType singleTypeRes">
								<p class="comTypeTit">多选题</p>
								<ul class="clearfix">
								<c:if test="${duoxuanWrongList.size()!=0}">
									<c:forEach items="${duoxuanWrongList }" var="duoxuanWrong">
										<li class="err"><a href="javascript:void(0)">${duoxuanWrong }</a></li>
									</c:forEach>
								</c:if>
								<c:if test="${duoxuanWrongList.size()==0}">
									没有答错的多选题
								</c:if>
									
									
								</ul>
							</div>
							<div class="comQuesType singleTypeRes">
								<p class="comTypeTit">判断题</p>
								<ul class="clearfix">
								<c:if test="${panduanWrongList.size()!=0}">
									<c:forEach items="${panduanWrongList }" var="panduanWrong">
										<li class="err"><a href="javascript:void(0)">${panduanWrong }</a></li>
									</c:forEach>
								</c:if>
								<c:if test="${panduanWrongList.size()==0}">
									没有答错的判断题
								</c:if>
									
									
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 考试评语 -->
			<div class="examcomment">
				<p class="remainP">考试评语</p>
				<div class="myComment">
					<p>再接再厉，相信你是最棒的你 是最棒的。</p>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/web/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/web/jsPlugin/scrollBar.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/web/module/exam/time/jquery.countdown.js"></script>
	<script type="text/javascript">
		
        function jumpCen(){
            window.location = "${pageContext.request.contextPath}/web/module/login/inter/frontuser/jumpQuanCen.htm";
        }
	</script>
</body>

