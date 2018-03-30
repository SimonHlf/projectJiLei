<%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addEvaluationTagForm" enctype="multipart/form-data">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">名称</label>
					<div class="col-sm-9">
						<input class="form-control" id="tagName" name="tagName" placeholder="名称"
							required>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

