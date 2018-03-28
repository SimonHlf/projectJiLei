function addMerchant() {
    edit("shop/merchantInfo/add.jsp",
         "addMerchantForm",
         "shop/merchant/add.htm",
         "添加门店",
         "shop/merchant/list.htm",
         '门店列表');
}

function editMerchant() {
    var checks = $(".table input:checked");
    if(checks.length>0){
       edit('shop/merchant/edit.htm?id='+$(checks[0]).val(),
            "editMerchantForm",
            "shop/merchant/add.htm",
            "修改门店",
            "shop/merchant/list.htm",
            '门店列表');
    }else{
        layer.msg("请选择数据")
    }
}

function delMerchant(){
    var ids = "-1";
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'shop/merchant/del.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

function searchMerchant() {
    $.ajax({
        method:'post',
        url:'shop/merchant/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchMerchantForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}
function details(cmd){
	$.ajax({
		method:'post',
		url:'shop/merchant/details.htm?id=' + cmd,
		success:function(data){
			layer.msg("门店详情页");
			loadHtml(data);
		}
	})
}
//不推荐
function noRecommend(cmd){
	$.ajax({
		method:'post',
		url:'shop/merchant/recommend.htm',
		data:{
			id:cmd,
			attr2:0
		},
		success:function(data){
			loadHtml(data);
		}
	})
}

//推荐
function recommend(cmd){
	$.ajax({
		method:'post',
		url:'shop/merchant/recommend.htm',
		data:{
			id:cmd,
			attr2:1
		},
		success:function(data){
			loadHtml(data);
		}
	})
}
//审核门店
function pass(cmd){
	 $.ajax({
	    	method:'post',
	    	url:'shop/merchant/pass.htm?id='+cmd,
	    	success:function(data){
	    		loadHtml(data);
	    		layer.msg("审核通过");
	    	}
	    })
}