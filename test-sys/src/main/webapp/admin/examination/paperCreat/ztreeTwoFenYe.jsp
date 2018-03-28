<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/quesType/disrate.js"></script>
		<div class="col-lg-10 col-sm-10 col-xs-10" id="menuBody">
            	 <table class="table table-bordered table-striped table-condensed flip-content">
                        <thead class="flip-content bordered-palegreen">
                        <tr>
                            <th width="44px;"><v:checkbox/></th>
                            <th>试卷名称</th>
                            <!-- <th>所属机构</th> -->
                            <!-- <th>所属分类</th> -->
                            <th>生成方式</th>
                            <th>试卷类型</th>
                            <th>查看试题</th>
                            <!-- <th>状态</th> -->
                            <th>创建时间</th>
                            <th>修改时间</th>
                            <th>创建人</th>
                            <th>修改人</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="paperCreat">
                            <tr>
                                <td><v:checkbox value="${paperCreat.id}"/></td>
                                <td>${paperCreat.name}</td>
                                <%-- <c:forEach items="${windyOrgList}" var="windyOrg"> --%>
                                	<%-- <c:if test="${windyOrg.id==paperCreat.insId}"> --%>
                                		<%-- <td>${paperCreat.orgName}</td> --%>
                                	<%-- </c:if> --%>
                               <%--  </c:forEach> --%>
                                <%-- <c:forEach items="${paperTypeList}" var="paperType">
                                	<c:if test="${paperType.id==paperCreat.paper_type_id}">
                                		<td>${paperType.name}</td>
                                	</c:if>
                                </c:forEach> --%>
                                <c:if test="${paperCreat.sets==0}">
                                	<td>自动</td>
                                </c:if>
                                <c:if test="${paperCreat.sets==1}">
                                	<td>手动</td>
                                </c:if>
                                
                                <c:if test="${paperCreat.types==0}">
                                	<td>练习</td>
                                </c:if>
                                <c:if test="${paperCreat.types==1}">
                                	<td>考试</td>
                                </c:if>
                                
                                <c:if test="${paperCreat.sets==0}">
                                	<td>考生考试时自动生成，无法查看试题</td>
                                </c:if>
                                 <c:if test="${paperCreat.sets==1}">
                                	 <td><a href="javascript:chakan(${paperCreat.id})">查看试题</a></td>
                                </c:if>
                               
                               
                               <%--  <c:if test="${paperCreat.statuss==0 }">
                                	<td>预览</td>
                                </c:if>
                                <c:if test="${paperCreat.statuss==1 }">
                                	<td>确定</td>
                                </c:if> --%>
                                <td>${paperCreat.creat_time}</td>
                                <td>${paperCreat.change_time}</td>
                                <td>${paperCreat.creat_by}</td>
                                <td>${paperCreat.change_by}</td>
                                
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
               

            <input type="hidden" id="DisrelationshipPage" value="${page.page}">
            <v:pagination page="${page}" url="PaperCreatController/getFenyeToMain.htm?1=1"></v:pagination>
        </div>
           