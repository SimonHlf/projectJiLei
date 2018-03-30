<%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post"
				id="addAttributeValueForm" enctype="multipart/form-data">
				<%-- <div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">类别</label>
					<div class="col-sm-9">
						<select name="categoryId1" id="s1"
							onchange="sc(this.options[this.options.selectedIndex].value)">
							<option>请选择一级分类</option>
							<c:forEach var="c" items="${pc}">
								<option value="${c.id}">${c.shopTypeName}</option>
							</c:forEach>
						</select> 
						<select id="s2" name="categoryId"
							onchange="sk(this.options[this.options.selectedIndex].value)">
							<option>请选择二级分类</option>
						</select> 
						<select id="s3" name="attrId">
						
						</select>
					</div>
				</div> --%>
				<input type="hidden" value="${attribute.id}" name="attrId" >
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">属性名称</label>
					<div class="col-sm-9">
						<input class="form-control" id="vName" name="vName"
							placeholder="属性名称" value="${attribute.attrName}" readonly="readonly" >
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">属性值名称</label>
					<div class="col-sm-9">
						<input class="form-control" id="valueName" name="valueName"
							placeholder="属性值名称" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">状态</label>
					<div class="col-sm-9">
						<v:items type="status" id="status" name="status" />
					</div>
				</div>

			</form>
		</div>
	</div>
</div>

