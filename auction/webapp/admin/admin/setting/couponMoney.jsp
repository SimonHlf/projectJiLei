<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="btn-group">
    <button type="button" onclick="add()" class="btn btn-primary">
        <i class="fa fa-pencil"></i> 保存
    </button>
</div>

<div class="alert alert-warning" role="alert" style="color:red">
    用于商户将部分优惠券的金额提现(请输入大于50不大于100的数字) <br>
</div>

<div class="widget">
    <div class="widget-header  with-footer">
		<span class="widget-caption"> <i class="fa fa-list"></i> 优惠券可提现比率设置
		</span>
    </div>
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editNumForm">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">优惠券可提现比率</label>
                     <input type="hidden" name="id" id="id" value="${setting.id}">
                    <div class="col-sm-3">
                        <div class=" input-group">
                            <input  name="couponNum" id="couponNum" value="${setting.couponNum}" class="form-control" placeholder="优惠券可提现比率">
                            <span class="input-group-addon">%</span>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>

$(function(){
	var rrr=$("#couponNum").val()*100;
	$("#couponNum").val(rrr);
});
    function add() {
    	var num=$("#couponNum").val();
    	if(!(/(^[1-9]\d*$)/.test(num))){
    		alert("请输入正整数");
    		return;
    	}else if(num >100){
    		alert("请正确输入比率");
    		return;
    	}else if(num <= 50){
    		alert("请输入大于50的比率");
    		return;
    	}
    	var id=$("#id").val();
    	var dis=$("#couponNum").val();
    	var disc=dis/100;
            $.ajax({
                method: 'post',
                url: 'setting/addCouponMoney.htm',
                data:{
                	id:id,
                	couponNum:disc
                },
                success: function () {
                    layer.msg("保存成功");
                }
            });
    }
</script>