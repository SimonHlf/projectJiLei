<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="aboutUs/progress/progress.js"></script>
<div class="btn-group">
    <button type="button" onclick="addItem()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delItem()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="editItem()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">公司历程</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;">
                        <v:checkbox/>
                    </th>
                    <th>
                        时间
                    </th>
                    <th>
                        内容
                    </th>
                    <th>
                        描述
                    </th>
                    <th>
                        备注
                    </th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="progress">
                        <tr>
                            <td>
                                <v:checkbox value="${progress.id}"/>
                            </td>
                            <td>
                               <a onclick="details(${progress.id})">${progress.time}</a>
                            </td>
                               <td>
                               	<c:if test="${fn:length(progress.conment) > 15}">
                               		${fn:substring(progress.conment,0,15) }...
                               	</c:if>
                               	<c:if test="${fn:length(progress.conment) <= 15}">
	                               	${progress.conment }
                               	</c:if>
                            </td>
                            <td>
                            	<c:if test="${fn:length(progress.describes) > 15}">
                               		${fn:substring(progress.describes,0,15) }...
                               	</c:if>
                               	<c:if test="${fn:length(progress.describes) <= 15}">
	                               	${progress.describes }
                               	</c:if>
                            </td>
                            <td>
                            	<c:if test="${fn:length(progress.remark) > 15}">
                               		${fn:substring(progress.remark,0,15) }...
                               	</c:if>
                               	<c:if test="${fn:length(progress.remark) <= 15}">
	                               	${progress.remark }
                               	</c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="companybasic/progress/list.htm?1=1"></v:pagination>
    </div>
    </div>
</div>