function addAdSlot(){
	$.ajax({
        method:'post',
        url:'shop/adSlot/toAdd.htm',  
        cache:false,
        contentType:false,
        processData:false,
        success:function (data) {
        	loadHtml(data);
        }
    })
}

function fanhui(){
	$.ajax({
        method:'post',
        url:'shop/adSlot/list.htm',  
        cache:false,
        contentType:false,
        processData:false,
        success:function (data) {
        	loadHtml(data);
        }
    })
}

function yes(){
	$.ajax({
		type:"post",
		url:"shop/adSlot/add.htm",
		data:new FormData($("#addAdSlotForm")[0]),
        cache:false,
        contentType:false,
        processData:false,
		success:function(data){
            layer.msg("添加成功");
            loadHtml(data);
		},
	})
}


function yes1(){
	$.ajax({
		type:"post",
		url:"shop/adSlot/update.htm",
		data:new FormData($("#updateAdSlotForm")[0]),
        cache:false,
        contentType:false,
        processData:false,
		success:function(data){
            layer.msg("修改成功");
            loadHtml(data);
		},
	})
}

function updateAdSlot(){
	var checks=$(".table input:checked")
	if(checks.length==0){
		layer.msg("请选择一条数据");
		return false;
	}
    if(checks.length>1){
    	layer.msg("请选择一条数据");
    	return false;
    }
    
    var id=$(checks[0]).val();
    
    if(checks){
    	$.ajax({
            method:'post',
            url:'shop/adSlot/toUpdatePage.htm?id='+id,  
            cache:false,
            contentType:false,
            processData:false,
            success:function (data) {
            	loadHtml(data);
            }
        })
    }
}

function delAdSlot(){
	var checks=$(".table input:checked")
	if(checks.length==0){
		layer.msg("请至少选择一条数据");
		return false;
	}
    var id="";
    $(".table input:checked").each(function () {
        id += $(this).val()+",";
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'shop/adSlot/del.htm',
            data:{id:id},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}


