<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/disrelationship/disrelationship.js"></script>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">考生统计分析查看详情</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <%--<c:choose>--%>
            <%--<c:when test="${empty list}">--%>
            <%--<br>--%>
            <%--<br>--%>
            <%--<p align="center">暂无信息</p>--%>
            <%--<br>--%>
            <%--<br>--%>
            <%--</c:when>--%>
            <%--<c:otherwise>--%>
            <div style="margin-top:20px;">
                <img src="${pageContext.request.contextPath}/admin/assets/img/06.jpg"/>

            </div>
            <%--</c:otherwise>--%>
            <%--</c:choose>--%>

            <input type="hidden" id="DisrelationshipPage" value="${page.page}">
            <v:pagination page="${page}" url="disrelationship/list.htm?1=1"></v:pagination>
        </div>
    </div>
</div>