<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/questions/disrate.js"></script>

    	
    	
    	<div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>试题名称 </th>
                    <!-- <th>试题分类</th> -->
                    <th>试题分类</th>
                    <th>所属机构</th>
                    <th>试题类型</th>
                    <th>是否共享</th>
                    <!-- <th>详情</th> -->
                    <th>创建时间</th>
                </tr>
                </thead>
                <tbody>
                	 
                    	<c:forEach items="${questionsList}" var="questions">
                    	<tr>
                    		<td><v:checkbox value="2"/></td>
                        	<td>${questions.name}</td>
                        	<td>${questions.typeName}</td>
                        	<td>${questions.orgName}</td>
                        	<!-- <td>考试</td> -->
                        	<c:if test="${questions.type==0}">
                        		<td>单选题</td>
                        	</c:if>
                       	 	<c:if test="${questions.type==1}">
                        		<td>多选题</td>
                        	</c:if>
                        	<c:if test="${questions.type==2}">
                        		<td>判断题</td>
                        	</c:if>
                       		
                       		<c:if test="${questions.is_share==0}">
                       			<td>分享</td>
                       		</c:if>
                       		<c:if test="${questions.is_share==1}">
                       			<td>不分享</td>
                       		</c:if>
                       		<td>${questions.creat_time}</td>	
                       		</tr>
                    	</c:forEach>
                </tbody>
            </table>
            <input type="hidden" id="disRatePage" value="${page.page}">
            <v:pagination page="${page}" url="QuestionsController/getList.htm?1=1"></v:pagination>
        </div>
  
    