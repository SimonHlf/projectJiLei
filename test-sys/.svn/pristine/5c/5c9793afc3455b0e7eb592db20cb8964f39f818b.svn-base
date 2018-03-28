<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/quesType/disrate.js"></script>
		<div class="col-lg-10 col-sm-10 col-xs-10" id="menuBody">
            	 <table class="table table-bordered table-striped table-condensed flip-content">
                        <thead class="flip-content bordered-palegreen">
                        <tr>
                            <th width="44px;"><v:checkbox/></th>
                            <th>分类名称</th>
									<!-- <th>试题分类</th> -->
									<!-- <th>试题类型</th> -->
									<th>所属机构</th>
									<!-- <th>是否共享</th> -->
									<!-- <th>详情</th> -->
									<th>创建时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="Questions">
									<tr>
										<td><v:checkbox value="${Questions.id}" /></td>
										<td>${Questions.name}</td>
										<td>${Questions.orgName}</td>
										<c:if
											test="${Questions.creat_time!=null && Questions.creat_time!=''}">
											<td>${Questions.creat_time}</td>
										</c:if>
										<c:if
											test="${Questions.creat_time==null || Questions.creat_time==''}">
											<td></td>
										</c:if>
									</tr>
								</c:forEach>
                        </tbody>
                    </table>
               

            <input type="hidden" id="DisrelationshipPage" value="${page.page}">
			<c:if test="${empty list }">
				<div style="width:100%;height:35px;line-height:35px;text-align:center;margin-top:20px;">暂无数据!</div>
			</c:if>
			<c:if test="${not empty list}">
				<v:papers page="${page}" url="QuesTypeController/getMainFenYe.htm?1=1&insId=${insId}"></v:papers>
			</c:if>

        </div>
           