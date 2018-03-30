<%@ page language="java" 
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.font{
	color:red;
}
</style>
	<div><input id="sock1" type="hidden" name="sock1" value="${userInfo.useraccount }"></div>
	<script src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		var hostname = window.location.host;
		var webSocket = null;
		var tryTime = 0;
		var username = '';
		$(function() {
			username = $("#sock1").val();
			initSocket();
			$("#my a").attr("href","javascript:mymsg('"+username+" ')");
			window.onbeforeunload = function() { };
		}); 
		
		
		function initSocket() {
			//判断当前浏览器是否支持WebSocket
			if (!window.WebSocket) {
				alert("您的浏览器不支持WebSocket");
				return false;
			}

			webSocket = new WebSocket("ws://"+hostname+"${pageContext.request.contextPath }/websocket/ws/" + username+".htm");

			//连接成功建立的回调方法
			webSocket.onopen = function(event) {
				 webSocket.send("hello"); 
				
			};
			//接收到消息的回调方法
			webSocket.onmessage = function(event) {
				
				var msg = event.data;
				msg = eval("("+msg+")");
				$("#my a").html("我的消息");
				if(!jQuery.isEmptyObject(msg)){
					$("#my a").html("我的消息 <b>·</b>");
				}
				
			};
			//连接发生错误的回调方法
			webSocket.onerror = function(event) { };
			
			//连接关闭的回调方法
			webSocket.onclose = function() {
				if (tryTime < 10) {
					setTimeout(function() {
						webSocket = null;
						tryTime++;
						initSocket();
					}, 500);
				} else {
					tryTime = 0;
				}
			};
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
