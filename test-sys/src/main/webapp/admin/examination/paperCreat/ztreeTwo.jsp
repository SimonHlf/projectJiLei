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
                            <th>试卷详情</th>
                            <!-- <th>所属机构</th> -->
                            <!-- <th>所属分类</th> -->
                            <!-- <th>生成方式</th>
                            <th>试卷类型</th> -->
                            <th>查看试题</th>
                            <!-- <th>状态</th> -->
                            <th>创建时间</th>
                            
                             <!--<th>修改时间</th> -->
                            <!-- <th>创建人</th>
                            <th>修改人</th> -->
                             <th>是否预览</th>
                            <th>导出word</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="paperCreat">
                            <tr>
                                <td><v:checkbox value="${paperCreat.id}"/></td>
                                <td>${paperCreat.name}</td>
                                <td><a href="javascript:chakanxianqing(${paperCreat.id},${page.page})">试卷详情</a></td>
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
                                <%-- <c:if test="${paperCreat.sets==0}">
                                	<td>自动</td>
                                </c:if>
                                <c:if test="${paperCreat.sets==1}">
                                	<td>手动</td>
                                </c:if> --%>
                                
                              <%--   <c:if test="${paperCreat.types==0}">
                                	<td>练习</td>
                                </c:if>
                                <c:if test="${paperCreat.types==1}">
                                	<td>考试</td>
                                </c:if> --%>
                                
                                <c:if test="${paperCreat.sets==0}">
                                	<td>自动生成，无法查看</td>
                                </c:if>
                                 <c:if test="${paperCreat.sets==1}">
                                	 <td><a href="javascript:chakan(${paperCreat.id})">查看试题</a></td>
                                </c:if>
                               
                               
                               <%--  <c:if test="${paperCreat.statuss==1 }">
                                	<td>确定</td>
                                </c:if> --%>
                               <td>${paperCreat.creat_time}</td>
                                 <%-- <td>${paperCreat.change_time}</td> --%>
                                <%-- <c:if test="${paperCreat.statuss==0 }"> --%>
                                	<td><a href="javascript:yulan(${paperCreat.id},${paperCreat.sets})">预览</a></td>
                                <%-- </c:if> --%>
                               <%--  <c:if test="${paperCreat.statuss==1}">
                                	<td>暂不提供预览</td>
                                </c:if> --%>
                                <td><a href="javascript:dayin(${paperCreat.id})">导出word</a></td>
                                <%-- <td>${paperCreat.creat_by}</td>
                                <td>${paperCreat.change_by}</td> --%>
                                
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
               

            <input type="hidden" id="DisrelationshipPage" value="${page.page}">
            <c:if test="${empty list }">
                <div style="width:100%;height:35px;line-height:35px;text-align:center;margin-top:20px;">暂无数据!</div>
            </c:if>
            <c:if test="${not empty list}">
                <v:paperCreat page="${page}" url="PaperCreatController/twoZtree.htm?1=1&pid=${pid}"></v:paperCreat>
            </c:if>

       </div> 
           