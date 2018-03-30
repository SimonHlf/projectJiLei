<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>申请提现</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/withdrawCash.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/pagination.css"/>
	</head>
<body>
	<div id="content">
		<!-- 顶部副导航 -->
		<%@ include file="../../head.jsp"%>  
		<!-- 个人中心内容 -->
		<div class="personalCenCon clearfix w1100">
			<%@ include file="personalHead.jsp" %>
			<div class="rightPersonal fr">
				<strong class="rightTit"><span></span>申请提现</strong>
				<div class="rightCon" style="position: relative;">
					<div class="yongjinListNav">
						<ul class="clearfix">
							<li class="active"><a href="javascript:void(0)">申请提现</a></li>
							<li><a href="javascript:void(0)">提现记录</a></li>
						</ul>
					</div>
					<!-- 申请提现 -->
					<div class="drawCashWrap" style="display: block;">
						<!-- 申请提现 -->
						<div class="comDrawCash">
							<!-- 提现类型 -->
							<div class="drawCashType">
								<input type="hidden" id="nowTypeInp" value="1" />
								<label for="yuEInp">
									<span class="radiusSpan selActSpan"><em></em></span>
									<p>余额提现</p>
									<input type="radio" id="yuEInp" checked onclick="getType(this,'yue')" name="type" value="1" />
								</label>
								<label for="jifenInp">
									<span class="radiusSpan"><em></em></span>
									<p>积分提现</p>
									<input type="radio" id="jifenInp" onclick="getType(this,'jifen')" name="type" value="2" />
								</label>
							</div>
						</div>	
						<div class="drawCashDet clearfix">
							<div class="commonDiv">
								<span id="tixianTit">提现金额：</span>
								<input type="text" onkeyup="clearNoNum(this)" name="money" id="money" placeholder="请输入提现金额" />
								<b id="canDrawCash">可提现金额<strong>${fuserInfo.parentmoney }</strong>元</b>
							</div>
							<div class="commonDiv margRi">
								<span>姓<span class="oneBlank"></span>名：</span>
								<input type="text" name="name" id="name" placeholder="请输入提现人姓名" />
							</div>
							<div class="commonDiv" onclick="showSelBank()">
								<span class="fl">银行名称：</span>
								<p id="selBank" class="fl noSelColor">请选择银行</p>
								<em class="triBot"></em>
							</div>
							<div class="commonDiv margRi">
								<span>银行卡号：</span>
								<input type="text" id="cardNo" name="cardNo" maxlength="23" placeholder="请输入银行卡号"  onkeyup="formatBankNo(this)" />
								<input type="text" id="pattbBankNum" readonly />
							</div>
							<div class="commonDiv">
								<span>手机号码：</span>
								<input type="text" name="phone" id="phone" maxlength="11" placeholder="请输入手机号码" />
							</div>
							<div class="fl" style="width:100%;text-align: center;">
								<button class="tixianBtn" onclick="tx()">提现</button>
							</div>
						</div>
					</div>
					<!-- 提现记录 -->
					<div class="drawCashWrap">
						<div class="hisNav">
							<ul class="clearfix">
								<li class="hisWid1">提现方式</li>
								<li class="hisWid1">提现金额</li>
								<li class="hisWid2">提现时间</li>
								<li class="hisWid1">提现状态</li>
								<li class="hisWid1">操作</li>
							</ul>		
						</div>
						<ul id="ulListCon" class="hisListCon"></ul>
						<div id="Pagination" class="pagination"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="layer"></div>
		<!-- 银行选择  -->
		<div class="bankBox">
			<div class="topWin">
	    		<p class="shenqing txind">选择银行</p>
	    		<a href="javascript:void(0)" class="closeWins" onclick="closeBankWin();"></a>
	    	</div>
	    	<div class="bankMidWin">
	    		<ul>
	    			<li class="hotBank-list ICBC" title="中国工商银行">
	    				<input type="radio" class="com_BankRdio" name="bankRadio" value="中国工商银行"/>
	    			</li>
	    			<li class="hotBank-list ABC" title="中国农业银行">
	    				<input type="radio" class="com_BankRdio" name="bankRadio" value="中国农业银行"/>
	    			</li>
	    			<li class="hotBank-list CCB" title="中国建设银行">
	    				<input type="radio" class="com_BankRdio" name="bankRadio" value="中国建设银行"/>
	    			</li>
	    			<li class="hotBank-list CMB" title="招商银行">
	    				<input type="radio" class="com_BankRdio" name="bankRadio" value="招商银行"/>
	    			</li>
	    			<li class="hotBank-list BOC" title="中国银行">
	    				<input type="radio" class="com_BankRdio" name="bankRadio" value="中国银行"/>
	    			</li>
	    			<li class="hotBank-list PSBC" title="中国邮政储蓄银行">
	    				<input type="radio" class="com_BankRdio" name="bankRadio" value="中国邮政储蓄银行"/>
	    			</li>
	    			<li class="hotBank-list COMM" title="交通银行">
	    				<input type="radio" class="com_BankRdio" name="bankRadio" value="交通银行"/>
	    			</li>
	    			<li class="hotBank-list CITIC" title="中信银行">
	    				<input type="radio" class="com_BankRdio" name="bankRadio" value="中信银行"/>
	    			</li>
	    			<li class="hotBank-list CMBC" title="中国民生银行">
	    				<input type="radio" class="com_BankRdio" name="bankRadio" value="中国民生银行"/>
	    			</li>
	    			<li class="hotBank-list CEB" title="中国光大银行">
	    				<input type="radio" class="com_BankRdio" name="bankRadio" value="中国光大银行"/>
	    			</li>
	    			<li class="hotBank-list CIB" title="兴业银行">
	    				<input type="radio" class="com_BankRdio" name="bankRadio" value="兴业银行"/>
	    			</li>
	    			<li class="hotBank-list SPDB" title="浦发银行">
	    				<input type="radio" class="com_BankRdio" name="bankRadio" value="浦发银行"/>
	    			</li>
	    			<li class="hotBank-list GDB" title="广发银行">
	    				<input type="radio" class="com_BankRdio" name="bankRadio" value="广发银行"/>
	    			</li>
	    			<li class="hotBank-list HXBANK" title="华夏银行">
	    				<input type="radio" class="com_BankRdio" name="bankRadio" value="华夏银行"/>
	    			</li>
	    		</ul>
	    	</div>
		</div>
		</div>
		<%@ include file="../../foot.jsp"%>  
		<script src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery.pagination.js"></script>
		<script src="${pageContext.request.contextPath }/web/Module/personalCen/js/showDetailCon.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			var pageSize = '${page.pageSize}';
			var totalListNum = '${page.total}';
			
			$(function(){
				bigTabSwitch('drawCashWrap');
				bankNumPattern();
				showPageMBInfo('');
			});
			
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
					url : "${pageContext.request.contextPath }/web/withdrawCashController/toWithPage.htm",
					success : function(html) {
						$("#ulListCon").html(html);
					}
				});
			}	
			function bankNumPattern(){
				var oBankNum = getId("cardNo");
				var oPattBankNum = getId("pattbBankNum");
				oBankNum.onkeydown=function(e){
					if(!isNaN(this.value.replace(/[ ]/g,""))){         
						setTimeout(function(){
							oPattBankNum.value =oBankNum.value.replace(/\s/g,'').replace(/(\d{4})(?=\d)/g,"$1 ");//鍥涗綅鏁板瓧涓€缁勶紝浠ョ┖鏍煎垎鍓�     
						},30);
						
					}else{         
						if(e.keyCode==8){
							return true;         
						}else{
							return false;        
						}
					}
				};
				oBankNum.onfocus = function(){
					oPattBankNum.style.display="block";
					oPattBankNum.value =oBankNum.value.replace(/\s/g,'').replace(/(\d{4})(?=\d)/g,"$1 ");//鍥涗綅鏁板瓧涓€缁勶紝浠ョ┖鏍煎垎鍓�     
				};
				oBankNum.onblur = function(){
					oPattBankNum.style.display="none";
				};
			}
			function clearWord(){
				var oBankNum = getId("bankNo");
				var oPattBankNum = getId("pattbBankNum");
				oBankNum.value=oPattBankNum.value.replace(/\D/g,'');
				oPattBankNum.value = oPattBankNum.value.replace(/\D/g,'').replace(/(\d{4})(?=\d)/g,"$1 ");
			}
			function getType(obj,options){
				$(".radiusSpan").removeClass("selActSpan");
				$(obj).parent().find("span").addClass("selActSpan");
				$("#nowTypeInp").val($(obj).val());
				if(options == "yue"){//余额提现
					$("#canDrawCash").html("可提现金额<strong>${fuserInfo.parentmoney}</strong>元");
					$("#tixianTit").html("提现金额：");
				}else{//积分提现
					$("#canDrawCash").html("可提现积分<strong>${fuserInfo.parentintegral}</strong>分，积分兑换比例<strong>${ratio.ratio}:${ratio.rmb}</strong>");
					$("#tixianTit").html("提现积分：");
				}
			}
			
			 function clearNoNum(obj) {  
			        obj.value = obj.value.replace(/[^\d.]/g,""); //清除"数字"和"."以外的字符  
		            obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字而不是  
		            obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的  
		            obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");  
		            obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'); //只能输入两个小数  
			}  
			 
			function showSelBank(){
				$(".layer").show();
				$(".bankBox").show();
				selThisBank();
			}
			function closeBankWin(){
				$(".layer").hide();
				$(".bankBox").hide();
			};
			function selThisBank(){
				$(".com_BankRdio").each(function(i){
					$(this).click(function(){
						$("#selBank").removeClass("noSelColor").html($(this).val());
						$(".layer").hide();
						$(".bankBox").hide();
					});
				});
			}
			
			function tx(){
				var parentmoney = '${fuserInfo.parentmoney}';
				var parentintegral = '${fuserInfo.parentintegral}';
				var obj = document.getElementsByName("type");
				var type = "";
				for(var i=0;i<obj.length;i++){
					if(obj[i].checked){
						type=obj[i].value;
					}
				}
				var cardName = "";
				var obj1 = document.getElementsByName("bankRadio");
				for(var i=0;i<obj1.length;i++){
					if(obj1[i].checked){
						cardName=obj1[i].value;
					}
				}
				var money = $("#money").val();
				var name = $("#name").val();
				var cardNo = $("#cardNo").val();
				var phone = $("#phone").val();
				if(money=='' || name=='' || cardNo=='' || phone==''){
					alert('请将数据填写完整');
					return;
				}
				var regPhone = /^[1][3,4,5,7,8][0-9]{9}$/;  
				if(!regPhone.test(phone)){
					alert('手机号格式不正确')
					return;
				}
					
				$.ajax({
					type : "post",
					data:{money:money,name:name,cardNo:cardNo,phone:phone,type:type,cardName:cardName},
					url : "${pageContext.request.contextPath }/web/withdrawCashController/add.htm",
					success : function(html) {
						if(html==0){
							alert('余额不足');
						}else if(html==1){
							alert('积分不足');
						}else{
							alert('新增成功');
							location.href='${pageContext.request.contextPath }/web/withdrawCashController/toWith.htm';
						}
					}
				});
			}
			
			
			function formatBankNo (BankNo){
			    if (BankNo.value == "") return;
			    var account = new String (BankNo.value);
			    account = account.substring(0,23); /*帐号的总数, 包括空格在内 */
			    if (account.match (".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}") == null){
			        /* 对照格式 */
			        if (account.match (".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}|" + ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}|" +
			        ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}|" + ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}") == null){
			            var accountNumeric = accountChar = "", i;
			            for (i=0;i<account.length;i++){
			                accountChar = account.substr (i,1);
			                if (!isNaN (accountChar) && (accountChar != " ")) accountNumeric = accountNumeric + accountChar;
			            }
			            account = "";
			            for (i=0;i<accountNumeric.length;i++){    /* 可将以下空格改为-,效果也不错 */
			                if (i == 4) account = account + " "; /* 帐号第四位数后加空格 */
			                if (i == 8) account = account + " "; /* 帐号第八位数后加空格 */
			                if (i == 12) account = account + " ";/* 帐号第十二位后数后加空格 */
			                if (i == 16) account = account + " ";
			                account = account + accountNumeric.substr (i,1)
			            }
			        }
			    }else{
			        account = " " + account.substring (1,5) + " " + account.substring (6,10) + " " + account.substring (14,18) + "-" + account.substring(18,25);
			    }
			    if (account != BankNo.value) BankNo.value = account;
			}
			

			function message(username){
				mymsg(username);
			}
			
			function mymsg(str){
				$.ajax({
					type:'post',
					data:"username="+str,
					url:'${pageContext.request.contextPath}/web/tuimsgController/getPersonTuimsg.htm',
					success:function(data){
						$("#content").html(data);	
					},
					error:function(data){
					}
				});			
			}
		</script>
	</body>
</html>
