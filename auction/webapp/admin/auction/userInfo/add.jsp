<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addUserInfoForm">
				<div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">账号</label>
						<div class="col-sm-9">
							<input class="form-control" id="useraccount" name="useraccount"
								placeholder="账号" required onblur="checkAccount(this.value)">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">密码</label>
						<div class="col-sm-9">
							<input class="form-control" id="password" name="password"
								placeholder="密码"  required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">昵称</label>
						<div class="col-sm-9">
							<input class="form-control" id="nickname" name="nickname"
								placeholder="昵称">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">手机号码</label>
						<div class="col-sm-9">
							<input class="form-control"  id="phone" name="phone" placeholder="手机号码" required onblur="checkPhone(this.value)"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">固话</label>
						<div class="col-sm-9">
							<input class="form-control" id="telphone" name="telphone"
								placeholder="固话">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">地址</label>
						<div class="col-sm-9">
							<input class="form-control" id="address" name="address"
								placeholder="地址">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">邮箱</label>
						<div class="col-sm-9">
							<input class="form-control" id="email" name="email"
								placeholder="邮箱">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

