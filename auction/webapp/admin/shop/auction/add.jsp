 <%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="widget model_widget">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addAuctionForm">
			
			<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">竞拍商品</label>
					<div class="col-sm-9" id="product">
						<!-- <input class="form-control" id="auctionId" name="auctionId"
							placeholder="竞拍商品" required> -->
					</div>
				</div>
			
			
		  		<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">竞价者</label>
					<div class="col-sm-9">
					<!-- <input type="button" onclick="%%%%()" value="创建Input"/> -->
						<input class="form-control" id="bidder" name="bidder"
							placeholder="竞价者" required>
					</div>
				</div>  
				
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">出价金额</label>
					<div class="col-sm-9">
						<input class="form-control" id="offer" name="offer"
							placeholder="出价金额" required>
						 
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">出价时间</label>
					<div class="col-sm-9">
						<input type="date" class="form-control" id=""createTime"" name="createTime"
							placeholder="出价时间" required>
						 
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">是否成交</label>
					<div class="col-sm-9">
 						<select name="status">
 							<option value="0">未成交 </option>
							<option value="1">已成交 </option>
						</select>
					</div>
				</div>
              

			</form>
		</div>
</div>
<script>
	$.ajax({
	    method:'post',
	    url:'auction/auctionLog/findByAll.htm',  
	    success:function (data) {
	    	var result = jQuery.parseJSON(data);
	    	var str="<select  name='auctionId'>";
    		$.each(result,function(n,value){
    			str += "<option value="+value.id+">"+value.name+"</option>";
    		});
    		str+="</select>";
			$("#product").html(str);
	    }
	})	
</script>