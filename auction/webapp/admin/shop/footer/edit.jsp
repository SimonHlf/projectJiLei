 <%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="widget model_widget">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addAuctionForm">
			<input type="hidden" value="${footer.id }" name="id">
			<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">模块名</label>
					<div class="col-sm-9">
						<input class="form-control" id="modelName" name="modelName"
							placeholder="模块名" value='<c:out value="${footer.modelName }" />' required>
					</div>
				</div>
			
		  		<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">链接地址</label>
					<div class="col-sm-9">
					<!-- <input type="button" onclick="%%%%()" value="创建Input"/> -->
						<input class="form-control" id="hrefs" name="hrefs"
							placeholder="链接地址" value='<c:out value="${footer.hrefs }" />' required>
					</div>
				</div>  	
				<input type="hidden" value="${footer.pid }" name="pid">
				
			</form>
		</div>
</div>
<script>
		
	
</script>