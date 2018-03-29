<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/weChat/reception/jsPlugin/aui-dialog.js"></script>
<footer class="footer">
		<ul class="clearfix">
			<li <c:if test="${gotype==1 }">class="active"</c:if>> 
				<a href="${pageContext.request.contextPath }/lotterts/reception.htm">
					<p id="balance"><c:choose>
					       <c:when test="${frontUser eq null}">
					             	0.0
					       </c:when>
					       <c:otherwise>
					             ¥<span id="balances">${frontUser.balance }</span>
					       </c:otherwise>
					</c:choose></p>
					<p>首页</p>
				</a>
				<%-- <fmt:formatNumber type="number" value="${frontUser.balance } " pattern="0.00" maxFractionDigits="2"/> --%>
			</li>
			<li <c:if test="${gotype==2 }">class="active"</c:if>><a href="javascript:void(0)" onclick="gocharge()">
				<p><i class="iconfont icon-chongzhi"></i></p>
				<p>充值</p>
			</a></li>
			<li <c:if test="${gotype==3 }">class="active"</c:if>><a href="javascript:void(0)" onclick="withdrawsCash()">
				<p><i class="iconfont icon-tixian"></i></p>
				<p>提现</p>
			</a></li>
			<li <c:if test="${gotype==4 }">class="active"</c:if>><a href="javascript:void(0)" onclick="toRecord()">
				<p><i class="iconfont icon-touzhujilu"></i></p>
				<p>下注记录</p>
			</a></li>
			<%-- ${pageContext.request.contextPath }/personal/list.htm --%>
			<li <c:if test="${gotype==5 }">class="active"</c:if>><a href="javascript:void(0)" onclick="personal()">
				<p><i class="iconfont icon-wode"></i></p>
				<p>个人中心</p>
			</a></li>
		</ul>
	</footer>
<script type="text/javascript">
$(function(){
})
/* function personal(){
	$.ajax({
		method:'post',
		url:'${pageContext.request.contextPath }/personal/loginCheck.htm',
		data:{
			  
		    },				
		success:function(data){
			
			var data = eval("(" + data + ")");
			
			if(data.message=='success'){
				
				location.href = "${pageContext.request.contextPath }/personal/indexs.htm";
			}else{
				layer.alert(data.result, {
						skin: "my-skin",
						closeBtn: 1
					}, function(){
						location.href = "${pageContext.request.contextPath }/personal/setLoginName.htm";   
					});
			}
   
		},
		error : function() {
			alert("登录出错！！！");
		}
	})
}
 */
 
 function personal(){

		location.href = "${pageContext.request.contextPath }/personal/indexs.htm";
	}
 function gocharge(){

		location.href = "${pageContext.request.contextPath }/personal/gocharge.htm";
	}
 function withdrawsCash(){

		location.href = "${pageContext.request.contextPath }/personal/withdrawsCash.htm";
	}
 
/* function gocharge(){
	$.ajax({
		method:'post',
		url:'${pageContext.request.contextPath }/personal/loginCheck.htm',
		data:{
			  
		    },				
		success:function(data){
			
			var data = eval("(" + data + ")");
			
			if(data.message=='success'){
				
				location.href = "${pageContext.request.contextPath }/personal/gocharge.htm";
			}else{
				layer.alert(data.result, {
					skin: "my-skin",
					closeBtn: 1
				}, function(){
					location.href = "${pageContext.request.contextPath }/personal/setLoginName.htm";   
				});
				
			}
   
		},
		error : function() {
			alert("登录出错！！！");
		}
	})
} */

/* function withdrawsCash(){
	$.ajax({
		method:'post',
		url:'${pageContext.request.contextPath }/personal/loginCheck.htm',
		data:{
			  
		    },				
		success:function(data){
			
			var data = eval("(" + data + ")");
			
			if(data.message=='success'){
				
				location.href = "${pageContext.request.contextPath }/personal/withdrawsCash.htm";
			}else{
				layer.alert(data.result, {
					skin: "my-skin",
					closeBtn: 1
				}, function(){
					location.href = "${pageContext.request.contextPath }/personal/setLoginName.htm";   
				});
				
			}
   
		},
		error : function() {
			alert("登录出错！！！");
		}
	})
} */
//跳转下注记录
function toRecord(){
	$.ajax({
		method:'post',
		url:'${pageContext.request.contextPath }/personal/loginCheck.htm',
		data:{
			  
		    },				
		success:function(data){
			
			var data = eval("(" + data + ")");
			
			if(data.message=='success'){
				
				location.href = "${pageContext.request.contextPath }/lotrecodes/findByLoss1.htm";
			}else{
				dialogCb(data.result,'暂不绑定','去完善资料',function(){
					location.href = "${pageContext.request.contextPath }/personal/bindPhoneNums.htm";
				});
			}
   
		},
		error : function() {
			dialog("登录出错");
		}
	})
}

function reception(){
	$.ajax({
		method:'post',
		url:'${pageContext.request.contextPath }/personal/loginCheck.htm',
		data:{
			  
		    },				
		success:function(data){
			
			var data = eval("(" + data + ")");
			
			if(data.message=='success'){
				
				location.href = "${pageContext.request.contextPath }/lotterts/reception.htm";
			}else{
				dialogCb(data.result,'暂不绑定','去完善资料',function(){
					location.href = "${pageContext.request.contextPath }/personal/bindPhoneNums.htm";
				});
			}
   
		},
		error : function() {
			dialog("登录出错");
		}
	})
}
</script>