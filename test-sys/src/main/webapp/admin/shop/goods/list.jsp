<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="shop/goods/goods.js"></script>
<div class="btn-group">
	<button type="button" onclick="addGoods()" class="btn btn-info">
		<i class="fa fa-plus"></i> 添加
	</button>
	<button type="button" onclick="delGoods()" class="btn btn-danger">
		<i class="fa fa-minus"></i> 删除
	</button>
	<button type="button" onclick="editGoods()" class="btn btn-primary">
		<i class="fa fa-pencil"></i> 修改
	</button>
	<button type="button" onclick="searchGoods()" class="btn btn-success">
		<i class="fa fa-search"></i> 查询
	</button>
</div>
<div style="margin-top: 6px;">
	<form id="searchGoodsForm" method="post">
		<div class="row">
			<div class="form-group col-lg-4">
				<div class=" input-group">
					<span class="input-group-addon">按名字查找</span> <input type="text"
						name="name" value="${goods.name}" class="form-control"
						placeholder="按名字查找">
				</div>
			</div>
		</div>
	</form>
</div>
<div class="widget">
	<div class="widget-header bordered-bottom bordered-themeprimary">
		<i class="widget-icon fa fa-tasks themeprimary"></i> <span
			class="widget-caption themeprimary">商品列表</span>
	</div>
	<div class="widget-body">
		<div class="flip-scroll">
			<table
				class="table table-bordered table-striped table-condensed flip-content">
				<thead class="flip-content bordered-palegreen">
					<tr>
						<th width="44px;"><v:checkbox /></th>
						<c:if test="${!empty userName }">
							<th>商家名称</th>
							<th>门店名称</th>
						</c:if>
						<c:if test="${!empty merchantInfoList }">
							<th>门店名称</th>
						</c:if>
						<th>商品名称</th>
						<th>商品缩略图</th>
						<th>商品状态</th>
						<c:if test="${empty userName }">
							<th>操作</th>
						</c:if>
						<th>是否推荐</th>
						<c:if test="${!empty userName}">
							<th>操作</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="goods">
						<tr>
							<td><v:checkbox value="${goods.id}" /></td>
							<c:if test="${!empty userName }">
								<td><c:forEach items="${users }" var="user">
										<c:if test="${goods.addUser == user.id }">
										${user.name }
									</c:if>
									</c:forEach></td>
								<td><c:forEach items="${shopList }" var="shop">
										<c:if test="${goods.shopId == shop.id }">
										${shop.merchantName }
									</c:if>
									</c:forEach></td>
							</c:if>
							<c:if test="${!empty merchantInfoList }">
								<td><c:forEach items="${merchantInfoList }" var="shop">
									<c:if test="${goods.shopId == shop.id }">
										${shop.merchantName }
									</c:if>
								</c:forEach></td>
							</c:if>
							<td><a onclick="details(${goods.id})">${goods.name}</a></td>
							<td><img src="/${goods.thumbnailUrl}"
								style="width: 30px; height: 30px;" onclick="open_(this)">
							</td>
							<td><c:if test="${goods.status == 0 }">下架</c:if> <c:if
									test="${goods.status == 1 }">上架</c:if></td>
							<c:if test="${empty userName }">
								<td><c:if test="${goods.status == 0 }">
										<button onclick="putAway(${goods.id})" class="btn btn-info">上架</button>
									</c:if> <c:if test="${goods.status == 1 }">
										<button onclick="soldOut(${goods.id})" class="btn btn-danger">下架</button>
									</c:if></td>
							</c:if>
							<td><c:if test="${goods.attr2 == '0' }">不推荐</c:if> <c:if
									test="${goods.attr2 == '1' }">推荐</c:if></td>
							<c:if test="${!empty userName }">
								<td><c:if test="${goods.attr2 == '0' }">
										<button onclick="recommend(${goods.id})" class="btn btn-info">推荐</button>
									</c:if> <c:if test="${goods.attr2 == '1' }">
										<button onclick="noRecommend(${goods.id})"
											class="btn btn-danger">不推荐</button>
									</c:if></td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<v:pagination page="${page}"
				url="sfb/goods/list.htm?1=1&&merchantId=${merchantId }"></v:pagination>
		</div>
	</div>
</div>
<script>
    function open_(obj){
        layer.open({
            type: 1,
            shade: false,
            title: false,
            content: "<img src='"+$(obj).attr("src")+"' style='width:300px;height:300px;'/>"
        });
    }
</script>