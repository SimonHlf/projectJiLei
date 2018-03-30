<%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="btn-group">
	<button type="button" onclick="addWithdrawSet()" class="btn btn-info">
		<i class="fa fa-plus"></i> 保存
	</button>
</div>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addWithdrawSetForm">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">手续费率</label>
					<div class="col-sm-9">
						<input class="form-control" id="rate" name="rate" placeholder="手续费率"
							required>
					</div>
				</div>
				
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
function addWithdrawSet(){
	var rate=$("#rate").val();
	$.ajax({
		method : 'post',
		url : 'shop/servicecharge/addWithdrawSet.htm',		
		data : {rate:rate},
		success : function(data) {
			alert("添加成功");
			ajaxLoad('shop/servicecharge/toAddWithdrawSet.htm','手续费率设置');
		}
	})
	
}
</script>
