<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/jquery.min.js"></script> --%>

<div class="main">
    <form class="form-horizontal form" action="" method="post">
    <input type='hidden' id="orderId" value="${order.id}">
                <input type="hidden" name="id" value="2" />
        <input type="hidden" name="token" value="" />
        <input type="hidden" name="dispatchid" value="" />
        <div class="panel panel-default">
            <h3 class="custom_page_header"> 订单信息</h3>
            <div class="panel-body">
          <%--   <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">头像</label>
                <div class="col-sm-9 col-xs-12">
                    <img src="${order.headPortrait }" style='width:100px;height:100px;padding:1px;border:1px solid #ccc' />
                   <!--  onerror="this.src='http://f.taoleikeji.com/assets/eshop/mobile/default/static/images/tx.png'" -->
                </div>
            </div> --%>
            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">会员信息</label>
                <div class="col-sm-9 col-xs-12">
                    <div class='form-control-static'>ID: ${order.userId} 姓名: ${order.nickName} / 手机号: ${order.phone} </div>
                </div>
            </div>
                
                                      <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">订单编号 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">${order.ordernum} </p>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">订单金额 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <div class="form-control-static"><table cellspacing="0" cellpadding="0">
							<tr>
								<td  style='border:none;text-align:right;'>运费：</td>
								<td  style='border:none;text-align:right;;'>￥${order.trans}</td>
							</tr>
																																						 
							<tr>
								<td style='border:none;text-align:right;'>总计：</td>
								<td  style='border:none;text-align:right;color:green;'>￥${order.totalamount}</td>
							</tr>

						</table></div>
                    </div>
                </div>
				<!-- <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">配送方式 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">
							                                                                快递
                                                            </p>
                    </div>
                </div> -->
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">付款方式 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">
                        <c:if test="${order.paytype ==1 }">微信支付</c:if>
					    <c:if test="${order.paytype ==2 }">支付宝支付</c:if> 
						<c:if test="${order.paytype ==3 }">余额支付</c:if>                                                                                                        
                        </p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">订单状态 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">
                           <!--  <span class="label label-info">待付款</span>  -->
                           <c:if test="${order.paystate==3 && order.status==2 }">
	  			   	<label class='label label-danger'>待付款</label>
	  			 	</c:if>
 
					<c:if test="${order.paystate==3 && order.status==3 && order.shRemark==3}">
						<!-- 已取消 待付款 -->
						 <label class='label label-success'>已取消</label>
					</c:if>		
					<c:if test="${order.paystate==1 && order.setState==2 && order.status==2 && order.refund==0}">
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
					
					<c:if test="${order.paystate==1 && order.setState==1 && order.status==2 && order.refund==0}">
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
					
					<c:if test="${order.paystate==1 && order.setState==3 && order.status==2 && order.isConment==0 && order.refund==0}">
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
					
					
					<c:if test="${order.status==1 && order.isConment==1 && order.refund==0}">
						<!-- <span>已完成</span> -->
						<label class='label label-success'>交易成功</label>
					</c:if>
					<c:if test="${order.status==1 && order.isConment==1 && order.shRemark==0}">
						<!-- <span>已完成  申请售后</span> -->
						<label class='label label-success'>交易成功&nbsp;&nbsp; 退款中</label>
					</c:if>
					<c:if test="${order.status==3 && order.isConment==1 && order.shRemark==1}">
						<!-- <span>已完成  申请售后成功</span> -->
						<label class='label label-success'>>退款成功</label>
					</c:if>
					<c:if test="${order.status==1 && order.isConment==1 && order.shRemark==2}">
						<!-- <span>已完成  申请售后失败</span> -->
						<label class='label label-success'>退款失败</label>
					</c:if>
                            
                                                                                                                                                                          </p>
                    </div>
                </div>
                                 
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">下单日期 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">${order.creattime}</p>
                    </div>
                </div>
                                
                                  
                                
                                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">备注 :</label>
                    <div class="col-sm-9 col-xs-12"><textarea style="height:150px;" class="form-control" name="remark" id="remark" cols="70">${order.remark}</textarea></div>
                </div>
                
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
                    <div class="col-sm-9 col-xs-12">
                         <br/>
                        <button type='button' name='saveremark' id='saveremark' class='btn btn-default'>保存备注</button>
                    </div>
                </div>
        </div>
    </form>
         <div class="panel panel-default">
            <h3 class="custom_page_header"> 收件人信息</h3>
            <div class="panel-body">
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">姓名 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static ad1">${order.receivername}</p>
                        <p class="form-control-static ad2"><input type="text" name="realname" id="realname" value="${order.receivername}" class="form-control" style="width:130px;display:inline;"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">手机 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static ad1">${order.receivertel}</p>
                        <p class="form-control-static ad2"><input type="text" name="mobile" id="mobile" value="${order.receivertel}" class="form-control" style="width:130px;display:inline;"></p>
                    </div>
                </div>
                <div class="form-group">

                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">地址 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static ad1" id="d_address">${order.receiveraddress}  </p>
                        <p class="form-control-static ad2" id="e_address">
                            <input type="text" name="address_info" id="address_info" value="${order.receiveraddress}" class="form-control changeprice_orderprice" style="width:300px;display:inline;">
                        </p>

                        <button type='button' name='editaddress' id='editaddress' class='btn btn-default ad1'>编辑信息</button>
                        <button type='button' name='saveaddress' id='saveaddress' class='btn btn-default ad2'>保存信息</button>
                        <button type='button' name='backaddress' id='backaddress' class='btn btn-default ad2' style="margin-left:50px;">返回</button>
                     
                    </div>
                </div>
            </div>
        </div>
        
         <%--  <div class="panel panel-default">
            <h3 class="custom_page_header"> 发票信息</h3>
            <div class="panel-body">
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">发票抬头 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">
                        <c:if test="${order.receiptHead==1}">
                     		   个人
                        </c:if>
                        <c:if test="${order.receiptHead==2}">
                     		   企业
                        </c:if>
                        </p>
                    </div>
                </div>
                 <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">发票内容 :</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">${order.receiptComment}</p>
                       
                    </div>
                </div>
            </div>
        </div>    --%>  
	<%-- <div class="panel panel-default" style="display:none;">
            <h3 class="custom_page_header"> 退款/售后详情</h3>
             
            <div class="panel-body">
            
          	 <button type='button' name='apply_succes' id='apply_succes' class='btn btn-default' onclick="refundService('${order.ordernum}','${customerService.money}')">申请通过</button>
             <button type='button' name='apply_fail' id='apply_fail' class='btn btn-default' onclick="dealApply('2')">申请失败</button>
            
                <c:if test="${customerService.remark==0}">
               		<label class='label label-success'> 申请已提交</label>
                </c:if>
                <c:if test="${customerService.remark==1}">
               		<label class='label label-success'> 退款成功</label>
                </c:if>
                <c:if test="${customerService.remark==2}">
               		 <label class='label label-danger'>退款失败</label>
                </c:if>
            	<c:if test="${customerService.remark==3}">
               		 <label class='label label-danger'>未付款，无需审核</label>
                </c:if>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">类型</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">${customerService.type}</p>
                    </div>
                </div>
                 <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">原因</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">${customerService.reason}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">退款金额</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">${customerService.money}</p>
                        <input type="hidden" name="csId" id="csId" value="${customerService.id}">
                        <p class="form-control-static mo2"><input type="text" name="money" id="money"  value="${customerService.money}"class="form-control" style="width:130px;display:inline;"></p>
                   
                    <button type='button' name='editmoney' id='editmoney' class='btn btn-default mo1'>修改金额</button>
                    <button type='button' name='savemoney' id='savemoney' class='btn btn-default mo2'>保存信息</button>
                    <button type='button' name='backmoney' id='backmoney' class='btn btn-default mo2' style="margin-left:50px;">返回</button>
                	 </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">退款账户</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">${customerService.account}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">退款说明</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">${customerService.massages}</p>
                    </div>
                </div>
                 <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">联系电话</label>
                    <div class="col-sm-9 col-xs-12">
                        <p class="form-control-static">${customerService.cellphone}</p>
                    </div>
                </div>
                
                
            </div>
        </div>    --%>
 
        <div class="panel panel-default">
            <h3 class="custom_page_header"> 商品信息</h3>
            <div class="panel-body table-responsive">
                <table class="table table-hover">
                    <thead class="navbar-inner">
                        <tr>
                            <th style="width:5%;">商品图片</th>
                            <th >商品标题</th>
                          <!--   <th >商品规格</th> -->
                       
                            <th >现价</th>
                            <th >属性</th>
                            <th style="text-align:center">购买数量</th>
                            <!-- <th style="color:red;">折扣前/折扣后</th> -->
                            
                        </tr>
                    </thead>
                       <tr>
                       <c:forEach items="${list}" var="n">
                        <td><img src="/${n.thumbnailUrl}" width="70px" height="70px"/></td>
                        <td>
                           ${n.productName } 
                        </td>
                        <td>现价:${n.price}<br/>
                        	</td>
                        <td><span class="label label-success"></span>&nbsp;<span class="label label-info" >实体商品</span></td>
                        <td style="text-align:center">${n.number}</td>
                        <!-- <td style='color:red;font-weight:bold;'>668.00/668.00	</td> -->
                       </c:forEach>
                    </tr>
				    <tr>
                        <td colspan="7">
                                                            
                          </td>
                    </tr>
                </table>
            </div>
        </div>
<script type="text/javascript">
//修改退款金额样式
function show_money(flag) {
    if (flag == 1) {
        $('.mo1').hide();
        $('.mo2').show();
    } else {
        $('.mo1').show();
        $('.mo2').hide();
    }
}
$(function() {
	show_money(0);	
})
$('#editmoney').click(function() {
	show_money(1);
});           
$('#backmoney').click(function() {
	show_money(0);
});
//保存退款金额
$('#savemoney').click(function() {
	var id = $('#orderId').val();
	var money = $('#money').val();
	var csId = $('#csId').val();
	  $.ajax({
	       method:'post',
	       url:'shop/orderController/editCustomerServiceMoney.htm',
	       data:{"id":csId,"money":money},
	       success:function (data) {
	    	   // var data=eval("("+data+")");
	    	   if(data.result=="ok"){
	    		   $.ajax({
	    		       method:'post',
	    		       url:'shop/orderController/selectOrderDetail.htm',
	    		       data:{"orderId":id},
	    		       success:function (html) {
	    		         $("#main_content").html(html);
	    		          
	    		       }
	    		   })
	    	   }
	    	   if(data.result=="fail"){
	    		   layer.msg("保存失败！");
	    	   }
	          
	       }
	   })
});
//修改收货人样式
function show_address(flag) {
    if (flag == 1) {
        $('.ad1').hide();
        $('.ad2').show();
    } else {
        $('.ad1').show();
        $('.ad2').hide();
    }
}

$(function() {
	show_address(0);	
})
            
$('#editaddress').click(function() {
    show_address(1);
});           
$('#backaddress').click(function() {
    show_address(0);
});
//保存收货人信息
$('#saveaddress').click(function() {
	var id = $('#orderId').val();
    var receiverName = $('#realname').val();
    var receiverTel = $('#mobile').val();
    var receiverAddress = $('#address_info').val();

    if(receiverName==''){
        alert('请填写收件人姓名!');
        return false;
    }
    if(receiverTel==''){
        alert('请填写收件人手机!');
        return false;
    }
    if(receiverAddress==''){
        alert('请填写收件地址!');
        return false;
    }
    $.ajax({
	       method:'post',
	       url:'shop/orderController/editOrder.htm',
	       data:{"id":id,"receiverName":receiverName,"receiverTel":receiverTel,"receiverAddress":receiverAddress},
	       success:function (data) {
	    	   // var data=eval("("+data+")");
	    	   if(data.result=="ok"){
	    		   $.ajax({
	    		       method:'post',
	    		       url:'shop/orderController/selectOrderDetail.htm',
	    		       data:{"orderId":id},
	    		       success:function (html) {
	    		         $("#main_content").html(html);
	    		          
	    		       }
	    		   })
	    	   }
	    	   if(data.result=="fail"){
	    		   layer.msg("保存失败！");
	    	   }
	          
	       }
	   })
	
});
//保存订单备注
$('#saveremark').click(function() {
	var id = $('#orderId').val();
	var remark=$('#remark').val();
	  $.ajax({
	       method:'post',
	       url:'shop/orderController/editOrder.htm',
	       data:{"id":id,"remark":remark},
	       success:function (data) {
	    	   // var data=eval("("+data+")");
	    	   if(data.result=="ok"){
	    		   $.ajax({
	    		       method:'post',
	    		       url:'shop/orderController/selectOrderDetail.htm',
	    		       data:{"orderId":id},
	    		       success:function (html) {
	    		         $("#main_content").html(html);
	    		          
	    		       }
	    		   })
	    	   }
	    	   if(data.result=="fail"){
	    		   layer.msg("保存失败！");
	    	   }
	          
	       }
	   })
});
function dealApply(str){
	var id = $('#orderId').val();
	var csId = $('#csId').val();
	if(str=="1"){
		remark=1;	
	}
	if(str=="2"){
		remark=2;	
	}
	$.ajax({
	       method:'post',
	       url:'shop/orderController/dealCustomerService.htm',
	       data:{"remark":remark,"id":csId},
	       success:function (data) {
	    	   // var data=eval("("+data+")");
	    	   if(data.result=="ok"){
	    		   $.ajax({
	    		       method:'post',
	    		       url:'shop/orderController/selectOrderDetail.htm',
	    		       data:{"orderId":id},
	    		       success:function (html) {
	    		         $("#main_content").html(html);
	    		       }
	    		   })
	    	   }
	    	   if(data.result=="fail"){
	    		   layer.msg("操作失败！");
	    	   }
	          
	       }
	   })
}
//使用支付宝退款
/* function refundService(ordernum,money){
	var id = $('#orderId').val();
	$.ajax({
	       method:'post',
	       url:'shop/alipayrefund/refund.htm',
	       data:{"tradeNo":ordernum,"refundAmount":money,"orderId":id},
	       success:function (data) {
	    	   if(data == null || data == ""){
	    		   layer.msg("退款成功");
	    		   $.ajax({
	    		       method:'post',
	    		       url:'shop/orderController/selectOrderDetail.htm',
	    		       data:{"orderId":id},
	    		       success:function (html) {
	    		         $("#main_content").html(html);
	    		       }
	    		   })
	    	   }
	    	   if(data !=null && data !=""){
	    		   layer.msg(data);
	    	   }
	       }
	   })	
} */
//退款得到余额
function refundService(ordernum,money){
	var id = $('#orderId').val();
	$.ajax({
	       method:'post',
	       url:'shop/orderController/refundOrder.htm',
	       data:{"ordernum":ordernum,"money":money,"orderId":id},
	       success:function (data) {
	    	   // data=eval("("+data+")");
	    	   if(data.result == "ok"){
	    		   layer.msg("退款成功");
	    		   $.ajax({
	    		       method:'post',
	    		       url:'shop/orderController/selectOrderDetail.htm',
	    		       data:{"orderId":id},
	    		       success:function (html) {
	    		         $("#main_content").html(html);
	    		       }
	    		   })
	    	   }
	    	   if(data.result == "fail"){
	    		   layer.msg(data);
	    	   }
	       }
	   })	
}

</script>