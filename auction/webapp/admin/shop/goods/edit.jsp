<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="editGoodsForm">
				<input type="hidden" name="id" value="${goods.id}">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">商品类别</label>
					<div class="col-sm-9">
						<select name="categoryId">
							<option value="${goods.categoryId }">${categoryName }</option>
							<c:forEach var="category" items="${categoryList }">
								<option value="${category.id }">${category.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">名称</label>
					<div class="col-sm-9">
						<input class="form-control" id="name" name="name"
							value="${goods.name}" placeholder="名称" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">商品缩略图</label>
					<div class="col-sm-9">
						<input type="file" name="file" multiple data-min-file-count="1"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">市场价</label>
					<div class="col-sm-9">
						<input class="form-control" id="marketPrice" name="marketPrice"
							value="${goods.marketPrice}" placeholder="市场价">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">现价</label>
					<div class="col-sm-9">
						<input class="form-control" id="price" name="price"
							value="${goods.price}" placeholder="现价">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">成本价</label>
					<div class="col-sm-9">
						<input class="form-control" id="costPrice" name="costPrice"
							value="${goods.costPrice}" placeholder="成本价">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">商铺</label>
					<div class="col-sm-9">
						<select name="shopId">
							<option value="${goods.shopId }">${sh }</option>
							<c:forEach var="shop" items="${shopList }">
								<option value="${shop.id }">${shop.merchantName }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div>
						<div class="col-sm-11">
							<textarea name="content" id="content">${goods.content}</textarea>
						</div>
					</div>
				</div>
			</form>
			<script>
				$(function() {
					var height = ($(document).height() - 430);
					UE.delEditor('content');
					UE.getEditor('content', {
						initialFrameHeight : height,
						autoHeightEnabled : false
					});
				})
			</script>
		</div>
	</div>
</div>
