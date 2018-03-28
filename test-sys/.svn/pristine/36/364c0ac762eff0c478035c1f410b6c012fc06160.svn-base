<%@page pageEncoding="utf-8"%>
<SCRIPT>
	var zTreeObj;
	var setting = {
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
				$("#userBody").load("sys/role/userList.htm?id=" + treeNode.id);
			},
		}
	};
	var nodes = ${nodes};
	
	$(document).ready(function() {
		zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, nodes);
	});
</SCRIPT>
				<div class="col-lg-2 col-sm-2 col-xs-2" >
					<ul id="treeDemo" class="ztree"></ul>
				</div>
				<div class="col-lg-10 col-sm-10 col-xs-10" id="userBody">
					<table class="table table-bordered table-striped table-condensed flip-content">
						<thead class="flip-content bordered-palegreen">
							<tr>
								<th width="44px;"><v:checkbox /></th>
								<th>名称</th>
								<th>编码</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="user">
								<tr>
									<td><v:checkbox value="${user.id}" /></td>
									<td>${user.name}</td>
									<td>${user.code}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				<%-- 	<v:page pages="${page.pageTotal}" curr="${page.page}"
						url="sys/menu/list.htm?1=1"></v:page> --%>
						 <v:pagination page="${page}" url="sys/menu/list.htm?1=1"></v:pagination>
				</div>
