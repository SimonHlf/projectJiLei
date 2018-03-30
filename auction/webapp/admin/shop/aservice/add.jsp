<%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<div class="widget model_widget">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addServiceForm" enctype="multipart/form-data">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">服务名称</label>
					<div class="col-sm-9">
						<input class="form-control" id="serviceName" name="serviceName" placeholder="服务名称"
							required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">描述</label>
					<div class="col-sm-9">
						<input class="form-control" id="description" name="description"
							placeholder="描述" required>
					</div>
				</div>
			</form>
		</div>
</div>

