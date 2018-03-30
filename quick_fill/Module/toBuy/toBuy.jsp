<!DOCTYPE html>
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<title>加盟购买</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/toBuy/css/toBuy.css"/>
	</head>
	<body>
		<div class="feedBackDiv">
			<strong class="comStrongTit">加盟购买</strong>
			<div class="innerFeed clearfix">
				<span class="radiusSpan"></span>
				<div class="feedTxt fl">
					<p>加盟用户可致电400-6020-662，具体详情请致电后了解，或在淘宝页面搜索店铺“帝能云科技”进入了解。 </p>
					<p>客服电话工作时间为：</p>
					<p>周一至周六08:00-18:00</p>	
				</div>
				<div class="toBeYunying">
				<c:if test="${sessionScope.fontUser.attr0 == '1' }">审核中</c:if>
				<c:if test="${sessionScope.fontUser.attr0 == '2' }">恭喜您已成为运营商</c:if>
				<c:if test="${sessionScope.fontUser.attr0 == '0' }">
					<button onclick="comEditShowAlert('beYunyingDiv')">成为运营商</button>
				</c:if>
				</div>
			</div>
		</div>
		<div class="layer"></div>
		<div class="comEditDiv beYunyingDiv">
			<div class="comInnerDiv">
				<span>名<em></em>称：</span>
				<input type="text" id="name" name="name" placeholder="请输入公司名称" required/>
			</div>
			<div class="comInnerDiv">
				<span>联系人：</span>
				<input type="text" id="phoneName" name="phoneName" placeholder="请输入联系人姓名" required/>
			</div>
			<div class="comInnerDiv">
				<span>电<em></em>话：</span>
				<input type="number" id="phone" name="phone" placeholder="请输入联系电话" required/>
			</div>
			<div class="comInnerDiv">
				<span>地<em></em>址：</span>
				<input type="text" id="address" name="address" placeholder="请输入地址" required/>
				<input type="hidden" id="userId" name="userId" value="${sessionScope.fontUser.id}">
			</div>
			<div class="comInnerDiv">
				<span>开户银行：</span>
				<input type="text" id="bank" name="bank" placeholder="请输入开户银行" required/>
			</div>
			<div class="comInnerDiv">
				<span>银行卡号：</span>
				<input type="number" id="banknum" name="banknum" placeholder="请输入银行卡号" required/>
			</div>
			<p>注：</p>
			<p>1.请务必正确填写以上信息，以便尽快通过审核。</p>
			<p>2.提交后请联系厂商。</p>
			<div class="btnDiv">
				<button class="comTwoBtn twoBtn_cancel" onclick="closeAlert($('.beYunyingDiv'))">取消</button>
				<button class="comTwoBtn twoBtn_sure" onclick="submitAudit()">提交审核</button>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="../../down.jsp">
		<jsp:param value="1" name="cmd"/>
	</jsp:include>
		<div class="toast-wrap">
	    	<span class="toast-msg"></span>
	    </div> 
		<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/jsPlugin/jquery.min.js" ></script>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/tipInfo.js"></script>
		<script>
		function submitAudit(){
			var name=$("#name").val();
			var phoneName=$("#phoneName").val();
			var phone=$("#phone").val();
			var address=$("#address").val();
			var userId=$("#userId").val();
			var bank=$("#bank").val();
			var bankno=$("#banknum").val();
			if(name == null || name == "" || phoneName == null || phoneName == "" || phone == null || address == null || address == ""){
				toast("请将申请信息输入完整");
				return false;
			}
			if(isNaN(phone)){
				alert("请输入正确格式的手机号");
				return false;
			}
			
			var num = /^\d*$/;//全数字
			if(!num.exec(bankno)) {
			alert("银行卡号必须全为数字");
			 return ;
			 }
			  var strBin = "10,18,30,35,37,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,58,60,62,65,68,69,84,87,88,94,95,98,99";
			  if(strBin.indexOf(bankno.substring(0, 2)) == -1) {
			 alert("银行卡号开头6位不符合规范");
			 return false;
			 } 
			  luhnCheck(bankno);
			$.ajax({
				method:'post',
				url:'${pageContext.request.contextPath}/weChat/application.htm',
				data:{
					name:name,
					phoneName:phoneName,
					phone:phone,
					address:address,
					userId:userId,
					bank:bank,
					banknum:bankno
				},
				success:function(data){
					alert("申请成为运营商发送成功,请耐心等待审核");
					closeAlert($('.beYunyingDiv'));
					window.location.href="${pageContext.request.contextPath }/weChat/index.jsp";
				}
			})
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
		</script>
	</body>
</html>
