<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="btn-group">
    <button type="button" onclick="add()" class="btn btn-primary">
        <i class="fa fa-pencil"></i> 保存
    </button>
</div>

<div class="alert alert-warning" role="alert" style="color:red">
    用于平台给商户和消费者的返额(请输入大于0小于50的数字) <br>
</div>

<div class="widget">
    <div class="widget-header  with-footer">
		<span class="widget-caption"> <i class="fa fa-list"></i> 养老金比率设置
		</span>
    </div>
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editNumForm">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">养老金比率</label>
                     <input type="hidden" name="id" id="id" value="${setting.id}">
                    <div class="col-sm-3">
                        <div class=" input-group">
                            <input name="oldMoneyNum" id="oldMoneyNum" value="${setting.oldMoneyNum}" class="form-control" placeholder="养老金比率">
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
	var rrr=$("#oldMoneyNum").val()*100;
	$("#oldMoneyNum").val(rrr);
});
    function add() {
    	var num=$("#oldMoneyNum").val();
    	if(!(/(^[1-9]\d*$)/.test(num))){
    		alert("请输入正整数");
    		return;
    	}else if(num >= 50){
    		alert("请输入小于50%的折扣");
    		return;
    	}else if(num <= 0){
    		alert("请输入大于0的折扣");
    		return;
    	}
    	var id=$("#id").val();
    	var oldMoneyNum=$("#oldMoneyNum").val();
    	var disc=oldMoneyNum/100;
            $.ajax({
                method: 'post',
                url: 'setting/addOldMoneyNum.htm',
                data:{
                	id:id,
                	oldMoneyNum:disc
                },
                success: function () {
                    layer.msg("保存成功");
                }
            });
    }
</script>