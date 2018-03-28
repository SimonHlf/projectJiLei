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
				$("#quesTypeList").load("paperRecordController/getDetail.htm?userId="+treeNode.id);
			},
		}
	};
	var nodes2 = ${nodes2};
	
	$(document).ready(function() {
		zTreeObj2 = $.fn.zTree.init($("#treeDemo2"), setting2, nodes2);
	});
</SCRIPT>
<div id="menuTable"style="float: left;width:16%;">
	<label>考生目录</label>
	<ul id="treeDemo2" class="ztree"></ul>		
</div>
<div id="quesTypeList"style="float: left; width:83%;">
	<div class="flip-scroll">
			<table
				class="table table-bordered table-striped table-condensed flip-content">
				<thead class="flip-content bordered-palegreen">
					<tr>
						<th width="44px;"><v:checkbox /></th>
						<th>考生姓名</th>
						<th>考生工号</th>
						<th>考试名称</th>
						<th>所属部门</th>
						<th>试卷名称</th>
						<th>考试时间</th>
						<th>试卷总分</th>
						<th>考生得分</th>
						<th>详情</th>
						<th>导出word</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="userRecord">
						<tr>
							<td><v:checkbox value="${userRecord.id}" /></td>
							<td>${userRecord.nick_name}</td>
							<td>${userRecord.userAttr0}</td>
							<td>${userRecord.exam_name}</td>
							<td>${userRecord.orgName}</td>
							<td>${userRecord.creatName}</td>
							<td>${userRecord.creatTime}</td>
							<td>${userRecord.attr5}分</td>
							<td>${userRecord.fen}分</td>
							<td><a href="javascript:details(${userRecord.id})">查看</a></td>
							<td><a href="javascript:daochu(${userRecord.id})">导出word</a></td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
			<c:if test="${empty list }">
		      	<div style="width:100%;height:35px;line-height:35px;text-align:center;margin-top:20px;">暂无数据!</div>	
		     </c:if>
		     <c:if test="${!empty list }">
		     	<input type="hidden" id="disRatePage" value="${page.page}">
				<v:papers page="${page}" url="paperRecordController/getDetail.htm?1=1?userId=${userId}"></v:papers>
		     </c:if>  
		</div>
	
</div>
           