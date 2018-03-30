function addAttribute(cid) {
	edit("shop/attribute/toAdd.htm?cid="+cid,
	         "addAttributeForm",
	         "shop/attribute/add.htm",
	         "添加属性",
	         "shop/attribute/list.htm?cid="+cid,
	         '属性列表');
}

function editAttribute(cid) {
var checks = $(".table input:checked");
    
    if(checks.length==1){
        edit('shop/attribute/toEdit.htm?id='+$(checks[0]).val(),
            "editAttributeForm",
            "shop/attribute/edit.htm",
            "修改属性",
            "shop/attribute/list.htm?cid="+cid,
            '属性列表');
    }else{
        layer.msg("请选择一条数据")
    }	
}

function delAttribute() {
	var ids = "-1";
	$(".table input:checked").each(function() {
		ids = ids + "," + $(this).val();
	});
	layer.confirm("确认删除吗?", function(index) {
		$.ajax({
			method : 'post',
			url : 'shop/attribute/del.htm',
			data : {
				ids : ids
			},
			success : function(data) {
				loadHtml(data);
				layer.close(index)
			}
		})
	});
}
function sc(a) {
	$("#s2").empty();
	$.ajax({
		url : "auction/rmbProductController/select.htm?pid=" + a,
		success : function(data) {
			// var data = eval("(" + data + ")");
			for (var i = 0; i < data.length; i++) {
				$("#s2").append(
						"<option value='" + data[i].id + "'>"
								+ data[i].shopTypeName + "</option>")
			}

		}
	});
}
function attributeManager(cid){
	
	$.ajax({
		method : 'post',
		url : 'shop/attribute/list.htm',
		data : {
			cid : cid
		},
		success : function(data) {
			loadHtml(data);
		}
	})
	
	
}
//返回商品分类页面
function callBack(){
	$.ajax({
		method : 'post',
		url : 'shop/productCategory/list.htm',
		success : function(data) {
			loadHtml(data);
		}
	})
	
}