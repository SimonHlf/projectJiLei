<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<title>商家帮-优惠券提现</title>
<script
	src="${pageContext.request.contextPath }/admin/assets/js/jquery-2.0.3.min.js"></script>
		<script
	src="${pageContext.request.contextPath }/admin/assets/layui/lay/modules/layer.js"></script>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css/aui.css" />
<link rel="stylesheet" href="css/aui-flex.css">
<link rel="stylesheet" href="//at.alicdn.com/t/font_480287_p8kzpu7km4w019k9.css">
<style type="text/css">
	.user-info {
		background-color: #ffffff;
		padding: 10px 0;
	}

	img.avatar {
		display: block;
		margin: 0 auto;
		width: 20%;
	}

	.aui-list .aui-list-header {
		background-color: #ffffff;
		line-height: 1.2rem;
	}
	.aui-list{
		background-image:none !important;
	}
	.applyCashInpMax::-webkit-input-placeholder{
		color:#ccc;
		font-size:0.7rem;
	}
	.applyCashInpMax{
		color:#e51c23;
	}
</style>
</head>
<body style="margin-bottom:3rem;">
	<section class="aui-content user-info aui-text-center aui-margin-b-10">
		<img src="${sessionScope.consumer.pic }" class="avatar aui-img-round">
		<h2 class="aui-margin-t-15">
			${sessionScope.consumer.name }<small><i
				class="aui-iconfont aui-icon-cert aui-text-danger"></i></small>
		</h2>
	</section>

	<section class="aui-content aui-grid aui-margin-b-10">
		<div class="aui-row">
			<div class="aui-col-xs-4 aui-border-r">
				<big class="aui-text-warning">${sessionScope.consumer.balance }<small>
						元</small></big>
				<div class="aui-gird-lable aui-font-size-12">现金余额</div>
				<input type="hidden" id="balan" value="${sessionScope.consumer.balance }">
			</div>
			<div class="aui-col-xs-4 aui-border-r">
				<big class="aui-text-danger">${sessionScope.consumer.cash }<small>
						元</small></big>
				<div class="aui-gird-lable aui-font-size-12">优惠券余额</div>
				<input type="hidden" id="cas2" value="${sessionScope.consumer.cash2 }">
			</div>
			<div class="aui-col-xs-4 aui-border-r">
				<big class="aui-text-danger">${sessionScope.consumer.insurance }<small>
						元</small></big>
				<div class="aui-gird-lable aui-font-size-12">保险金</div>
			</div>
		</div>
	</section>
	<section class="aui-content">
		<ul class="aui-list aui-list-in aui-margin-b-15">
			<li class="aui-list-item">
				<div class="aui-list-item-inner">
					<div class="aui-list-item-label-icon">
						<i class="iconfont icon-tixian aui-text-info"></i>
					</div>
					<div class="aui-list-item-label aui-font-size-14 aui-margin-r-5">
						提现金额¥:
					</div>
					<div class="aui-list-item-input">
						<input class="applyCashInpMax" type="number" id="attr9" name="attr9" placeholder="您的可申请提现额度为${sessionScope.consumer.cash2 }"  required/>
					</div>
				</div>
			</li>
			<li class="aui-list-item">
				<div class="aui-list-item-inner">
					<div class="aui-list-item-label-icon">
						<i class="iconfont icon-tixian aui-text-info"></i>
					</div>
					<div class="aui-list-item-label aui-font-size-14 aui-margin-r-5">
						卡号:
					</div>
					<div class="aui-list-item-input">
						<input class="applyCashInpMax" type="number" id="attr5" name="attr5" value="${sessionScope.consumer.attr5 }" required/>
					</div>
				</div>
			</li>
			<li class="aui-list-item">
				<div class="aui-list-item-inner">
					<div class="aui-list-item-label-icon">
						<i class="iconfont icon-kaihuyinhang aui-text-danger"></i>
					</div>
					<div class="aui-list-item-label aui-font-size-14 aui-margin-r-5">
						开户银行:
					</div>
					<div class="aui-list-item-input">
						<input type="text" id="attr8" name="attr8" value="${sessionScope.consumer.attr8 }" required>
					</div>
				</div>
			</li>
			<li class="aui-list-item">
				<div class="aui-list-item-inner">
					<div class="aui-list-item-label-icon">
						<i class="aui-iconfont aui-icon-my aui-text-success"></i>
					</div>
					<div class="aui-list-item-label aui-font-size-14 aui-margin-r-5">
						开户人:
					</div>
					<div class="aui-list-item-input">
						<input type="text" id="flag" name="flag" required>
					</div>
				</div>
			</li>
			<li class="aui-list-item">
				<div class="aui-list-item-inner">
					<div class="aui-list-item-label-icon">
						<i class="aui-iconfont aui-icon-mobile aui-text-danger"></i>
					</div>
					<div class="aui-list-item-label aui-font-size-14 aui-margin-r-5">
						手机号:
					</div>
					<div class="aui-list-item-input">
						<input type="number" id="mobile" name="mobile" required>
					</div>
					<div class="aui-list-item-btn">
						<input type="button" id="verifyCode" style="padding:0 0.2rem;" class="aui-btn aui-btn-outlined aui-btn-primary aui-btn-sm aui-font-size-12" value="获取验证码"/>
					</div>
				</div>
			</li>
			<li class="aui-list-item">
				<div class="aui-list-item-inner">
					<div class="aui-list-item-label-icon">
						<i class="iconfont icon-shoujiyanzhengma aui-text-info"></i>
					</div>
					<div class="aui-list-item-label aui-font-size-14 aui-margin-r-5">
						验证码：
					</div>
					<div class="aui-list-item-input">
						<input type="text" value="" id="phoneCode" name="phoneCode" required>
					</div>
				</div>
			</li>
			<li class="aui-list-item">
				<div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">
					<div class="aui-btn aui-btn-info aui-margin-r-5" tapmode onclick="submitCode(${sessionScope.consumer.id })">提现</div>
					<div class="aui-btn aui-btn-danger aui-margin-l-5  aui-margin-r-5" tapmode onclick="go()">取消</div>
					<!--div class="aui-btn aui-btn-success" tapmode onclick="">查看提现记录</div-->
				</div>
			</li>
		</ul>
	</section>
	<jsp:include page="nav.jsp" />
</body>
<script>
function go(){
	window.location.href="personal2.htm";
}

//比对短信验证码

function submitCode(cmd) {
	var cas2=$("#cas2").val();
	var attr5=$("#attr5").val();
	var attr9=$("#attr9").val();
	var attr8=$("#attr8").val();
	var flag=$("#flag").val();
	var mobile = $("#mobile").val();
	var phoneCode = $("#phoneCode").val();
	var value=attr9*1;
	var bankno=attr5*1;
	if(value>cas2){
		alert("对不起，申请提现额度不能大于您的优惠券可提现额度余额");
		$("#attr9").val("");
		return;
	}
	if(value < 0){
		alert("请认真填写申请提现额度");
		$("#attr9").val();
		return;
	}
	if(attr5 == null){
		alert("请填写银行卡号");
		return;
	}
	if(bankno.length<16 ||　bankno.length >19){
		alert("银行卡号长度必须在16到19之间");
		return;
	}
	var num = /^\d*$/;//全数字
	if(!num.exec(bankno)) {
	alert("银行卡号必须全为数字");
	 return ;
	 }
	  var strBin = "10,18,30,35,37,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,58,60,62,65,68,69,84,87,88,94,95,98,99";
	  if(strBin.indexOf(attr5.substring(0, 2)) == -1) {
	 alert("银行卡号开头6位不符合规范");
	 return;
	 } 
	/*    if(!luhnCheck(attr5)){
	 return ;
	 } */
	 luhnCheck(attr5);
		 $.ajax({
				method : 'post',
				url : 'comparisonPhoneCode.htm?id='+cmd,
				data : {
					attr5:attr5,
					attr9:attr9,
					attr8:attr8,
					flag:flag,
					mobile : mobile,
					code : phoneCode
				},
				success : function(data) {
					// var data=eval('(' + data + ')');
					alert(data.message);
					window.location.href="personal2.htm";
					
				}
			});
}

function luhnCheck(bankno){
    var lastNum=bankno.substr(bankno.length-1,1);//取出最后一位（与luhn进行比较）
 
     var first15Num=bankno.substr(0,bankno.length-1);//前15或18位
     var newArr=new Array();
     for(var i=first15Num.length-1;i>-1;i--){    //前15或18位倒序存进数组
         newArr.push(first15Num.substr(i,1));
     }
     var arrJiShu=new Array();  //奇数位*2的积 <9
     var arrJiShu2=new Array(); //奇数位*2的积 >9
     
     var arrOuShu=new Array();  //偶数位数组
     for(var j=0;j<newArr.length;j++){
         if((j+1)%2==1){//奇数位
             if(parseInt(newArr[j])*2<9)
             arrJiShu.push(parseInt(newArr[j])*2);
             else
             arrJiShu2.push(parseInt(newArr[j])*2);
         }
         else //偶数位
         arrOuShu.push(newArr[j]);
     }
     
     var jishu_child1=new Array();//奇数位*2 >9 的分割之后的数组个位数
     var jishu_child2=new Array();//奇数位*2 >9 的分割之后的数组十位数
     for(var h=0;h<arrJiShu2.length;h++){
         jishu_child1.push(parseInt(arrJiShu2[h])%10);
         jishu_child2.push(parseInt(arrJiShu2[h])/10);
     }        
     
     var sumJiShu=0; //奇数位*2 < 9 的数组之和
     var sumOuShu=0; //偶数位数组之和
     var sumJiShuChild1=0; //奇数位*2 >9 的分割之后的数组个位数之和
     var sumJiShuChild2=0; //奇数位*2 >9 的分割之后的数组十位数之和
     var sumTotal=0;
     for(var m=0;m<arrJiShu.length;m++){
         sumJiShu=sumJiShu+parseInt(arrJiShu[m]);
     }
     
     for(var n=0;n<arrOuShu.length;n++){
         sumOuShu=sumOuShu+parseInt(arrOuShu[n]);
     }
     
     for(var p=0;p<jishu_child1.length;p++){
         sumJiShuChild1=sumJiShuChild1+parseInt(jishu_child1[p]);
         sumJiShuChild2=sumJiShuChild2+parseInt(jishu_child2[p]);
     }      
     //计算总和
     sumTotal=parseInt(sumJiShu)+parseInt(sumOuShu)+parseInt(sumJiShuChild1)+parseInt(sumJiShuChild2);
     
     //计算luhn值
     var k= parseInt(sumTotal)%10==0?10:parseInt(sumTotal)%10;        
     var luhn= 10-k;
     
     if(lastNum==luhn){
        console.log("验证通过");
     }else{
        alert("银行卡号必须符合luhn校验");
         return;
     }        
 }

//发送短信验证码
 //var aObj=document.getElementsByClassName('tel')[0].getElementsByTagName('input')[1];
 var aObj = document.querySelector("#verifyCode");
 aObj.onclick=function (){
	 
	 var mobile = $("#mobile").val();
	if (mobile == "") {
		layer.msg("请输入您的手机号");
		return;
	}else{
		this.style.borderColor="#999";
	     this.style.color="#999";
	     this.value="倒计时60秒";
	     this.setAttribute("disabled", "disabled");
	     var num=60;
	     var clear=setInterval(function (){
	       num--;
	       aObj.value="倒计时"+num+"秒";
	       if(num==0){   
	           clearInterval(clear);
	           aObj.style.borderColor="#11ba4c";
	           aObj.style.color="#11ba4c";
	       	   aObj.value="发送验证码";
	       	   aObj.removeAttribute('disabled');
	     	}
	     },1000);
		$.ajax({
			method : 'post',
			url : 'getValidateCode.htm',
			data : {
				mobile : mobile
			},
			success : function(data) {
				 // var data = eval("(" + data + ")");
				alert(data.msg);
				
		
			}
		})
	}
	
	 
     
     
 }
</script>
</html>