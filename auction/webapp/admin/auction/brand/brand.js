function addBrand() {
    edit("auction/brand/brand_add.jsp",
         "addBrandForm",
         "shop/brandController/add.htm",
         "添加品牌",
         "shop/brandController/getAll.htm",
         '品牌列表');
}

function editBrand() {
    var checks = $(".table input:checked");
    
    if(checks.length==1){
        edit('shop/brandController/toEdit.htm?id='+$(checks[0]).val(),
            "editBrandForm",
            "shop/brandController/edit.htm",
            "修改品牌",
            "shop/brandController/getAll.htm",
            '品牌列表');
    }else{
        layer.msg("请选择一条数据")
    }
}

function delBrand(){
    var ids = "-1";
    var checks = $(".table input:checked");
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    if(checks.length>0){
	    layer.confirm("确认删除吗?",function(index){
	        $.ajax({
	            method:'post',
	            url:'shop/brandController/delete.htm',
	            data:{ids:ids},
	            success:function (data) {
	                loadHtml(data);
	                layer.close(index)
	            }
	        })
	    });
    }else{
    	 layer.msg("请至少选择一条数据")
    }
}

