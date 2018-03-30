<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="editServiceForm">
				<input type="hidden" name="id" value="${aservice.id}">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">名称</label>
					<div class="col-sm-9">
						<input class="form-control" id=serviceName name="serviceName"
							value="${aservice.serviceName}" placeholder="名称" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">描述</label>
					<div class="col-sm-9">
						<input class="form-control" id="description" name="description"
							value="${aservice.description}" placeholder="描述" required>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
