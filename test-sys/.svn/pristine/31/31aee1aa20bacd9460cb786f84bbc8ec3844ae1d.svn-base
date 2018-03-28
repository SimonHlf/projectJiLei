<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<c:choose>
    <c:when test="${empty list}">
        <br>
        <br>
        <p align="center">暂无信息</p>
        <br>
        <br>
    </c:when>
    <c:otherwise>
        <table class="table table-bordered table-striped table-condensed flip-content">
            <thead class="flip-content bordered-palegreen">
            <tr>
                <th width="44px;"><v:checkbox/></th>
                <th>考生手机号</th>
                <th>考生姓名</th>
                <th>工号</th>
                <th>性别</th>
                <th>出生日期</th>
                <th>头像</th>
                <th>所属部门</th>
                <th>注册时间</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="frontUser">
                <tr>
                    <td><v:checkbox value="${frontUser.user_id}"/></td>
                    <td title="${frontUser.cell_phone}">${frontUser.cell_phone}</td>
                    <td title="${frontUser.nick_name}">${frontUser.nick_name}</td>
                    <td title="${frontUser.attr0}">${frontUser.attr0}</td>
                    <c:if test="${frontUser.sex==1}">
                        <td>男</td>
                    </c:if>
                    <c:if test="${frontUser.sex==0}">
                        <td>女</td>
                    </c:if>
                    <c:if test="${empty frontUser.sex }">
                        <td>信息暂缺</td>
                    </c:if>
                    <td title="${frontUser.birthday}">${frontUser.birthday}</td>
                    <td>
                        <c:choose>
                            <c:when test="${empty frontUser.head_portrait}">
                                <img style="width: 50px;height: 50px" src="${pageContext.request.contextPath}/admin/assets/img/mourentouxiang.jpg" onclick="open_(this)" alt="">
                            </c:when>
                            <c:otherwise>
                                <img src="/${frontUser.head_portrait}" style="width: 50px;height: 50px" alt="暂无图片"
                                     onclick="open_(this)">
                            </c:otherwise>
                        </c:choose>
                        <%--<img src="/${frontUser.head_portrait}" style="width: 50px;height: 50px" alt="暂无图片"
                             onclick="open_(this)">--%>
                    </td>
                    <td>${frontUser.name}</td>
                    <td title="${frontUser.reg_time}">${frontUser.reg_time}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <input type="hidden" id="FrontUserPage" value="${page.page}">
        <v:paper page="${page}" url="frontuser/ztreeMenuTable.htm?1=1&orgId=${orgId}"/>
        <%--<v:pagination page="${page}" url="frontuser/ztreeMenuTable.htm?1=1&orgId=${orgId}"></v:pagination>--%>
    </c:otherwise>
</c:choose>
