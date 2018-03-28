<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/questions/disrate.js"></script>
        <div class="flip-scroll" id="quesTypeList">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                  <th>题名称</th>
                  <th>出题总数(个)</th>
                  <th>正确总数(个)/正确率(%)</th>
                  <th>错误总数(个)/错误率(%)</th>
                  <th>操作</th>
                </tr>
                </thead>
                <tbody>
                	<c:forEach items="${list}" var="list">
                         <tr>
                             <td>
                             	<c:choose>
	                        <c:when  test="${fn:contains(list.name,'image')}">
	                        	<img src="/${list.name}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
	                        </c:when >
	                        <c:otherwise>
	                        	 ${list.name }
	                        </c:otherwise>
                       	</c:choose>
                             </td>
                             <td align="center">${list.count }</td>
                             <td align="center">${list.countTrue }/${list.correctRate }%</td>
                             <td align="center">${list.countErrir }/${list.errorRate }%</td>
                             <td align="center"><a onclick="xq(${list.id});">详情</a></td>
                         </tr>
                     </c:forEach> 
                </tbody>
            </table>
             <c:if test="${empty list }">
				 <div style="width:100%;height:35px;line-height:35px;text-align:center;margin-top:20px;">暂无数据!</div>	
		     </c:if>
		     <c:if test="${!empty list }">
		     		<input type="hidden" id="disRatePage" value="${page.page}">
            		<v:papers page="${page}" url="analysis/sonList.htm?1=1&orgId=${orgId}&level=${level }"></v:papers>
		     </c:if> 
        </div>
        
        