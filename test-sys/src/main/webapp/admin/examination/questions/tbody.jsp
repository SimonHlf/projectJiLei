<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th style="width:50%;">试题名称 </th>
                    <th>试题分类</th>
                    <th>试题类型</th>
                    <th>所属机构</th>
                    <!-- <th>是否共享</th> -->
                    <th>详情</th>
                    <th>创建时间</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="Questions">
                    <tr>
                        <td><v:checkbox value="${Questions.id}"/></td>
                        <td style="width:50%;">${Questions.name}</td>
                        <td>${Questions.typeName}</td>
                        <c:if test="${Questions.type==0}">
                        	<td>单选题</td>
                        </c:if>
                        <c:if test="${Questions.type==1}">
                        	<td>多选</td>
                        </c:if>
                        <c:if test="${Questions.type==2}">
                        	<td>判断</td>
                        </c:if>
                        
                        <td>${Questions.orgName}</td>
                        
                       
                       <%--  <c:if test="${Questions.is_share==0}">
                        	 <td>共享</td>
                        </c:if>
                        <c:if test="${Questions.is_share==1}">
                        	 <td>不共享</td>
                        </c:if> --%>
                        
                        
                        <td><a href="javascript:xiangqing(${Questions.id},${page.page})">详情</a></td>
                        <c:if test="${Questions.creat_time!=null && Questions.creat_time!=''}">
                        <td>${Questions.creat_time}</td>
                        </c:if>
                        <c:if test="${Questions.creat_time==null || Questions.creat_time==''}">
                        <td></td>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <v:paper page="${page}" url="QuestionsController/getByFenYe.htm?1=1&quesTypeIdList=${quesTypeIdList}"></v:paper>
