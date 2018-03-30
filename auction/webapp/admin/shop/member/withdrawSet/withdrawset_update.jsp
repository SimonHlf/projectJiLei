<%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="btn-group">
	<button type="button" onclick="updateWithdrawSet()" class="btn btn-primary">
		<i class="fa fa-plus"></i> 修改
	</button>
</div>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="updateWithdrawSetForm">
			<input type="hidden" name="id" value="${withdrawSet.id}">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">金额</label>
					<div class="col-sm-9">
						<input class="form-control" id="withdrawMoney" name="withdrawMoney" value="${withdrawSet.withdrawMoney}" placeholder="金额"
							required>
					</div>
				</div>
				
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
function updateWithdrawSet(){
	
	$.ajax({
		method : 'post',
		url : 'shop/withdrawSetController/updateWithdrawSet.htm',
		async: false, 
        cache: false,  
        contentType:false,
        processData:false,
		data : new FormData($("#updateWithdrawSetForm")[0]),
		success : function(data) {
			alert("更新成功");
			ajaxLoad('shop/withdrawSetController/toAddWithdrawSet.htm','提现最小金额设置');
		}
	})
	
}
</script>
