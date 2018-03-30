<%@page  language="java" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>

<script src="auction/order/order.js"></script>
<script src="assets/layui/lay/modules/laypage.js"></script>
<style>
	.successs{
		width: 8.333333%;
		height: 33px;
		line-height: 26px;
		font-size: 14px;
	}
</style>
<div class="btn-group col-sm-12">
 	<label class='label label-success successs' onclick="selectOrder('all')" >全部</label> 
	<label class='label label-success successs' onclick="selectOrder('daifukuan')">待付款</label>
	<label class='label label-success successs' onclick="selectOrder('daifahuo')" >待发货</label>
	<label class='label label-success successs' onclick="selectOrder('daishouhuo')" >待收货</label>
	<label class='label label-success successs' onclick="selectOrder('daipingjia')" >待评价</label>
	<label class='label label-success successs' onclick="selectOrder('yiwancheng')" >已完成</label>
	<label class='label label-success successs' onclick="selectOrder('applytui')" >退款申请</label>
	<label class='label label-success successs' onclick="selectOrder('yituikuan')" >已退款</label>
	<label class='label label-success successs' onclick="selectOrder('yiguanbi')" >已关闭</label>

</div>
<!-- <div class="btn-group col-sm-12">
	<label class='label label-success' onclick="exitExcel()" style="width: 16.6666666%;height: 33px;line-height: 26px;font-size: 14px;">导出待发货订单Excel</label>
	<label class='label label-success' onclick="importExcel()" style="width: 16.6666666%;height: 33px;line-height: 26px;font-size: 14px;"> 批量导入物流单号</label>

 </div> -->
 <div id="main_content">
<div class="">
	<div class="col-sm-2">
		<input class="form-control" id="ordernum" name="ordernum" value="${ordernum}" placeholder="订单号" width="200px">
	</div>
	<div class=	">
		<input class="form-control" id="userName" name="userName" value="${userName}" placeholder="昵称/手机号">
	</div>
	<div class="col-sm-2">
		<input class="form-control" id="tracknum" name="tracknum" value="${tracknum}" placeholder="快递单号">
	</div>

		下单时间<input  type="date" name="time1" value="${time1}" id="time1"/>至<input type="date" name="time2" value="${time2}" id="time2">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		付款时间<input  type="date" name="time3" value="${time3}" id="time3"/>至<input type="date" name="time4" value="${time4}" id="time4">
		<button type="button" onclick="selectOrder('${param.str}')" class="btn btn-success">
			<i class="fa fa-search"></i> 查询
		</button>
</div>

<div class="widget">
    <div class="widget-header  with-footer">
        <span class="widget-caption">
            <i class="fa fa-list"></i>
            订单列表</span>
    </div>
	<div class="widget-body">
		<div class="flip-scroll">
			<table class='table'
				style='float: left; border: 1px solid #ccc; margin-bottom: 5px; table-layout: fixed; text-align:center;'>
				<tr class='trhead'>
					<td colspan='2' style='width: 200px; text-align: left'>订单数: ${count }
						<!-- 订单金额: 744.00 --></td>
					<td style='width: 178px;padding-left:20px; text-align: center;'>单价/数量</td>
					<td style='width: 178px;text-align:left;'>买家</td>
					<td>支付方式/配送方式</td>
					<td style='width: 200px;'>价格</td>
					<td>操作</td>
					<td>物流信息</td>
				</tr>
			</table>
	<c:forEach items="${list}" var="order">
			<table class='table'
				style='float: left; border: 1px solid #ccc; margin-top: 5px; margin-bottom: 0px; table-layout: fixed;'>
				<tr>
					<td colspan='6'
						style='border-bottom: 1px solid #ccc; background: #efefef;'>
						<b class="col-sm-6">订单编号:<span>${order.ordernum}</span></b>
						<b class="col-sm-6">下单时间:<span>${order.creattime}</span></b>

					<td style='border-bottom: 1px solid #ccc; background: #efefef; text-align: center' colspan='2'>
						<!-- <a class="btn btn-default btn-sm" href="javascript:;" onclick="$('#modal-close').find(':input[name=id]').val('2')"
						data-toggle="modal" data-target="#modal-close">关闭订单</a> -->
						 <a class="btn btn-default btn-sm" style="float: right"
						href="javascript:detail('${order.id}')">查看详情</a>
					</td>
				</tr>
			</table>
			<table class='table' style='float: left; border: 1px solid #ccc; border-top: none; table-layout: fixed;'>
				<tr class='trbody'>
				
					<td class="goods_info" width="80px"><img src="/${order.thumbnailUrl}" width="60px" height="60px"> 
					</td>
					<td valign='top'
						style='border-left: none; text-align: left; width: 150px;'>${order.productName}<br/>
					</td>
					<td style='border-left: none; padding-left:30px; text-align: left; width: 150px'>
						 <br />
						应付: ${order.totalamount} <br />
						数量: ${order.number}
					</td>

					<td rowspan="1" style="text-align:left;width: 178px;">
						<a href="index.php?mod=site&act=list&op=detail&id=1&do=member&m=eshop&beid=1"></a>
						<p>昵称:${order.nickName}</p>
						<p>手机:${order.phone}</p>
					</td>
					<td rowspan="1" style="text-align:center;">
						<c:if test="${order.paytype ==1 }">微信</c:if>
						<c:if test="${order.paytype ==2 }">支付宝</c:if>
						<c:if test="${order.paytype ==3 }">余额</c:if>


					</td>
					<td rowspan="1" style='width: 200px;text-align:center;'>
						<table style='width: 100%;'>
							<tr>
								<td style='border: none; text-align: right;'>运费：</td>
								<td style='border: none; text-align: right;'>￥${order.trans}</td>
							</tr>

							<tr>
								<td style='border: none; text-align: right;'>总计：</td>
								<td style='border: none; text-align: right; color: green;'>￥${order.totalamount}</td>
							</tr>

							<tr>
								<td style='border: none; text-align: right;'></td>
								<!-- <td style='border: none; text-align: right; color: green;'><a
									href="javascript:;" class="btn btn-link "
									onclick="changePrice('2')">修改价格</a></td> -->
							</tr>
						</table>



					</td>
				<!-- 	<label class='label label-danger'></label>
						<label class='label label-success'></label>
				 
					 <a class="btn btn-primary btn-sm"
						href="index.php?mod=site&op=deal&to=confirmpay&id=2&act=list&do=order&m=eshop&beid=1"
						onclick="return confirm('确认此订单已付款吗？');return false;">确认付款</a> -->
					<td rowspan="1" style="text-align:center;">
					<!-- 订单状态 -->
					<c:if test="${order.paystate==0 && order.status==2 }">
	  			   	<label class='label label-danger'>待付款</label>
	  			 	</c:if>
 
					<c:if test="${order.paystate==0 && order.status==3 && order.shRemark==3}">
						<!-- 已取消 待付款 -->
						 <label class='label label-success'>已取消</label>
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==2 && order.status==2}">
						<!-- <span>待发货</span> -->
						<label class='label label-success'>待发货</label>
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==2 && order.status==2 && order.shRemark==0}">
						<!-- <span>待发货 申请退款</span> -->
						 <label class='label label-success'>待发货&nbsp;&nbsp; 退款中</label>
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==2 && order.status==3 && order.shRemark==1}">
						<!-- <span>待发货 申请退款成功</span> -->
						<label class='label label-success'>退款成功</label>
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==2 && order.status==2 && order.shRemark==2}">
						<!-- <span>待发货 申请退款失败</span> -->
						  <label class='label label-success'>待发货&nbsp;&nbsp;退款失败</label>
					</c:if>
					
					<c:if test="${order.paystate==1 && order.setState==1 && order.status==2}">
						<!-- <span>待收货</span> -->
						 <label class='label label-success'>卖家已发货</label>
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==1 && order.status==2 && order.shRemark==0}">
						<!-- <span>待收货 申请退款</span> -->
						 <label class='label label-success'>卖家已发货&nbsp;&nbsp; 退款中</label>
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==1 && order.status==3 && order.shRemark==1}">
						<!-- <span>待收货 申请退款成功</span> -->
						 <label class='label label-success'>退款成功 </label>
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==1 && order.status==2 && order.shRemark==2}">
						<!-- <span>待收货 申请退款失败</span> -->
						<label class='label label-success'>卖家已发货&nbsp;&nbsp; 退款失败</label>
					</c:if>
					
					<c:if test="${order.paystate==1 && order.setState==3 && order.status==2 && order.isConment==0}">
						<!-- <span>待评价</span> -->
						<label class='label label-success'>待评价</label>
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==3 && order.status==2 && order.isConment==0 && order.shRemark==0}">
						<!-- <span>待评价  申请售后</span> -->
						<label class='label label-success'>待评价&nbsp;&nbsp; 退款中</label>
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==3 && order.status==3 && order.isConment==0 && order.shRemark==1}">
						<!-- <span>待评价  申请售后成功</span> -->
						<label class='label label-success'>退款成功</label>
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==3 && order.status==2 && order.isConment==0 && order.shRemark==2}">
						<!-- <span>待评价  申请售后成功</span> -->
						<label class='label label-success'>待评价&nbsp;&nbsp; 退款失败</label>
					</c:if>
					
					
					<c:if test="${order.status==1 && order.isConment==1}">
						<!-- <span>已完成</span> -->
						<label class='label label-success'>交易成功</label>
					</c:if>
					<c:if test="${order.status==1 && order.isConment==1 && order.shRemark==0}">
						<!-- <span>已完成  申请售后</span> -->
						<label class='label label-success'>交易成功&nbsp;&nbsp; 退款中</label>
					</c:if>
					<c:if test="${order.status==3 && order.isConment==1 && order.shRemark==1}">
						<!-- <span>已完成  申请售后成功</span> -->
						<label class='label label-success'>退款成功</label>
					</c:if>
					<c:if test="${order.status==1 && order.isConment==1 && order.shRemark==2}">
						<!-- <span>已完成  申请售后失败</span> -->
						<label class='label label-success'>退款失败</label>
					</c:if>
					 
					<br/> 
	<!-- - -- -- --  ------- -- ---- -- --按钮 -- -- --  -- -- -- -- ----  -- -- -- -- -->
					 <c:if test="${order.paystate==0 && order.status==2 }">
		  			  <!--  <span>未付款</span> -->
		  			  		 <button type="button" class="btn btn-default btn-sm" name="${order.id}">取消订单</button> 
		  			 </c:if>
		  			 <c:if test="${order.paystate==0 && order.status==3 && order.shRemark==3}">
								<!-- <b>订单已取消  未付款</b> -->				
					</c:if>
		  			 <c:if test="${order.paystate==1 && order.setState==2 && order.status==2}">
								<!-- <span>待发货</span> -->
							<button type="button" class="btn btn-default btn-sm" onclick="sendout('${order.ordernum}')">发货</button> 
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==2 && order.status==2 && order.shRemark==0}">
								<!-- <span>待发货 申请退款</span> -->
							<button type="button" class="btn btn-default btn-sm" onclick="sendout('${order.ordernum}')">发货</button>
							<button type="button" class="btn btn-default btn-sm" onclick="shouhou('${order.ordernum}')">退款中</button> 
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==2 && order.status==3 && order.shRemark==1}">
								<!-- <span>待发货 申请退款成功</span> -->
							<button type="button" class="btn btn-default btn-sm" onclick="sendout('${order.ordernum}')">发货</button>
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==2 && order.status==2 && order.shRemark==2}">
								<!-- <span>待发货 申请退款失败</span> -->
							<button type="button" class="btn btn-default btn-sm" onclick="sendout('${order.ordernum}')">发货</button>
					</c:if>
		  			 
		  			 
		  			 
		  			 <c:if test="${order.paystate==1 && order.setState==1 && order.status==2}">
								<!-- <span>待收货</span> -->
							<button type="button" class="btn btn-default btn-sm" onclick="wuliu('${order.productId}','${order.expressnum}','${order.tracknum}')">查看物流</button>
		  			   		<button type="button" class="btn btn-default btn-sm" onclick="confirm_receipt('${order.ordernum}')">确认收货</button> 
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==1 && order.status==2 && order.shRemark==0}">
								<!-- <span>待收货 申请退款</span> -->
							<button type="button" class="btn btn-default btn-sm" onclick="wuliu('${order.productId}','${order.expressnum}','${order.tracknum}')">查看物流</button>
		  			   		<button type="button" class="btn btn-default btn-sm" onclick="shouhou('${order.ordernum}')">退款中</button>
		  			   		<button type="button" class="btn btn-default btn-sm" onclick="confirm_receipt('${order.ordernum}')">确认收货</button> 
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==1 && order.status==3 && order.shRemark==1}">
								<!-- <span>待收货 申请退款成功</span> -->
							<button type="button" class="btn btn-default btn-sm" onclick="wuliu('${order.productId}','${order.expressnum}','${order.tracknum}')">查看物流</button>
		  			   		<button type="button" class="btn btn-default btn-sm" onclick="confirm_receipt('${order.ordernum}')">确认收货</button>
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==1 && order.status==2 && order.shRemark==2}">
								<!-- <span>待收货 申请退款失败</span> -->
							<button type="button" class="btn btn-default btn-sm" onclick="wuliu('${order.productId}','${order.expressnum}','${order.tracknum}')">查看物流</button> 
		  			   		<button type="button" class="btn btn-default btn-sm" onclick="confirm_receipt('${order.ordernum}')">确认收货</button> 
					</c:if>
		  			 
		  			 
		  			 <c:if test="${order.paystate==1 && order.setState==3 && order.status==2 && order.isConment==0}">
								<!-- <span>待评价</span> -->
		  			   		<button type="button" class="btn btn-default btn-sm" onclick="wuliu('${order.productId}','${order.expressnum}','${order.tracknum}')">查看物流</button>
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==3 && order.status==2 && order.isConment==0 && order.shRemark==0}">
								<!-- <span>待评价  申请售后</span> -->
							<button type="button" class="btn btn-default btn-sm" onclick="shouhou('${order.ordernum}')">退款中</button>
		  			   		<button type="button" class="btn btn-default btn-sm" onclick="wuliu('${order.productId}','${order.expressnum}','${order.tracknum}')">查看物流</button>   		
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==3 && order.status==3 && order.isConment==0 && order.shRemark==1}">
								<!-- <span>待评价  申请售后成功</span> -->
		  			   		<button type="button" class="btn btn-default btn-sm" onclick="wuliu('${order.productId}','${order.expressnum}','${order.tracknum}')">查看物流</button>  		
					</c:if>
					<c:if test="${order.paystate==1 && order.setState==3 && order.status==2 && order.isConment==0 && order.shRemark==2}">
								<!-- <span>待评价  申请售后成功</span> -->
		  			   		<button type="button" class="btn btn-default btn-sm" onclick="wuliu('${order.productId}','${order.expressnum}','${order.tracknum}')">查看物流</button>	
					</c:if>
		  			 
		  			 
		  			  <c:if test="${order.status==1 && order.isConment==1}">
		  			  <!--  <span>已完成</span> -->	
		  			  		<button type="button" class="btn btn-default btn-sm" onclick="wuliu('${order.productId}','${order.expressnum}','${order.tracknum}')">查看物流</button>
		  			 </c:if>
		  			 <c:if test="${order.status==1 && order.isConment==1 && order.shRemark==0}">
								<!-- <span>已完成  申请售后</span> -->
							<button type="button" class="btn btn-default btn-sm" onclick="shouhou('${order.ordernum}')">退款中</button>
		  			  		<button type="button" class="btn btn-default btn-sm" onclick="wuliu('${order.productId}','${order.expressnum}','${order.tracknum}')">查看物流</button>
					</c:if>
					 <c:if test="${order.status==3 && order.isConment==1 && order.shRemark==1}">
								<!-- <span>已完成  申请售后成功</span> -->
		  			  		<button type="button" class="btn btn-default btn-sm" onclick="wuliu('${order.productId}','${order.expressnum}','${order.tracknum}')">查看物流</button>
					</c:if>
					<c:if test="${order.status==1 && order.isConment==1 && order.shRemark==2}">
								<!-- <span>已完成  申请售后失败</span> -->
		  			  		<button type="button" class="btn btn-default btn-sm" onclick="wuliu('${order.productId}','${order.expressnum}','${order.tracknum}')">查看物流</button>
					</c:if>	 
					</td>
					<!-- 物流 -->
					<td rowspan="1" style="text-align:center;">

						<c:if test="${order.logisticsId==null}">
							<button type="button" class="btn btn-default btn-sm" onclick="addLogistics('${order.ordernum}')">添加物流信息</button>
						</c:if>
						<c:if test="${order.logisticsId!=null}">
							<button type="button" class="btn btn-default btn-sm" onclick="editLogistics('${order.ordernum}')">更新物流信息</button>
						</c:if>	
					</td>
					
				</tr>
			</table>
</c:forEach>



<v:pagination page="${page}"
	url="shop/orderController/selectAllOrder.htm?paystate=${paystate}&setState=${setState}&status=${status}&userId=${userId}&isConment=${isConment}&remark=${remark}&refund=${refund}&isDelete=${isDelete}&ordernum=${ordernum}&payType=${payType}&time1=${time1}&time2=${time2}&time3=${time3}&time4=${time4}&tracknum=${tracknum}&str=${param.str}">
</v:pagination>
</div>
	</div>
</div>
</div>

