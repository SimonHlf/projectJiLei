function addItem() {
    openDialog('aboutUs/cooperation/add.jsp',function(index){
        var result = required("addItemForm");
        var url = $("#url").val();
        var reg=/(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/;
        if(!reg.test(url)){
        	layer.msg("不是正确的网址吧，请注意检查一下");
        	$("#url").focus();
        	return;
        }
        if(result){//提交表单
            $.ajax({
                method:'post',
                url:'companybasic/cooperation/updateReal.htm',  
                cache:false,
                contentType:false,
                processData:false,
                data:new FormData($("#addItemForm")[0]),
                success:function (data) {
                	if(data==1){
                		layer.msg("添加完成!");
                		$.ajax({
            		        method:'post',
            		        url:'companybasic/cooperation/list.htm',
            		        cache: false,
            		        contentType: false,
            		        processData: false,
            		        data:new FormData($("#searchItemForm")[0]),
            		        success:function (data) {
            		            loadHtml(data);
            		        }
            		    });
                    	layer.close(index)
                	}else{
                		layer.msg("图片格式不正确!");
                	}
                }
            })
        }
    });
}

function editItem() {
    
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
    	 openDialog('companybasic/cooperation/toUpdatePage.htm?id='+id,function(index){
    	        var result = required("addItemForm");
    	        var url = $("#url").val();
    	        var reg=/(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/;
    	        if(!reg.test(url)){
    	        	layer.msg("不是正确的网址吧，请注意检查一下");
    	        	$("#url").focus();
    	        	return;
    	        }
    	        if(result){//提交表单
    	            $.ajax({
    	                method:'post',
    	                url:'companybasic/cooperation/updateReal.htm',  
    	                cache:false	,
    	                contentType:false,
    	                processData:false,
    	                data:new FormData($("#addItemForm")[0]),
    	                success:function (data) {
    	                	if(data==1){
    	                		layer.msg("修改完成!");
    	                		$.ajax({
    	            		        method:'post',
    	            		        url:'companybasic/cooperation/list.htm',
    	            		        cache: false,
    	            		        contentType: false,
    	            		        processData: false,
    	            		        data:new FormData($("#searchItemForm")[0]),
    	            		        success:function (data) {
    	            		            loadHtml(data);
    	            		        }
    	            		    });
    	                    	layer.close(index)
    	                	}else{
    	                		layer.msg("图片格式不正确!");
    	                	}
    	                }
    	            })
    	        }
    	    });
    }
}

function delItem(){
    var ids = "";
    $(".table input:checked").each(function () {
       ids += $(this).val()+",";
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'companybasic/cooperation/delete.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

function fanhui() {
    $.ajax({
        method:'post',
        url:'companybasic/cooperation/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        success:function (data) {
            loadHtml(data);
        }
    });
}

function details(cmd){
	$.ajax({
		method:'post',
		url:'companybasic/cooperation/details.htm?id=' + cmd,
		
		success:function(data){
			loadHtml(data);
		}
	})
	
}

function searchItem() {
    $.ajax({
        method:'post',
        url:'companybasic/cooperation/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchItemForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}
