<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>团队充提记录</title>
	<link rel="stylesheet" href="../weChat/reception/css/aui.css"/>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_535570_6u90gnv3u6hzd7vi.css"/>
	<link rel="stylesheet" href="../weChat/reception/css/setPassword.css">
	<link rel="stylesheet" href="../weChat/reception/css/footer.css"/>
	<style type="text/css">
	</style>
</head>
<body>
	<header class="aui-bar aui-bar-nav headerNav">
        <a class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)" href="javascript:void(0)">
            <span class="aui-iconfont aui-icon-left"></span>
        </a>
        <div class="aui-title">团队充提记录</div>
    </header>
    <!-- mainCon -->
    <div class="comInpBox">
    	<ul>
    		<li>
                <div class="txtDiv">
                   	起始时间：
                </div>
                <div class="inpDiv">
                    <input id="startTimeInp" type="text" placeholder="请选择起始时间">
                </div>
            </li>
            <li>
                <div class="txtDiv">
                   截止时间：
                </div>
                <div class="inpDiv">
                    <input id="endTimeInp" type="text" placeholder="请选择截止时间">
                </div>
            </li>
            <li>
                <div class="txtDiv">
                   选择充提：
                </div>
                <div class="inpDiv">
                    
                </div>
            </li>
            <li>
                <div class="txtDiv">
                   	账号搜寻：
                </div>
                <div class="inpDiv">
                    <input id="accountInp" type="text" placeholder="请输入查询账号">
                </div>
            </li>
    	</ul>
    	<a href="javascript:void(0)" tapmode onclick="searchAccount()" class="aui-btn aui-btn-block comAuiBtn">查询</a>
    </div>
	<!-- footer -->
	<footer class="footer">
		<ul class="clearfix">
			<li>
				<a href="#">
					<p id="balance">¥90.00</p>
					<p>余额</p>
				</a>
			</li>
			<li><a href="#">
				<p><i class="iconfont icon-chongzhi"></i></p>
				<p>充值</p>
			</a></li>
			<li><a href="#">
				<p><i class="iconfont icon-tixian"></i></p>
				<p>充值</p>
			</a></li>
			<li><a href="#">
				<p><i class="iconfont icon-touzhujilu"></i></p>
				<p>下注记录</p>
			</a></li>
			<li class="active"><a href="#">
				<p><i class="iconfont icon-wode"></i></p>
				<p>个人中心</p>
			</a></li>
		</ul>
	</footer>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/mobiscroll.core-2.5.2.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/mobiscroll.core-2.5.2-zh.js"></script>
	<link href="../weChat/reception/css/mobiscroll.core-2.5.2.css" rel="stylesheet" type="text/css" />
	<link href="../weChat/reception/css/mobiscroll.animation-2.5.2.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../weChat/reception/jsPlugin/mobiscroll.datetime-2.5.1.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/mobiscroll.datetime-2.5.1-zh.js"></script>
	<!-- S 可根据自己喜好引入样式风格文件 -->
	<script type="text/javascript" src="../weChat/reception/jsPlugin/mobiscroll.android-ics-2.5.2.js"></script>
	<link href="../weChat/reception/css/mobiscroll.android-ics-2.5.2.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../weChat/reception/jsPlugin/aui-dialog.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/personalCen.js"></script>

	<script type="text/javascript">
		$(function(){
			initDate("startTimeInp");
			initDate("endTimeInp");
		});
		function searchAccount(){
			var stVal = $("#startTimeInp").val();
			var endVal = $("#endTimeInp").val();
			var accountInp = $("#accountInp").val();
			if(stVal == ""){
				dialog('起始时间不能为空');
				return;
			}else if(endVal == ""){
				dialog('截至时间不能为空');
				return;
			}else if(accountInp == ""){
				dialog('查询账号不能为空');
				return;
			}else{
				if(endVal < stVal){
					dialog('结束时间不能小于开始时间');
					return;
				}
				//dialog(stVal + "_" + endVal + "_" + accountInp);
				//do something
			}
		}
	</script>
</body>
</html>