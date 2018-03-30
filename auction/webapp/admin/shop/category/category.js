function addCategory() {
    edit("shop/category/add.jsp",
         "addCategoryForm",
         "shop/category/add.htm",
         "添加商品分类",
         "shop/category/list.htm",
         '商品分类列表');
}

function editCategory() {
    var checks = $(".table input:checked");
    if(checks.length>0){
        edit('shop/category/edit.htm?id='+$(checks[0]).val(),
            "editCategoryForm",
            "shop/category/add.htm",
            "修改商品分类",
            "shop/category/list.htm",
            '商品分类列表');
    }else{
        layer.msg("请选择数据")
    }
}

function delCategory(){
    var ids = "-1";
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    if(ids == "-1"){
    	layer.msg("请选择数据");
    	return;
    }
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'shop/category/del.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

function searchCategory() {
    $.ajax({
        method:'post',
        url:'shop/category/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchCateGoryForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}