<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/quesType/disrate.js"></script>
<SCRIPT>
	var zTreeObj2;
	var setting2 = {
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pid",
				rootPId : 0
			},
	    key:{
	    	url:"###"
	    }
		},
		callback : {
			onClick : function(event, treeId, treeNode) {
				$("#quesTypeList").load("QuesTypeController/sonList.htm?pid=" + treeNode.id);
			},
		}
	};
	var nodes2 = ${nodes2};
	
	$(document).ready(function() {
		zTreeObj2 = $.fn.zTree.init($("#treeDemo2"), setting2, nodes2);
	});
</SCRIPT>
<div class="col-lg-2 col-sm-2 col-xs-2" id="menuTable"style="float: left; padding: 10px">
<label>题库分类目录</label>
<ul id="treeDemo2" class="ztree"></ul>
</div>
 <div class="widget-body" id="quesTypeList"
					style="float: left; padding: 10px; width: 720px;">
					<div class="flip-scroll">
						<table
							class="table table-bordered table-striped table-condensed flip-content">
							<thead class="flip-content bordered-palegreen">
								<tr>
									<th width="44px;"><v:checkbox /></th>
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
						<input type="hidden" id="disRatePage" value="${page.page}">
						<v:papers page="${page}"
							url="QuesTypeController/getMainFenYe.htm?1=1&insId=${pid}"></v:papers>

					</div>
				</div>  