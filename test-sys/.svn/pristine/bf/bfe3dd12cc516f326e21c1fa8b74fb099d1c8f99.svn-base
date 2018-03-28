<%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <style type="text/css">
#content {
	display: block;
	margin: 0 auto;
	overflow: hidden;
	font-size: 14px;
	height: 500px;
	line-height: 24px;
	padding: 2px;
}
</style> -->
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addGoodsForm">
				<div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">商品类别</label>
						<div class="col-sm-9">
							<!-- <input class="form-control" id="categoryId" name="categoryId"
								placeholder="商品类别" required> -->
								<select name="categoryId">
                                    <option value="0">请选择商品类别</option>
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
								placeholder="名称" required>
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
								placeholder="市场价">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">现价</label>
						<div class="col-sm-9">
							<input class="form-control" id="price" name="price"
								placeholder="现价">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">成本价</label>
						<div class="col-sm-9">
							<input class="form-control" id="costPrice" name="costPrice"
								placeholder="成本价">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">商品状态</label>
						<div class="col-sm-9">
								<v:items type="shopStatus" id="shopStatus" name="status"></v:items>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">商铺</label>
						<div class="col-sm-9">
							 <select name="shopId">
                                    <option value="0">请选择商铺</option>
                                    <c:forEach var="shop" items="${shopList }">
                                    <option value="${shop.id }">${shop.merchantName }</option>
                                    </c:forEach>
                                </select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">是否推荐</label>
						<div class="col-sm-9">
							<v:items type="isHot" id="isHot" name="attr2"></v:items>
						</div>
					</div>
					<div class="form-group">
							<div class="col-sm-11">
								<textarea name="content" id="content" placeholder="内容"></textarea>
							</div>
						</div>
				</div>
			</form>
			<script>
				$(document)
				.ready(
						function() {
							UE.delEditor("content");
							var ue = UE.getEditor('content', {
								initialFrameHeight : 430
							});
						});
				</script>
		</div>
	</div>
</div>

