<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>绑定银行卡</title>
<link rel="stylesheet" href="../weChat/reception/css/aui.css" />
<link rel="stylesheet"
	href="http://at.alicdn.com/t/font_535570_6u90gnv3u6hzd7vi.css" />
<link rel="stylesheet" href="../weChat/reception/css/bindBankCard.css" />
<link rel="stylesheet" href="../weChat/reception/css/setPassword.css" />
<link rel="stylesheet" href="../weChat/reception/css/ydui.css?rev=@@hash"/>
<link rel="stylesheet" href="../weChat/reception/css/footer.css">
</head>
<body>
	<header class="aui-bar aui-bar-nav headerNav"> <a
		class="aui-pull-left aui-btn" tapmode onclick="history.go(-1)"
		href="javascript:void(0)"> <span
		class="aui-iconfont aui-icon-left"></span>
	</a> <%-- <input type="hidden" id="userId" value="${frontUser.userId }"> --%>
	<div class="aui-title">修改绑定银行卡</div>
	</header>
	<!-- mainCon -->
	<%-- <c:choose>
    <c:when test="${ !empty list }"> --%>
	<div class="comInpBox">
	<%-- <c:forEach items="${list}" var="credit"> --%><!-- varStatus="i" begin="0" end="0" step="1" -->
		<ul>
			<li>
				<div class="txtDiv">
					选<span class="twoBlank"></span>择<span class="twoBlank"></span>银<span
						class="twoBlank"></span>行：
				</div>
				<div class="inpDiv" tapmode onclick="selectBank()">
					<input id="selBankInp" type="text" placeholder="请选择开户行" disabled>
					<!-- disabled -->
					<i class="iconfont icon-jiantou arrowIcon"></i>
				</div>
			</li>
			<li>
				<div class="txtDiv">
					开<span class="oneBlank"></span>户<span class="oneBlank"></span>省：
				</div>
				<div class="inpDiv">
                    <input id="selBankLocInp" type="text" readonly placeholder="请选择开户地址">
                </div>
			</li>
			<li>
				<div class="txtDiv">开户人姓名：</div>
				<div class="inpDiv">
					<input id="personNameInp" onblur="checkNameNum()" type="text" placeholder="请输入开户人姓名">
				</div>
			</li>
			<li>
				<div class="txtDiv">
					银<span class="twoBlank"></span>行<span class="twoBlank"></span>卡<span
						class="twoBlank"></span>号：
				</div>
				<div class="inpDiv">
					<input id="bankNumInp" onblur="checkBankNum()" type="text" placeholder="请输入银行卡号">
				</div>
			</li>
			<li>
				<div class="txtDiv">
					支<span class="twoBlank"></span>行<span class="twoBlank"></span>名<span
						class="twoBlank"></span>称：
				</div>
				<div class="inpDiv">
					<input id="bankNameZhiInp" type="text" placeholder="请输入支行名称">
				</div>
			</li>
		</ul>
		
		<a href="javascript:void(0)" tapmode onclick="saveBank()"
			class="aui-btn aui-btn-block comAuiBtn">确定</a>
	</div>
	
	<div id="bankWrapper">
        <header class="aui-bar aui-bar-nav headerNav">
            <a class="aui-pull-left aui-btn" tapmode onclick="closeSelBank()" href="javascript:void(0)">
                <span class="aui-iconfont aui-icon-left"></span>
            </a>
            <div class="aui-title">请选择银行</div>
        </header>
        <input type="hidden" id="hideInpBank" />
        <div id="bankRel">
           <ul class="bankMidWinDiv">
                <li>
                    <span class="comBankIcon icbcIcon"></span>
                    <p>中国工商银行</p>
                    <input type="radio" class="com_BankRdio" name="bankRadio" value="中国工商银行"/>
                    <i class="comCirSpan"></i>
                </li>
                <li>
                    <span class="comBankIcon abcIcon"></span>
                    <p>中国农业银行</p>
                    <input type="radio" class="com_BankRdio" name="bankRadio" value="中国农业银行"/>
                    <i class="comCirSpan"></i>
                </li>
                <li>
                    <span class="comBankIcon ccbIcon"></span>
                    <p>中国建设银行</p>
                    <input type="radio" class="com_BankRdio" name="bankRadio" value="中国建设银行"/>
                    <i class="comCirSpan"></i>
                </li>
                 <li>
                    <span class="comBankIcon bocIcon"></span>
                    <p>中国银行</p>
                    <input type="radio" class="com_BankRdio" name="bankRadio" value="中国银行"/>
                    <i class="comCirSpan"></i>
                </li>
                <li>
                    <span class="comBankIcon cmbIcon"></span>
                    <p>招商银行</p>
                    <input type="radio" class="com_BankRdio" name="bankRadio" value="招商银行"/>
                    <i class="comCirSpan"></i>
                </li>
                <li>
                    <span class="comBankIcon psbcIcon"></span>
                    <p>中国邮政储蓄银行</p>
                    <input type="radio" class="com_BankRdio" name="bankRadio" value="中国邮政储蓄银行"/>
                    <i class="comCirSpan"></i>
                </li>
                <li>
                    <span class="comBankIcon commIcon"></span>
                    <p>交通银行</p>
                    <input type="radio" class="com_BankRdio" name="bankRadio" value="交通银行"/>
                    <i class="comCirSpan"></i>
                </li>
                <li>
                    <span class="comBankIcon citicIcon"></span>
                    <p>中信银行</p>
                    <input type="radio" class="com_BankRdio" name="bankRadio" value="中信银行"/>
                    <i class="comCirSpan"></i>
                </li>
                <li>
                    <span class="comBankIcon zzyhIcon"></span>
                    <p>郑州银行</p>
                    <input type="radio" class="com_BankRdio" name="bankRadio" value="郑州银行"/>
                    <i class="comCirSpan"></i>
                </li>
                <li>
                    <span class="comBankIcon cmbcIcon"></span>
                    <p>中国民生银行</p>
                    <input type="radio" class="com_BankRdio" name="bankRadio" value="中国民生银行"/>
                    <i class="comCirSpan"></i>
                </li>
                <li>
                    <span class="comBankIcon cebIcon"></span>
                    <p>中国光大银行</p>
                    <input type="radio" class="com_BankRdio" name="bankRadio" value="中国光大银行"/>
                    <i class="comCirSpan"></i>
                </li>
                <li>
                    <span class="comBankIcon cibIcon"></span>
                    <p>兴业银行</p>
                    <input type="radio" class="com_BankRdio" name="bankRadio" value="兴业银行"/>
                    <i class="comCirSpan"></i>
                </li>
                <li>
                    <span class="comBankIcon spdbIcon"></span>
                    <p>浦发银行</p>
                    <input type="radio" class="com_BankRdio" name="bankRadio" value="浦发银行"/>
                    <i class="comCirSpan"></i>
                </li>
                <li>
                    <span class="comBankIcon gdbIcon"></span>
                    <p>广发银行</p>
                    <input type="radio" class="com_BankRdio" name="bankRadio" value="广发银行"/>
                    <i class="comCirSpan"></i>
                </li>
                <li>
                    <span class="comBankIcon hxbankIcon"></span>
                    <p>华夏银行</p>
                    <input type="radio" class="com_BankRdio" name="bankRadio" value="华夏银行"/>
                    <i class="comCirSpan"></i>
                </li>
            </ul>
        </div>
        <div class="selBankBtn" tapmode onclick="saveSelBankName()">确定</div>
    </div>
	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript"
		src="../weChat/reception/jsPlugin/jquery.min.js"></script>
	<script type="text/javascript"
		src="../weChat/reception/jsPlugin/aui-dialog.js"></script>
	<script type="text/javascript"
		src="../weChat/reception/jsPlugin/layer/layer.js"></script>
	<script type="text/javascript" src="../weChat/reception/jsPlugin/ydui.flexible.js"></script>
    <script type="text/javascript" src="../weChat/reception/jsPlugin/ydui.citys.js"></script>
    <script type="text/javascript" src="../weChat/reception/jsPlugin/ydui.js"></script>
	<script type="text/javascript">
		$(function(){
			var cliHei = document.documentElement.clientHeight;
			$("body").height(cliHei)
		});
		!function () {
            var $target = $('#selBankLocInp');
            $target.citySelect();
            $target.on('click', function (event) {
                event.stopPropagation();
                $target.citySelect('open');
            });
            $target.on('done.ydui.cityselect', function (ret) {
                $(this).val(ret.provance + ' ' + ret.city + ' ' + ret.area);
            });
        }();
		function selectBank(){
			var cliHei = $(window).height();
			console.log(cliHei)
            $("#bankWrapper").css({
            	"height":cliHei,
                "-webkit-transform":"translateX(0)",
                "transform":"translateX(0)"
            });
            selBank();
        }
        function selBank(){
            var cliHei = $(window).height();
            $("#bankRel").height(cliHei - $(".headerNav").height() - 35);
            $(".com_BankRdio").each(function(i){
                $(this).click(function(){
                    if($(".cirB").length > 0){
                        $(".cirB").remove();
                    }
                    $("#hideInpBank").val($(this).val());
                    $(".comCirSpan").eq(i).append("<b class=cirB></b>");
                });
            });
        }
        function closeSelBank(){
            $("#bankWrapper").css({
                "-webkit-transform":"translateX(100%)",
                "transform":"translateX(100%)"
            });
            if($(".cirB").length > 0){
                $(".cirB").remove();
            }
        }
        function saveSelBankName(){
            if($("#hideInpBank").val() == ""){
                dialog("请选择银行");
                return;
            }
            $("#bankWrapper").css({
                "-webkit-transform":"translateX(100%)",
                "transform":"translateX(100%)"
            });
            $("#selBankInp").val($("#hideInpBank").val());
        }
		function saveBank(){
			var selBankInpVal = $.trim($("#selBankInp").val());
			var bankLocaInpVal = $.trim($("#selBankLocInp").val());
			var personNameInpVal = $.trim($("#personNameInp").val());
			var bankNumInpVal = $.trim($("#bankNumInp").val());
			var bankNameZhiInpVal = $.trim($("#bankNameZhiInp").val());
			var id = $.trim($("#userId").val());
			if(selBankInpVal == ""){
				dialog('开户行名称不能为空');
                return;
			}else if(bankLocaInpVal == ""){
                dialog('开户省不能为空');
                return;
			}else if(personNameInpVal == ""){
                 dialog('开户人姓名不能为空');
                return;
			}else if(bankNumInpVal == ""){
                dialog('银行卡号不能为空');
                return;
			}else if(bankNameZhiInpVal == ""){
				dialog('支行名称不能为空');
                return;
			}else if(!(checkBankNum()&&checkNameNum())){
				dialog('格式不正确，请从新输入！');
            	return;
			}else{
				/* window.location.href = "bindBankCard.htm?id="+$.trim($("#userId").val())+"&selBankInpVal="+selBankInpVal+
				+"&bankLocaInpVal="+bankLocaInpVal+"&personNameInpVal="+personNameInpVal+"&bankLocaInpVal="+bankLocaInpVal+"&bankLocaInpVal="+bankLocaInpVal; */
				$.ajax({
					method:'post',
					url:'bindNewBankCard.htm',
					data:{
						
						selBankInpVal:selBankInpVal,
						bankLocaInpVal:bankLocaInpVal,
						personNameInpVal:personNameInpVal,
						bankNumInpVal:bankNumInpVal,
						bankNameZhiInpVal:bankNameZhiInpVal
					},
					 success:function(data){
						 layer.msg("绑定成功",{icon: 6,time:1000},function(){
								location.href = "indexs.htm";
							});
						 /* alert("绑定成功");
						window.location.href="list.htm" */
					}, 
					error:function(data){
						layer.msg("绑定出错");
					}
				})
			}
		}
	</script>
	<script type="text/javascript">
	function checkBankNum(){
		var userId = $.trim($("#bankNumInp").val());
		var reg = /^([1-9]{1})[0-9]{10,25}/;
		var falg = true;
		if(userId != null && userId != ""){
			if(!reg.test(userId)){
				layer.tips("请输入正确的银行卡号", "#bankNumInp", {tips: [2, "#E34127"],time: 1000});
				falg = false;
			}
		}
		return falg;
	}
	
	function checkNameNum(){
		var userId = $.trim($("#personNameInp").val());
		var reg =/^[\u4E00-\u9FA5A-Za-z]+$/;
		var falg = true;
		if(userId != null && userId != ""){
			if(!reg.test(userId)){
				layer.tips("只能输入英文或中文!!", "#personNameInp", {tips: [2, "#E34127"],time: 1000});
				falg = false;
			}
		}
		return falg;
	}
	</script>
</body>
</html>