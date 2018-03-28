<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/disrelationship/disrelationship.js"></script>
<div class="widget">
    <!-- <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">部门统计分析表</span>
    </div> -->
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
                    <select>
                        <option value="">请选择部门</option>
                        <option value="">机务运用车间</option>
                        <option value="">机务检修车间</option>
                        <option value="">机务设备车间 </option>
                    </select>
                    <button type="button" class="btn  btn-info">考试实到、未到</button>
                    <button type="button" class="btn  btn-success">补考人数</button>
                    <button type="button" class="btn  btn-danger">达标信息</button>
                    <div style="margin-top:20px;">
                        <img src="${pageContext.request.contextPath}/admin/assets/img/03.png"/>
                        <img src="${pageContext.request.contextPath}/admin/assets/img/02.png"/>
                        <img src="${pageContext.request.contextPath}/admin/assets/img/01.png"/>
                    </div>
                <%--</c:otherwise>--%>
            <%--</c:choose>--%>

            <input type="hidden" id="DisrelationshipPage" value="${page.page}">
            <v:pagination page="${page}" url="disrelationship/list.htm?1=1"></v:pagination>
        </div>
    </div>
</div>