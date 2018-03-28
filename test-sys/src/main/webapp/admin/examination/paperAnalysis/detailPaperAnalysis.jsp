<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/disrelationship/disrelationship.js"></script>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">试卷分析查看详情</span>
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
            <div style="content: '';display: block;overflow: hidden;clear: both;">
                <div style="width: 50%;float: left">
                    <img style="width: 100%;" src="${pageContext.request.contextPath}/admin/assets/img/07.jpg"/>
                </div>
                <div style="width: 50%;float: left">
                    <img style="width: 100%;" src="${pageContext.request.contextPath}/admin/assets/img/08.jpg"/>
                </div>
            </div>
            <div>
                <p>历次试题做错人数统计</p>
                <img src="${pageContext.request.contextPath}/admin/assets/img/04.jpg"/>
            </div>

            <%--</c:otherwise>--%>
            <%--</c:choose>--%>

            <input type="hidden" id="DisrelationshipPage" value="${page.page}">
            <v:pagination page="${page}" url="disrelationship/list.htm?1=1"></v:pagination>
        </div>
    </div>
</div>