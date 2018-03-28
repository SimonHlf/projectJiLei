function addGoods() {
    edit("shop/goods/addBefore.htm",
         "addGoodsForm",
         "shop/goods/add.htm",
         "添加商品",
         "shop/goods/list.htm",
         '商品管理');
}

function editGoods() {
    var checks = $(".table input:checked");
    if(checks.length>0){
        edit('shop/goods/edit.htm?id='+$(checks[0]).val(),
            "editGoodsForm",
            "shop/goods/add.htm",
            "修改商品",
            "shop/goods/list.htm",
            '商品管理');
    }else{
        layer.msg("请选择数据")
    }
}


function delGoods(){
    var ids = "-1";
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'shop/goods/del.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}



function searchGoods() {
    $.ajax({
        method:'post',
        url:'shop/goods/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchGoodsForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}
//上架
function putAway(cmd){
	$.ajax({
		method:'post',
		url:'shop/goods/putAway.htm',
		data:{
			id:cmd,
			status:1
		},
		success:function(data){
			loadHtml(data);
		}
	})
}
//下架
function soldOut(cmd){
	$.ajax({
		method:'post',
		url:'shop/goods/putAway.htm',
		data:{
			id:cmd,
			status:0
		},
		success:function(data){
			loadHtml(data);
		}
	})
}

function details(cmd){
	$.ajax({
		method:'post',
		url:'shop/goods/details.htm?id=' + cmd,
		success:function(data){
			layer.msg("商品详情");
			loadHtml(data);
		}
	})
}

//不推荐
function noRecommend(cmd){
	$.ajax({
		method:'post',
		url:'shop/goods/recommend.htm',
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
		url:'shop/goods/recommend.htm',
		data:{
			id:cmd,
			attr2:1
		},
		success:function(data){
			loadHtml(data);
		}
	})
}