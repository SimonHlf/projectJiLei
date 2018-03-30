<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post"
				id="editAttrValueProductForm">
				<input type="hidden" name="id" value="${pav.id}">
				<input type="hidden" name="productId" value="${pav.productId}">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">属性</label>
					<div class="col-sm-9">
						<c:forEach var="attribute" items="${attr}">
							<div>${attribute.attrName}:
								<v:attrvalue aid="${attribute.id}" name="${attribute.attrName}"
									list="${attrval}" vlist="${padl}"></v:attrvalue>
							</div>
						</c:forEach>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">库存</label>
					<div class="col-sm-9">
						<input class="form-control" id="stock" name="stock"
							value="${pav.stock}" placeholder="库存" type="number" required>
					</div>
				</div>
								<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">价格</label>
					<div class="col-sm-9">
						<input class="form-control" id="parentPrice" name="parentPrice"
							value="${pav.parentPrice}" placeholder="价格" type="number" required>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
