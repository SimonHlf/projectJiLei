<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="shop/productCategory/productCategory.js"></script>
<link href="assets/css/zTreeStyle.css" rel="stylesheet" />
<script src="assets/js/jquery.ztree.all.js"></script>
<script src="shop/productCategory/productCategory.js"></script>
<script src="shop/attribute/attribute.js"></script>
<script>
 var zTreeObj;
	var setting = {
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "parentId",
				rootPId : 0
			},
			key : {
				name : "shopTypeName"
				
			}
		},
		callback : {
			onClick : function(event, treeId, treeNode) {
				 //$("#productCategoryBody").load("shop/productCategory/list.htm?id=" + treeNode.id);
				$.ajax({
					type : 'post',
					data : {
						"id" : treeNode.id
					},
					url : 'shop/productCategory/ztree.htm',
					success : function(html) {
						$("#productCategoryBody").html(html);
						
					}
				});
				
			},
		}
	};
	var nodes = ${nodes};
	
	$(document).ready(function() {
		zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, nodes);
	});
 </script>



<div class="btn-group">
	<button type="button" onclick="addproductCategory()"
		class="btn btn-info">
		<i class="fa fa-plus"></i> 添加
	</button>
	<button type="button" onclick="delproductCategory()"
		class="btn btn-danger">
		<i class="fa fa-minus"></i> 删除
	</button>
	<button type="button" onclick="editproductCategory()"
		class="btn btn-primary">
		<i class="fa fa-pencil"></i> 修改
	</button>
	
	
	
</div>
<div class="widget">
	<div class="widget-header  with-footer">
		<span class="widget-caption"> <i class="fa fa-list"></i> 类别列表
		</span>
	</div>
	<div class="widget-body">
		<div class="flip-scroll">
			<div class="row">
				<div class="col-lg-2 col-sm-2 col-xs-2"
					style="border-right: 1px solid gray;">
					<ul id="treeDemo" class="ztree"></ul>
				</div>
				<div class="col-lg-10 col-sm-10 col-xs-10" id="productCategoryBody">
					<table
						class="table table-bordered table-striped table-condensed flip-content">
						<thead class="flip-content bordered-palegreen">
							<tr>
								<th width="44px;"><v:checkbox /></th>
								<th>类别名称</th>
								<th>类别图标</th>
 								<th>备注</th>
								<th>排序</th>
 								<th>描述</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:forEach items="${list}" var="productCategory">
								<tr>
									<td><v:checkbox value="${productCategory.id}" /></td>
									<td>${productCategory.shopTypeName}</td>
									<td>
									<c:if test="${fn:contains(productCategory.shopTypeLogo,'images') == false}">无</c:if>
									<c:if test="${fn:contains(productCategory.shopTypeLogo,'images') == true}"><img src="/${productCategory.shopTypeLogo}" width="30px" height="30px"></c:if>
									</td>
									<td>${productCategory.remarks}</td>
									<td>${productCategory.sort}</td>

									<td>${productCategory.description}</td>
                                   <td>
	                                   <c:if test="${productCategory.parentId != 0}">
	                                   <button type="button" onclick="attributeManager('${productCategory.id}')" class="btn  btn-info">属性管理</button>
	                                   </c:if>
                                      <c:if test="${productCategory.parentId == 0}">无</c:if>
                                   </td>
 								</tr>
							</c:forEach>
						</tbody>
					</table>
					<v:pagination page="${page}" url="shop/productCategory/list.htm?id=${id1}"></v:pagination>
				</div>
			</div>
		</div>
	</div>
</div>