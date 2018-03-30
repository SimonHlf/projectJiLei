 <%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="widget model_widget">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addAuctionForm">
				<input type="hidden" name="id" value="${auction.id }">
			<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">竞拍商品</label>
					<div class="col-sm-9">
						<%-- <input class="form-control" id="auctionId" name="auctionId"
							placeholder="竞拍商品" value="${auction.actionName }" required> --%>
							<select name="auctionId">
								<c:forEach items="${list }" var="list">
									<option value="${list.id }" <c:if test="${list.id==auction.auctionId }">selected</c:if> >${list.name }</option>
								</c:forEach>
							</select>
					</div>
				</div>
		  		<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">竞价者</label>
					<div class="col-sm-9">
					<!-- <input type="button" onclick="%%%%()" value="创建Input"/> -->
						<input class="form-control" id="bidder" name="bidder"
							placeholder="竞价者" value="${auction.bidder }" required>
					</div>
				</div>  
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">出价金额</label>
					<div class="col-sm-9">
						<input class="form-control" id="offer" name="offer"
							placeholder="出价金额" value="${auction.offer }" required>
						 
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">出价时间</label>
					<div class="col-sm-9">
						<input type="date" class="form-control" id=""createTime"" name="createTime"
							placeholder="出价时间" value="${auction.createTime }" required>
						 
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">是否成交</label>
					<div class="col-sm-9">
 						<select name="status">
 							<option value="0" <c:if test="${auction.status==0 }">selected</c:if> >未成交 </option>
							<option value="1" <c:if test="${auction.status==1 }">selected</c:if> >已成交 </option>
						</select>
					</div>
				</div>
			</form>
		</div>
</div>
