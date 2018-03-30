<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="editAttributeValueForm">
				<input type="hidden" name="id" value="${attributeValue.id}">
				<%-- <div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">类别</label>
					<div class="col-sm-9">
						<select name="categoryId1" id="s1"
							onchange="sc(this.options[this.options.selectedIndex].value)">
							<option>请选择一级分类</option>
							<c:forEach var="c" items="${prc}">
							<c:if test="${pcCategory.parentId == c.id}">
									<option value="${c.id}" selected>${c.shopTypeName}</option>
								</c:if>
								<c:if test="${pcCategory.parentId != c.id}">
									<option value="${c.id}">${c.shopTypeName}</option>
								</c:if>
								
							</c:forEach>
						</select> 
						<select id="s2" name="categoryId"
							onchange="sk(this.options[this.options.selectedIndex].value)">
							<c:forEach var="er" items="${erpc}">
							<c:if test="${attribute.cid == er.id}">
								<option value="${er.id}" selected>${er.shopTypeName}</option>
							</c:if>
							</c:forEach>
						</select> 
						<select id="s3" name="attrId">
						<!-- <option>请选择属性</option> -->
						
						<c:forEach var="a" items="${attributeList}">
							<c:if test="${attributeValue.attrId == a.id}">
								<option value="${a.id}" selected>${a.name}</option>
							</c:if>
						</c:forEach>
						
						</select>
					</div>
				</div> --%>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">属性名称</label>
					<div class="col-sm-9">
						<input class="form-control" id="vName" name="vName"
							placeholder="属性名称" value="${attribute.attrName}" readonly="readonly" >
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">属性值名字</label>
					<div class="col-sm-9">
						<input class="form-control" id="valueName" name="valueName"
							value="${attributeValue.valueName}" placeholder="属性值名字" required>
					</div>
				</div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">状态</label>
                    <div class="col-sm-9">
                        <v:items type="status" id="status" name="status" value="${attributeValue.status }"/>
                    </div>
                </div>
                <input type="hidden"  name="creater" value="${attributeValue.creater}">
                <input type="hidden"  name="updater" value="${attributeValue.updater}">
                <input type="hidden"  name="createTime" value="${attributeValue.createTime}">
                <input type="hidden"  name="updateTime" value="${attributeValue.updateTime}">
			</form>
		</div>
	</div>
</div>
