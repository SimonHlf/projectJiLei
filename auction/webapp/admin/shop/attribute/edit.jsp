<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="editAttributeForm">
				<input type="hidden" name="id" value="${attribute.id}">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">类别</label>
					<div class="col-sm-9">
						<input class="form-control" id="cname" name="cname" readonly="readonly" value="${pCategory.shopTypeName}"
							required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">名称</label>
					<div class="col-sm-9">
						<input class="form-control" id=attrName name="attrName"
							value="${attribute.attrName}" placeholder="名称" required>
					</div>
				</div>
				<%-- <div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">类别</label>
					<div class="col-sm-9">
						<select name="categoryId1" id="s1"
							onchange="sc(this.options[this.options.selectedIndex].value)">
							<option>一级分类</option>
							<c:forEach var="c" items="${pc}">
								<c:if test="${pcCategory.parentId == c.id}">
									<option value="${c.id}" selected>${c.shopTypeName}</option>
								</c:if>
								<c:if test="${pcCategory.parentId != c.id}">
									<option value="${c.id}">${c.shopTypeName}</option>
								</c:if>
								
								
							</c:forEach>
						</select> <select id="s2" name="cid">
								<c:forEach var="c" items="${erpc}">                                                                    }">
								<c:if test="${attribute.cid == c.id}">
									<option value="${c.id}" selected>${c.shopTypeName}</option>
								</c:if>

								</c:forEach>
						</select>
					</div>
				</div> --%>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">状态</label>
					<div class="col-sm-9">
						<v:items type="status" id="status" name="status" value="${attribute.status }"/>
					</div>
				</div>
				<input type="hidden"  name="creater" value="${attribute.creater}"> 
				<input type="hidden" name="updater"  value="${attribute.updater}">
				<input type="hidden" name="createTime" value="${attribute.createTime}">
				<input type="hidden" name="updateTime" value="${attribute.updateTime}">
			</form>
		</div>
	</div>
</div>
