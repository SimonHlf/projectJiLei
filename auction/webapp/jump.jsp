<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="cn.windy.module.weChat.hibernate.model.WeChatSetting" %>
<%@page import="cn.windy.module.weChat.service.cache.WeChatSettingCache" %>
<%@page import="java.net.URLEncoder" %>
<%
	String vid = request.getParameter("merchantId");
	
	WeChatSetting setting = WeChatSettingCache.getSetting();
	String url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+setting.getAppid()+"&redirect_uri=%s&response_type=" +
	        "code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
	
	String jump_url = "http://"+request.getServerName()+request.getContextPath()+"/weChat/directScancode.htm?merchantId="+vid;
	
	url = String.format(url,URLEncoder.encode(jump_url,"utf-8"));
	
	response.sendRedirect(url);
%>