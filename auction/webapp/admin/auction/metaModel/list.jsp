<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="shop/metaModel/metaModel.js"></script>
<link href="assets/css/zTreeStyle.css" rel="stylesheet" />
<script src="assets/js/jquery.ztree.all.js"></script>
<script src="auction/metaModel/metaModel.js"></script>

<script>
 var zTreeObj;
	var setting = {
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pid",
				rootPId : 0
			},
			key : {
				name : "modelname"
				
			}
		},
		callback : {
			onClick : function(event, treeId, treeNode) {
				$.ajax({
					type : 'post',
					data : {
						"id" : treeNode.id
					},
					url : 'shop/metaModelController/ztree.htm',
					success : function(html) {
						$("#metaModelBody").html(html);
						
					}
				});
				
			},
		}
	};
	var nodes = ${s};
	
	$(document).ready(function() {
		zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, nodes);
	});
 </script>



<div class="btn-group">
	<button type="button" onclick="addmetaModel()"
		class="btn btn-info">
		<i class="fa fa-plus"></i> 添加
	</button>
	<button type="button" onclick="delmetaModel()"
		class="btn btn-danger">
		<i class="fa fa-minus"></i> 删除
	</button>
	<button type="button" onclick="editmetaModel()"
		class="btn btn-primary">
		<i class="fa fa-pencil"></i> 修改
	</button>
	
</div>
<div class="widget">
	<div class="widget-header  with-footer">
		<span class="widget-caption"> <i class="fa fa-list"></i> 模块列表
		</span>
	</div>
	<div class="widget-body">
		<div class="flip-scroll">
			<div class="row">
				<div class="col-lg-2 col-sm-2 col-xs-2"
					style="border-right: 1px solid gray;">
					<ul id="treeDemo" class="ztree"></ul>
				</div>
				<div class="col-lg-10 col-sm-10 col-xs-10" id="metaModelBody">
					<table
						class="table table-bordered table-striped table-condensed flip-content">
						<thead class="flip-content bordered-palegreen">
							<tr>
								<th width="44px;"><v:checkbox /></th>
								<th>模块名称</th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:forEach items="${list}" var="n">
								<tr>
									<td><v:checkbox value="${n.id}" /></td>
									<td>${n.modelname}</td>
 								</tr>
							</c:forEach>
						</tbody>
					</table>
					<v:pagination page="${page}" url="shop/metaModelController/list.htm?1=1"></v:pagination>
				</div>
			</div>
		</div>
	</div>
</div>