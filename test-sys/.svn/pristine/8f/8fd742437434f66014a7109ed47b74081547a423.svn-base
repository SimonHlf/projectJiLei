<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="btn-group">
    <button type="button" onclick="add()" class="btn btn-primary">
        <i class="fa fa-pencil"></i> 保存
    </button>
</div>

<div class="alert alert-warning" role="alert" style="color:red">
    用于商户的返现不可发布金额充值商户发布信息的次数 ( 请输入正整数 )<br>
</div>

<div class="widget">
    <div class="widget-header  with-footer">
		<span class="widget-caption"> <i class="fa fa-list"></i> 商户购买信息比率设置
		</span>
    </div>
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editNumForm">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">购买信息比</label>
                    <div class="col-sm-3">
                        <div class=" input-group">
                            <input type="number" name="newsNum" id="newsNum" value="${num}" class="form-control" placeholder="请输入正整数">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function add() {
     var newsNum=$("#newsNum").val();
            $.ajax({
                method: 'post',
                url: 'user/num.htm?newsNum='+newsNum,
                cache: false,
                contentType: false,
                processData: false,
                success: function () {
                    layer.msg("保存成功");
                }
            });
    }
</script>