<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addCodeForm">
			<input type="hidden" name="id" value="${id}">
				<div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">上级会员代理商推广码</label>
						<div class="col-sm-9">
							<input class="form-control" id="codes" name="codes"
								placeholder="上级会员代理商推广码" required>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

