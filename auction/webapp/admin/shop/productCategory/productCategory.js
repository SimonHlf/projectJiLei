function addproductCategory(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var nodes = treeObj.getSelectedNodes();
	console.log("aaa"+nodes.length)
	if(nodes.length==0){
		url='shop/productCategory/add.htm?nid=0';
	}else{
		var nid=nodes[0].id;
		console.log("bbb"+nid)
		url='shop/productCategory/add.htm?nid='+nid;
	}
	edit("shop/productCategory/add.jsp",
	         "addproductCategoryForm",
	         url,
	         "添加商品分类",
	         "shop/productCategory/list.htm",
	         '商品分类列表');
}


function editproductCategory() {
	var checks = $(".table input:checked");
    
    if(checks.length==1){
        edit('shop/productCategory/toEdit.htm?id='+$(checks[0]).val(),
            "editproductCategoryForm",
            "shop/productCategory/edit.htm",
            "修改商品分类",
            "shop/productCategory/list.htm",
            '商品分类列表');
    }else{
        layer.msg("请选择一条数据")
    }
}

function delproductCategory(){
	var checks=$(".table input:checked")
	if(checks.length==0){
		layer.msg("请至少选择一条数据");
		return false;
	}
	var ids = "-1";
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'shop/productCategory/del.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

//预览
function preview(file) {//预览图片得到图片base64
    if (file.files && file.files[0]) {
        var reader = new FileReader();
        reader.onload = function (evt) {
            $("#preview").find("img").attr("src",evt.target.result);
        }
        reader.readAsDataURL(file.files[0]);
    } 
}
/* 
function hqV(){
	alert($("#pictures11").val())
	console.log($("#pictures11").val());
	
	
}*/