<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<table class="table table-bordered table-striped table-condensed flip-content">
    <thead class="flip-content bordered-palegreen">
    <tr>
        <th width="44px;"><v:checkbox/></th>
        <th>试题名称 </th>
        <!-- <th>试题分类</th> -->
        <th>试题类型</th>
        <!-- <th>是否共享</th> -->
        <th>详情</th>
        <th>创建时间</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${questionsList}" var="questions">
        <tr>
            <th width="44px;"><v:checkbox value="${questions.id}"/></th>
            <td>${questions.name}</td>
            <c:if test="${questions.type==0}">
                <td>单选题</td>
            </c:if>
            <c:if test="${questions.type==1}">
                <td>多选题</td>
            </c:if>
            <c:if test="${questions.type==2}">
                <td>判断题</td>
            </c:if>

                <%-- <c:if test="${questions.isShare==0}">
                 <td>分享</td>
                 </c:if>
                 <c:if test="${questions.isShare==1}">
                     <td>不分享</td>
                 </c:if> --%>

            <td><a href="javascript:xiangqing(${questions.id},${page.page})">详情</a></td>

            <td>${questions.creat_time}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<input type="hidden" id="disRatePage" value="${page.page}">
<c:if test="${empty questionsList }">
    <div style="width:100%;height:35px;line-height:35px;text-align:center;margin-top:20px;">暂无数据!</div>
</c:if>
<c:if test="${not empty questionsList}">
    <v:paper page="${page}" url="PaperCreatController/getPaperQuerTbody.htm?1=1&typeId=${typeId}&paperCreatId=${paperCreatId}"/>
</c:if>
