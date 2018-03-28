<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="shop/merchantInfo/merchantInfo.js"></script>
<div class="btn-group">
	<button type="button" onclick="addMerchant()" class="btn btn-info">
		<i class="fa fa-plus"></i> 添加
	</button>
	<button type="button" onclick="delMerchant()" class="btn btn-danger">
		<i class="fa fa-minus"></i> 删除
	</button>
	<button type="button" onclick="editMerchant()" class="btn btn-primary">
		<i class="fa fa-pencil"></i> 修改
	</button>
	<button type="button" onclick="searchMerchant()"
		class="btn btn-success">
		<i class="fa fa-search"></i> 查询
	</button>
</div>
<div style="margin-top: 6px;">
	<form id="searchMerchantForm" method="post">
		<div class="row">
			<div class="form-group col-lg-4">
				<div class=" input-group">
					<span class="input-group-addon">按门店名称查找</span> <input type="text"
						name="merchantName" value="${merchant.name}" class="form-control"
						placeholder="按门店名称查找">
				</div>
			</div>
		</div>
	</form>
</div>
<div class="widget">
	<div class="widget-header bordered-bottom bordered-themeprimary">
		<i class="widget-icon fa fa-tasks themeprimary"></i> <span
			class="widget-caption themeprimary">门店管理</span>
	</div>
	<div class="widget-body">
		<div class="flip-scroll">
			<table
				class="table table-bordered table-striped table-condensed flip-content">
				<thead class="flip-content bordered-palegreen">
					<tr>
						<th width="44px;"><v:checkbox /></th>
						<c:if test="${ownMerchant == '1' }">
							<th>商家名称</th>
						</c:if>
						<th>门店名称</th>
						<th>图片</th>
						<th>地址</th>
						<th>电话</th>
						<th>描述</th>
						<th>是否推荐</th>
						<c:if test="${ownMerchant == '1' }">
							<th>操作</th>
						</c:if>
					<%-- 	<c:if test="${!empty merList }">
							<th>审核操作</th>
						</c:if> --%>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="merchant">
						<tr>
							<td><v:checkbox value="${merchant.id}" /></td>
							<c:if test="${ownMerchant == '1' }">
								<c:forEach items="${merchantList }" var="mc">
									<c:if test="${merchant.addUser == mc.id }">
										<td>${mc.name }</td>
									</c:if>
								</c:forEach>
							</c:if>
							<td><a onclick="details(${merchant.id})">
									${merchant.merchantName}</a></td>
							<td><img src="/${merchant.attr1}"
								style="width: 30px; height: 30px;" onclick="open_(this)">
							</td>
							<td>${merchant.address}</td>
							<td>${merchant.attr0}</td>
							<td>${merchant.remark}</td>
							<td><c:if test="${merchant.attr2 == '0' }">不推荐</c:if> <c:if
									test="${merchant.attr2 == '1' }">推荐</c:if></td>
							<c:if test="${ownMerchant == '1' }">
								<td><c:if test="${merchant.attr2 == '0' }">
										<button onclick="recommend(${merchant.id})"
											class="btn btn-info">推荐</button>
									</c:if> <c:if test="${merchant.attr2 == '1' }">
										<button onclick="noRecommend(${merchant.id})"
											class="btn btn-danger">不推荐</button>
									</c:if></td>

							</c:if>
							<%-- <c:if test="${!empty merList }">
								<c:forEach items="${merList }" var="mer">
									<c:if test="${merchant.id == mer.id }">
										<td><button class="btn btn-info"
												onclick="pass(${merchant.id})">通过</button></td>
									</c:if>
								</c:forEach>
							</c:if> --%>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<v:pagination page="${page}" url="shop/merchant/list.htm?1=1"></v:pagination>
		</div>
	</div>
</div>