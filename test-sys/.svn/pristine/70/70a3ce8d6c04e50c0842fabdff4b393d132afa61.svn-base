<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/module/personalCen/css/personalCen.css"/>
<link href="${pageContext.request.contextPath}/admin/assets/layui/css/layui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/assets/layui/layui.js"></script>
</head>
<body>
<!-- header -->
<div class="header">
    <div class="innerHeader w1100 clearfix">
        <h3 class="fl">${setting.attr3}</h3>
        <div class="rightPart fr">
            <span>${frontUser.nickName}，你好！欢迎来到${setting.attr3}<%--机段职工培训考试系统--%></span>
            <span class="oneBlank">|</span>
            <a href="javascript:exit()">退出系统</a>
        </div>
    </div>
</div>
<!-- mainCon -->
<div class="mainCon w1100 clearfix">
    <!-- leftMainCon -->
    <div class="leftMainCon fl">
        <div class="perImg">
            <c:choose>
                <c:when test="${empty frontUser.headPortrait }">
                    <img src="${pageContext.request.contextPath}/web/module/personalCen/image/mourentouxiang.jpg" style="max-width: 100%;max-height: 100%;border-radius:40px 40px 40px 40px" >
                </c:when>
                <c:otherwise>
                    <img src="/${frontUser.headPortrait}"/>
                </c:otherwise>
            </c:choose>
        </div>
        <p class="username">${frontUser.nickName}</p>
        <p class="gonghao">工号：${frontUser.attr0}</p>
        <p class="gonghao">所属部门：${org.name}</p>
        <span class="decSpan"></span>
        <div class="logoDiv">
            logo
        	<%--<img src="${setting.}" style="width:100%;height:100%;"/>--%>
        </div>
        <p class="mainTxt">真培、真学、真考</p>
        <%--<p class="timeP">登录时长：<span>00:10:25</span></p>--%>
        <p class="lastLogin">上次登录时间：${frontUser.attr1}</p>
        <div class="warnTxtDiv">
            <strong>注意事项</strong>
            <p>一、注意答题时间。</p>
            <p>二、考试坐姿要端正，保证面部能被摄像头抓取。</p>
            <p>三、切勿心存侥幸。</p>
        </div>
    </div>
    <!-- rightMainCon -->
    <div class="rightMainCon fl">
        <div class="navTab">
            <ul class="tabTopNav clearfix">
           		<li class="active" onclick="jumpExamInfo(this)"><a href="javascript:void(0)">考试信息</a><span></span></li>
                
                <li onclick="jumpPersonalInfo(this)"><a href="javascript:void(0)">个人资料</a><span></span></li>
                <li onclick="jumpfixPassword(this)"><a href="javascript:void(0)">密码修改</a><span></span></li>
                <li onclick="jumpCenter(this)"><a href="javascript:void(0)">个人中心</a><span></span></li>
                <li onclick="jumpExamRecord(this)"><a href="javascript:void(0)">考试记录</a></li>
            </ul>
            <!--  a class="beginExaBtn" href="${pageContext.request.contextPath}/web/module/exam/beginExam.jsp">开始考试</a-->
        </div>
        <div class="navCon">
            <div id="personalContent">
            	<div class="comNavConPart">
            		<strong>即将参加的考试</strong>
					<!-- 查询层 --> 
					<div class="searDiv">
						<input type="text" id="searchByname" placeholder="请输入考试名称">
						<button onclick="chaxun()">查询</button>
					</div>
					<div class="listNavCon">
						<ul class="headNavCon clearfix">
							<li class="oneLiWid">考试名称</li>
							<li class="oneLiWid">试卷名称</li>
							<li class="oneLiWid">开考时间</li>
							<li class="oneLiWid">截止时间</li>
							<li class="fourLiWid">考试时长</li>
							<li class=fourLiWid>考试次数</li>
							<li class="fourLiWid">已考次数</li>
							<!-- <li class="fourLiWid">实考人数</li> -->
							<li class="fourLiWid">开始考试</li>
						</ul>
						<ul class="mainListCon clearfix">
							<c:forEach items="${paperCreatServiceList}" var="paperCreat">
								<li>
								<p class="oneLiWid ellip">${paperCreat.exam_name}</p>
									<p class="oneLiWid ellip">${paperCreat.paperName}</p>
									<p class="oneLiWid">${paperCreat.start_time}</p>
									<p class="oneLiWid">${paperCreat.end_time}</p>
									<p class="fourLiWid">${paperCreat.exam_time}分钟</p>
									<p class="fourLiWid">${paperCreat.exam_use}次</p>
									<p class="fourLiWid">${paperCreat.times}</p>
									<p class="fourLiWid"><a target="_blank" href="javascript:startTest(${paperCreat.ins_id},${paperCreat.id},${paperCreat.examId})">开始考试</a>

									</p>
								</li>
							</c:forEach>
						</ul>
					</div>
            	</div>

            </div>

        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/web/jsPlugin/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/web/module/personalCen/js/personalCen.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/web/module/personalCen/js/personalTestInfor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/assets/echarts/echarts.min.js"></script>

<script type="text/javascript">
    $(function () {
        checkHeight();
    });
    function exit() {
        if (window.confirm("确定要退出登陆吗?")) {
            window.location = "${pageContext.request.contextPath}/web/module/login/exit.jsp";
        }
    }
    layui.config({
        base : '../admin/assets/layui/lay/modules/'
    }).use([ 'layer', 'laydate', 'laypage', 'table' ,'laytpl']);
</script>
</body>