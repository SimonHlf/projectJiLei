<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="editPasswordForm">
			<input type="hidden" name="useraccount" value="${account}">
				<div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">新密码</label>
						<div class="col-sm-9">
							<input class="form-control" id="password" name="password"
								placeholder="新密码" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">确认新密码</label>
						<div class="col-sm-9">
							<input class="form-control" id="password" name="password"
								placeholder="确认新密码" required>
						</div>
					</div>
					
				</div>
			</form>
		</div>
	</div>
</div>

