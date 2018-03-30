//添加
function addMeta() {
    edit("auction/metaInfo/add.jsp",
         "addMetaInfoForm",
         "shop/metaInfoController/add.htm",
         "添加大师",
         "shop/metaInfoController/list.htm",
         '文化荟萃大师列表');
}
//修改
function editMeta() {
    var checks = $(".table input:checked");
    
    if(checks.length==1){
    	 edit("shop/metaInfoController/toEdit.htm?id="+$(checks[0]).val(),
    	         "editMetaInfoForm",
    	         "shop/metaInfoController/edit.htm",
    	         "修改大师",
    	         "shop/metaInfoController/list.htm",
    	         '文化荟萃大师列表');
    }else{
        layer.msg("请选择一条数据")
    }
}
//批量删除
function delMeta(){
    var ids = "-1";
    var checks = $(".table input:checked");
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    if(checks.length>0){
	    layer.confirm("确认删除吗?",function(index){
	        $.ajax({
	            method:'post',
	            url:'shop/metaInfoController/delete.htm',
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
//查看详情
function queryDetail(id,page){
	$.ajax({
        method:'post',
        url:'shop/metaInfoController/queryDetal.htm',
        data:{id:id,page:page},
        success:function (data) {
            loadHtml(data);
        }
    })
}
//详情页返回
function callback(page){
	$.ajax({
        method:'post',
        url:'shop/metaInfoController/list.htm',
        data:{page:page},
        success:function (data) {
            loadHtml(data);
        }
    })
}

//列表页查询
function searchMeta(){
	var name=$("#name").val();
	$.ajax({
        method:'post',
        url:'shop/metaInfoController/list.htm',
        data:{name:name},
        success:function (data) {
            loadHtml(data);
        }
    })
}

//关联模块
function relationModel(id,page){
    $.ajax({
        url:'shop/metaInfoController/toRelation.htm?id='+id,
        success:function(data){
            layer.open({
                type:1,
                area:'500px',
                title:'关联模块',
                fixed:false,
                maxmin:true,
                scrollbar:false,
                content: data,
                btn:['确定','关闭'],
                yes:function () {
                    var treeObj = $.fn.zTree.getZTreeObj("menuTree");
                    var nodes = treeObj.getCheckedNodes(true);
                    var cids = 0;
                    for (var i = 0; i < nodes.length; i++) {
                        cids = cids + "," + nodes[i].id;
                    }
                    $.ajax({
                        method : 'post',
                        url : 'shop/metaInfoController/saveRelation.htm?meatId='+id,
                        data : {
                            ids : cids
                        },
                        success : function() {
                            layer.closeAll();
                            layer.msg("关联完成");
                        }
                    })
                }
            });
        }
    })
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
