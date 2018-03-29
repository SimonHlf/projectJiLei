/*function setLoginName(){
	window.location.href = "setLoginName.htm";
}	*/
//头像昵称设定
function setNickName(){
	$.ajax({
		method:'post',
		url:'loginCheck.htm',
		data:{},				
		success:function(data){
			
			var data = eval("(" + data + ")");
			
			if(data.message=='success'){
				
				location.href = "setNickName.htm";
			}else{
				dialogCb(data.result,'暂不绑定','去完善资料',function(){
					location.href = "bindPhoneNums.htm";
				});
			}
   
		},
		error : function() {
			dialog("网络出错");
		}
	})
}
//密码设置
function setPassword(){	
	$.ajax({
		method:'post',
		url:'loginCheck.htm',
		data:{},				
		success:function(data){
			
			var data = eval("(" + data + ")");
			
			if(data.message=='success'){
				
				location.href = "setPassword.htm";
			}else{
				dialogCb(data.result,'暂不绑定','去完善资料',function(){
					location.href = "bindPhoneNums.htm";
				});
			}
   
		},
		error : function() {
			dialog("网络出错");
		}
	})
}
//绑定银行卡	
function bindBankCard(){
	$.ajax({
		method:'post',
		url:'loginCheck.htm',
		data:{},				
		success:function(data){
			
			var data = eval("(" + data + ")");
			
			if(data.message=='success'){
				
				location.href = "bindBankCard.htm";
			}else{
				dialogCb(data.result,'暂不绑定','去完善资料',function(){
					location.href = "bindPhoneNums.htm";
				});
			}
   
		},
		error : function() {
			dialog("网络出错");
		}
	})
}
//绑定支付宝
function bindBankCard2(){
	
	$.ajax({
		method:'post',
		url:'loginCheck.htm',
		data:{},				
		success:function(data){
			
			var data = eval("(" + data + ")");
			
			if(data.message=='success'){
				
				location.href = "bindBankCards.htm";
			}else{
				dialogCb(data.result,'暂不绑定','去完善资料',function(){
					location.href = "bindPhoneNums.htm";
				});
			}
   
		},
		error : function() {
			dialog("网络出错");
		}
	})
}
//绑定微信
function bindBankCard3(){
	
	$.ajax({
		method:'post',
		url:'loginCheck.htm',
		data:{},				
		success:function(data){
			
			var data = eval("(" + data + ")");
			
			if(data.message=='success'){
				
				location.href = "bindBankCardss.htm";
			}else{
				dialogCb(data.result,'暂不绑定','去完善资料',function(){
					location.href = "bindPhoneNums.htm";
				});
			}
   
		},
		error : function() {
			dialog("网络出错");
		}
	})
}
//账变记录
function accChangeRecord(){
	$.ajax({
		method:'post',
		url:'loginCheck.htm',
		data:{},				
		success:function(data){
			
			var data = eval("(" + data + ")");
			
			if(data.message=='success'){
				
				location.href = "bindBankCard.htm";
			}else{
				dialogCb(data.result,'暂不绑定','去完善资料',function(){
					location.href = "bindPhoneNums.htm";
				});
			}
   
		},
		error : function() {
			dialog("网络出错");
		}
	})
	
}
//盈亏报表
function teamProfitLoss(){
	
	$.ajax({
		method:'post',
		url:'loginCheck.htm',
		data:{
			  
		    },				
		success:function(data){
			
			var data = eval("(" + data + ")");
			
			if(data.message=='success'){
				
				location.href = "teamProfitLoss.htm";
			}else{
				dialogCb(data.result,'暂不绑定','去完善资料',function(){
					location.href = "bindPhoneNums.htm";
				});
				
			}
   
		},
		error : function() {
			dialog("网络出错");
		}
	})
	
}
//账变记录
/*function bindChangeCounds(){
	
	$.ajax({
		method:'post',
		url:'loginCheck.htm',
		data:{
			  
		    },				
		success:function(data){
			
			var data = eval("(" + data + ")");
			
			if(data.message=='success'){
				
				location.href = "find1.htm";
			}else{
				dialogCb(data.result,'暂不绑定','去完善资料',function(){
					location.href = "bindPhoneNums.htm";
				});
				
			}
   
		},
		error : function() {
			dialog("网络出错");
		}
	})
	
}*/

//用户管理
function userManager(){
	$.ajax({
		method:'post',
		url:'loginCheck.htm',
		data:{
			  
		    },				
		success:function(data){
			
			var data = eval("(" + data + ")");
			
			if(data.message=='success'){
				
				location.href = "userManager.htm";
			}else{
				dialogCb(data.result,'暂不绑定','去完善资料',function(){
					location.href = "bindPhoneNums.htm";
				});
			}
   
		},
		error : function() {
			dialog("网络出错");
		}
	})
	
}