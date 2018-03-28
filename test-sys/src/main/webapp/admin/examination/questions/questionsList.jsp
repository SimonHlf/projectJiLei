<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/questions/disrate.js"></script>
<script>
</script>
 <div class="flip-scroll">
     <table class="table table-bordered table-striped table-condensed flip-content">
         <thead class="flip-content bordered-palegreen">
         <tr>
             <th width="44px;"><v:checkbox/></th>
             <th style="width:50%;">试题名称 </th>
             <th>所属机构</th>
             <th>试题类型</th>
             <th>试题分类</th>
             <!-- <th>是否共享</th> -->
             <th>详情</th>
             <th>创建时间</th>
         </tr>
         </thead>
         <tbody>
         <c:forEach items="${list}" var="Questions">
             <tr>
                 <td><v:checkbox value="${Questions.id}"/></td>
                 <td style="width:50%;">
                  <c:choose>
                   <c:when  test="${fn:contains(Questions.name,'image')}">
                   	<img src="/${Questions.name}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
                   </c:when >
                   <c:otherwise>
                   	 ${Questions.name }
                   </c:otherwise>
                 	</c:choose>
                 </td>
                 <td>${Questions.typeName}</td>
                 <c:if test="${Questions.type==0}">
                 	<td>单选题</td>
                 </c:if>
                 <c:if test="${Questions.type==1}">
                 	<td>多选题</td>
                 </c:if>
                 <c:if test="${Questions.type==2}">
                 	<td>判断题</td>
                 </c:if>
                 <td>${Questions.orgName}</td>
                 <td><a href="javascript:xiangqing(${Questions.id},${page.page})">详情</a></td>
                 <c:if test="${Questions.creatTime!=null && Questions.creatTime!=''}">
                 <td>${Questions.creatTime}</td>
                 </c:if>
                 <c:if test="${Questions.creatTime==null || Questions.creatTime==''}">
                 <td></td>
                 </c:if>
             </tr>
         </c:forEach>
         </tbody>
     </table>
     <c:if test="${empty list }">
      	<div style="width:100%;height:35px;line-height:35px;text-align:center;margin-top:20px;">暂无数据!</div>	
     </c:if>
     <c:if test="${!empty list }">
     	<input type="hidden" id="disRatePage" value="${page.page}">
     	<v:papers page="${page}" url="QuestionsController/sonList.htm?1=1&pid=${pid}&name=${name}&level=${level }"></v:papers>
     </c:if>
 </div>
        
        