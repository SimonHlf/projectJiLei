<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/quesType/disrate.js"></script>

  		<div class="flip-scroll" id="menuTable">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>分类名称</th>
                    <th>所属机构</th>
                    <th>创建时间</th>
                    
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${quesTypeList}" var="QuesType">
                    <tr>
                        <td><v:checkbox value="${QuesType.id}"/></td>
                        <td>${QuesType.name}</td>
                        <td>${QuesType.orgName}</td>
                        <td>${QuesType.creat_time}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <c:if test="${empty quesTypeList }">
		      	<div style="width:100%;height:35px;line-height:35px;text-align:center;margin-top:20px;">暂无数据!</div>	
		     </c:if>
		     <c:if test="${!empty quesTypeList }">
		     	<input type="hidden" id="disRatePage" value="${page.page}">
            	<v:papers page="${page}" url="QuesTypeController/getAllFnYe.htm?1=1"></v:papers>
		     </c:if>
        
        </div>  
    
