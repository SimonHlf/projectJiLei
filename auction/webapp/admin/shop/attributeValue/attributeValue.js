function addAttributeValue(aid) {
	edit("shop/attributeValue/toAdd.htm?aid="+aid,
	         "addAttributeValueForm",
	         "shop/attributeValue/add.htm",
	         "添加属性值",
	         "shop/attributeValue/list.htm?aid="+aid,
	         '属性值列表');
}


function editAttributeValue(aid) {
	
var checks = $(".table input:checked");
    
    if(checks.length==1){
        edit('shop/attributeValue/toEdit.htm?id='+$(checks[0]).val(),
            "editAttributeValueForm",
            "shop/attributeValue/edit.htm",
            "修改属性值",
            "shop/attributeValue/list.htm?aid="+aid,
            '属性值列表');
    }else{
        layer.msg("请选择一条数据")
    }
    
       
}

function delAttributeValue(){
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
            url:'shop/attributeValue/del.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}
function sc(a) {
	$("#s2").empty();
	$("#s3").empty();
	$.ajax({
		url : "auction/rmbProductController/select.htm?pid=" + a,
		success : function(data) {
			// var data = eval("(" + data + ")");
			$("#s2").append("<option>请选择二级分类</option>");
			for (var i = 0; i < data.length; i++) {
				$("#s2").append(
						"<option value='" + data[i].id + "'>"
								+ data[i].shopTypeName + "</option>")
			}

		}
	});
}
function sk(a) {
	$("#s3").empty();
	$.ajax({
		url : "shop/attribute/select.htm?cid=" + a,
		success : function(data) {
			// var data = eval("(" + data + ")");
			for (var i = 0; i < data.length; i++) {
				$("#s3").append(
						"<option value='" + data[i].id + "'>"
								+ data[i].name + "</option>")
			}

		}
	});
}

function attributeValueManager(aid,cid){
	$.ajax({
		method : 'post',
		url : 'shop/attributeValue/list.htm',
		data : {
			aid : aid,
			cid : cid
		},
		success : function(data) {
			loadHtml(data);
		}
	})
	
}

function callback(cid){
	$.ajax({
		method : 'post',
		url : 'shop/attribute/list.htm?cid='+cid,
		success : function(data) {
			loadHtml(data);
		}
	})
	
}
