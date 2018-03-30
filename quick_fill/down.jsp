<%@page import="cn.windy.module.quick.hibernate.model.FontUser"%>
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="footer">
    <%String cmd = request.getParameter("cmd");%>
    <ul class="clearfix">
    	<c:if test="${sessionScope.fontUser.type == '1'}">
	    	 <li class="threeWid <%=(cmd.equals("1")) ? "active":""%>"><a class="homeA" href="${pageContext.request.contextPath}/weChat/index.jsp">
	            <span></span>
	            <p>首页</p>
	        </a></li>
	        <li class="threeWid <%=(cmd.equals("2")) ? "active":""%>"><a class="chargeA" href="${pageContext.request.contextPath }/weChat/Charge/chargeTableList.htm">
	            <span></span>
	            <p>充电中</p>
	        </a></li>
	        <li class="threeWid <%=(cmd.equals("3")) ? "active":""%>" ><a class="scanA" href="${pageContext.request.contextPath }/weChat/scanCode.htm">
	            <span></span>
	            <p>扫一扫</p>
	        </a></li>
    	</c:if>
    	<c:if test="${sessionScope.fontUser.type == '2' || sessionScope.fontUser.type == '3'}">
    		<li class="fourWid <%=(cmd.equals("1")) ? "active":""%>"><a class="homeA" href="${pageContext.request.contextPath}/weChat/index.jsp">
	            <span></span>
	            <p>首页</p>
	        </a></li>
	        <li class="fourWid <%=(cmd.equals("2")) ? "active":""%>"><a class="chargeA" href="${pageContext.request.contextPath }/weChat/Charge/chargeTableList.htm">
	            <span></span>
	            <p>充电中</p>
	        </a></li>
	        <li class="fourWid <%=(cmd.equals("3")) ? "active":""%>" ><a class="scanA" href="${pageContext.request.contextPath }/weChat/scanCode.htm">
	            <span></span>
	            <p>扫一扫</p>
	        </a></li>
	        <li class="fourWid <%=(cmd.equals("4")) ? "active":""%>" ><a class="setA" href="${pageContext.request.contextPath}/weChat/settingCount.htm">
	            <span></span>
	            <p>设置</p>
	        </a></li>
    	</c:if>
    </ul>
</div>
