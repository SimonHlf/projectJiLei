<%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<script type="text/javascript" src="assets/js/datetime/jedate.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/jedate.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-fileupload.min.css" />
<script type="text/javascript" src="assets/js/bootstrap-fileupload.min.js"></script>
<script src="auction/metaModel/metaModel.js"></script>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="editmetaModelForm">
				<input type="hidden" id="id" name="id" value="${meta.id}">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">模块名称</label>
					<div class="col-sm-9">
						<input class="form-control" id="modelname" name="modelname" value="${meta.modelname}"
							placeholder="模块名称" required>
					</div>
				</div>
				 
  			</form>
		</div>
	</div>
</div>
