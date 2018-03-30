var pid = 0;
function addAuction(){
	var treeObj=$.fn.zTree.getZTreeObj("menuTree");
    var nodes = treeObj.getSelectedNodes();
    if(pid==0){
    	tj();
    }else{
    	if(nodes[0].level==1){
        	layer.msg("底部管理只能添加到二级");
            return;
        }else{
        	tj();
        }
    }
}

function tj(){
	openDialog('shop/footer/add.jsp',function(index){
        var result = required("addAuctionForm");
        var hrefs = $("#hrefs").val();
        var reg=/(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/;
        /*if(hrefs!="#"){
        	if(!reg.test(hrefs)){
    			layer.msg("不是正确的网址吧，请注意检查一下");
    			$("#hrefs").focus();
    			return;
    		}
        }*/
        $("#pid").val(pid);
        if(result){//提交表单
            $.ajax({
                method:'post',
                url:'auction/footer/add.htm',  
                cache:false,
                contentType:false,
                processData:false,
                data:new FormData($("#addAuctionForm")[0]),
                success:function (data) {
                	layer.msg("添加完成!");
                	loadHtml(data);
                	layer.close(index)
                }
            })
        }
    });
}

function updateAuction(){
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
        openDialog('auction/footer/toUpdatePage.htm?id='+id,function(index){
            var result = required("addAuctionForm");
            var hrefs = $("#hrefs").val();
           /* var reg=/(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/;
            if(hrefs!="#"){
            	if(!reg.test(hrefs)){
        			layer.msg("不是正确的网址吧，请注意检查一下");
        			$("#hrefs").focus();
        			return;
        		}
            }*/
            if(result){//提交表单
                $.ajax({
                    method:'post',
                    url:'auction/footer/add.htm',
                    cache:false,
                    contentType:false,
                    processData:false,
                    data:new FormData($("#addAuctionForm")[0]),
                    success:function (data) {
                        layer.msg("修改完成");
                        loadHtml(data);
                        layer.close(index)
                    }
                })
            }
        });
    }
}

function delAuction(){
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
            url:'auction/footer/delete.htm',
            data:{ids:id},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

var setting = {
	    data: {
	        simpleData: {
	            enable: true
	        }
	    },
	    callback: {
	        onClick: getChild
	    }
	};
function getChild(event, treeId, treeNode) {
    $("#menuTable").load("auction/footer/listByPid.htm?pid="+treeNode.id);
    pid = treeNode.id;//在添加菜单时，默认父id
}