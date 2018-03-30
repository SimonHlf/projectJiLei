<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<table class="table table-bordered table-striped table-condensed flip-content">
    <thead class="flip-content bordered-palegreen">
    <tr>
        <th width="44px;">
            <v:checkbox/>
        </th>
        <th>
            模块名
        </th>
        <th>
            链接地址
        </th>
       <!--  <th>
            父类
        </th> -->
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="footer">
         <tr>
             <td><v:checkbox value="${footer.id}"/></td>
             <td>${footer.modelName}</td>
             <td>${footer.hrefs }</td>
            <%--  <td>
             	<c:choose>
             		<c:when test="${footer.pid==0 }">
             			没有父类
             		</c:when>
             		<c:otherwise>
             			
             		</c:otherwise>
             	</c:choose>
             </td> --%>
         </tr>
    </c:forEach>
    </tbody>
</table>
<v:pagination page="${page}" url="auction/footer/list.htm?1=1&pid=${pid }"></v:pagination>