<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="examination/quesType/disrate.js"></script>
<script>
	var results='${result}';
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
				 /* if(results=='true'){  */
					$("#quesTypeList").load("QuesTypeController/getQuesTypeByOrg.htm?pid=" + treeNode.id);
				 /* } 
				 if(results=='false'){
					$("#quesTypeList").load("QuesTypeController/sonList.htm?pid=" + treeNode.id);
				}  */
			},
		}
	};
	var nodes = ${nodes};
	
	$(document).ready(function() {
		zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, nodes);
	});
	

</script>
<div class="btn-group" style="float: left;">
	<input type="hidden" value="${result },${insId}">
	<button type="button" onclick="addDisRate(${result},${insId})"
		class="btn btn-info">
		<i class="fa fa-plus"></i> 添加
	</button>
	<button type="button" onclick="delDisRate()" class="btn btn-danger">
		<i class="fa fa-minus"></i> 删除
	</button>
	<button type="button" onclick="updateDisRate()" class="btn btn-primary">
		<i class="fa fa-pencil"></i> 修改
	</button>
	<!-- <button type="button" onclick="searchItem()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button> -->

</div>
<div style="margin-top: 6px;">
	<form id="searchItemForm" method="post">
		<div class="row">
			<div class="form-group col-lg-4">
				<!-- <div class=" input-group">
                        <span class="input-group-addon">按级别名称查找</span>
                        <input type="text" name="name"  class="form-control" placeholder="按级别名称查找">
                    </div> -->
			</div>
		</div>
	</form>
</div>
<div class="widget">

	<div class="widget-body">
		<div class="row">
			<div class="clearfix"
				style="width: 16%; float: left; margin-left: 5px;">

				<%-- <c:if test="${result=='false'}">
					<div>
						<label style="font-size: 15px">题库分类目录</label>
					</div>
				</c:if> --%>

				<%-- <c:if test="${result=='true'}">
					<label>部门目录</label>
				</c:if> --%>
				<%-- <c:if test="${result=='false'}">
					<div>
						<label style="font-size: 3px"><a
							style="margin-left: 20px;" href="javascript:chakans(${insId})">${paperTypeName}</a></label>
					</div>
				</c:if> --%>
				<input id="insId" type="hidden" value="${insId}" />
				<ul id="treeDemo" class="ztree"></ul>
			</div>

			<!-- <div id="menuTableAndQuesTypeList" style="width:83%;float:left;"> -->
			<!-- <div id="menuTable" style="float: left; padding: 10px;width:16%;"></div> -->
			<div class="widget-body" id="quesTypeList"
				style="float: left; width: 83%; float: left;">
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
					<c:if test="${empty list}">
						<div style="width:100%;height:35px;line-height:35px;text-align:center;margin-top:20px;">暂无数据!</div>
					</c:if>
					<c:if test="${not empty list}">
						<v:papers page="${page}"
								  url="QuesTypeController/getAllFnYe.htm?1=1"></v:papers>
					</c:if>


				</div>
				<!-- </div> -->
				<!-- </div> -->
			</div>
		</div>
	</div>