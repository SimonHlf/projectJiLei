 <%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<div class="widget model_widget">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addAuctionForm">
			<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">模块名</label>
					<div class="col-sm-9">
						<input class="form-control" id="modelName" name="modelName"
							placeholder="模块名" required>
					</div>
				</div>
			
		  		<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">链接地址</label>
					<div class="col-sm-9">
						<input class="form-control" onblur="checkXS(this.value)" id="hrefs" name="hrefs"
							placeholder="链接地址" required>
					</div>
					<div class="col-sm-9" style="padding-left: 100px;"><span style="color: red;">网站开头为(https://或者http://)</span></div>
				</div>  
				
				<div class="form-group" style="display: none;" id="isPid">
					<label class="col-sm-2 control-label no-padding-right">父类</label>
					<div class="col-sm-9" id="sel">
						<input class="form-control" id="pid" value="0" name="pid"
							placeholder="父类" required>
					</div>
				</div>
				
			</form>
		</div>
</div>
<script>

</script>