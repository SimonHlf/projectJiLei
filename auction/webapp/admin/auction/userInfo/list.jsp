<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script src="auction/userInfo/userInfo.js"></script>
<div class="btn-group">
	<button type="button" onclick="addFUserInfo()" class="btn btn-info">
		<i class="fa fa-plus"></i> 添加
	</button>
	<button type="button" onclick="editFUserInfo()" class="btn btn-primary">
		<i class="fa fa-pencil"></i> 修改
	</button>
	<button type="button" onclick="lock(1)" class="btn btn-info">
		<i class="fa fa-pencil"></i> 锁定
	</button>
	<button type="button" onclick="lock(0)" class="btn btn-danger">
		<i class="fa fa-pencil"></i> 解除锁定
	</button>
	<button type="button" onclick="searchFUserInfo()"
		class="btn btn-success">
		<i class="fa fa-search"></i> 查询
	</button>
</div>
<div style="margin-top: 6px;">
	<form id="searchUserInfoForm" method="post">
		<div class="row">
			<div class="form-group col-lg-4">
				<div class=" input-group">
					<span class="input-group-addon">账号</span> <input type="text"
						name="account" value="${account}" class="form-control"
						placeholder="按账号查找">
				</div>
				<div class=" input-group">
					<span class="input-group-addon">手机号码</span> <input type="text"
						name="phone" value="${phone}" class="form-control"
						placeholder="按手机号码查找">
				</div>
			</div>
		</div>
	</form>
</div>
<div class="widget">
	<div class="widget-header bordered-bottom bordered-themeprimary">
		<i class="widget-icon fa fa-tasks themeprimary"></i> <span
			class="widget-caption themeprimary">用户基本信息</span>
	</div>
	<div class="widget-body">
		<div class="flip-scroll">
			<table
				class="table table-bordered table-striped table-condensed flip-content">
				<thead class="flip-content bordered-palegreen">
					<tr>
						<th width="44px;"><v:checkbox /></th>
						<th>用户账号</th>
						<th>昵称</th>
						<th>手机号码</th>
						<th>固话</th>
						<th>地址</th>
						<th>邮箱</th>
						<th>总金币</th>
						<th>现有金币</th>
						<th>总积分</th>
						<th>现有积分</th>
						<th>余额</th>
						<th>推广码</th>
						<th>创建时间</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="n">
						<tr>
						 <td><v:checkbox value="${n.id}"/></td>
							<td>${n.useraccount}</td>
							<td>${n.nickname}</td>
							<td>${n.phone}</td>
							<td>${n.telphone}</td>
							<td>${n.address}</td>
							<td>${n.email}</td>
							<td>${n.totalgold}</td>
							<td>${n.parentgold}</td>
							<td>${n.totalintegral}</td>
							<td>${n.parentintegral}</td>
							<td>${n.parentmoney}</td>
							<td>${n.codes}</td>
							<td>${n.createtime}</td>
							<td>
							<c:if test="${n.status==0}">
							<button type="button" class="btn btn-info">未锁定</button>
							</c:if>
							<c:if test="${n.status==1}">
							<button type="button" class="btn btn-danger">锁定</button>
							</c:if>
							</td>
							<td>
							<button type="button" onclick="updatePassword(${n.useraccount})" class="btn btn-info">修改密码</button>
							<button type="button" onclick="toAddCodes(${n.id})" class="btn btn-info">绑定会员代理商</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<v:pagination page="${page}" url="shop/userInfoController/list.htm?account=${account}&phone=${phone}"></v:pagination>
		</div>
	</div>
</div>