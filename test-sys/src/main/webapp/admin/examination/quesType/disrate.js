function addDisRate(result,insId){
	
	
	result=eval("("+result+")");
	
	if(result==true){
		var treeObj=$.fn.zTree.getZTreeObj("treeDemo");
		var nodes = treeObj.getSelectedNodes();
		
		if(nodes==null || nodes==''){
			alert("请选择部门或分类");
			return;
		}
		if(nodes.length==0){
			alert("请选择部门或分类");
			return;
		}
		if(nodes.length>0){
			
			if(nodes[0].level==0){
				alert("请选择部门或分类");
				return;
			}
		}
		var types='true';
		if(nodes[0].level==1){
			
			var treeObj=$.fn.zTree.getZTreeObj("treeDemo");
				var nodes = treeObj.getSelectedNodes();
				var opid=nodes[0].opid;
				var wid=nodes[0].wid;
				
				url='QuesTypeController/addBefore.htm?orgId='+wid+'&types='+types;
				$.ajax({
					type:"post",
					url:url,
					success:function(html){
						$("#mainContent").html(html);
					}
				})
			}else if( nodes[0].level!=0 && nodes[0].level!=1){
				
				var treeObj=$.fn.zTree.getZTreeObj("treeDemo");
				var nodes = treeObj.getSelectedNodes();
				var opid=nodes[0].opid;
				var wid=nodes[0].wid;
				
				types='false';
				urls='QuesTypeController/addBefore.htm?orgId='+wid+'&types='+types+'&indFIds='+opid;
				$.ajax({
					type:"post",
					url:urls,
					success:function(html){
						$("#mainContent").html(html);
					}
				})
			
			}
	}
	
	if(result==false){
		var treeObj=$.fn.zTree.getZTreeObj("treeDemo");
		var nodes = treeObj.getSelectedNodes();
		if(nodes==null || nodes==''){
			alert("请选择部门或分类");
			return;
		}
		
		if(nodes.length==0){
			alert("请选择部门或分类");
			return;
		}
		/*if(nodes.length>0){
			
			if(nodes[0].level==0){
				alert("请选择部门或分类");
				return;
			}
		}*/
		var treeObj=$.fn.zTree.getZTreeObj("treeDemo");
		
		/*if(treeObj==null){
			alert("请选择分类")
		}*/
		var nodes = treeObj.getSelectedNodes();
		
		/*if(nodes==null || nodes==''){
			alert("请选择分类");
		}*/
		/*var insIds=$("#insId").val();
		alert(insIds);*/
		var types="true";
		if(nodes[0].level==0){
			var treeObj=$.fn.zTree.getZTreeObj("treeDemo");
			var nodes = treeObj.getSelectedNodes();
			var nodes = treeObj.getSelectedNodes();
			var opid=nodes[0].opid;
			var wid=nodes[0].wid;
			
			url='QuesTypeController/addBefore.htm?orgId='+wid+'&types='+types;
			$.ajax({
				type:"post",
				url:url,
				success:function(html){
				$("#mainContent").html(html);
				}
			})
		}
		if(nodes[0].level!=0){
			var treeObj=$.fn.zTree.getZTreeObj("treeDemo");
			var nodes = treeObj.getSelectedNodes();
			var opid=nodes[0].opid;
			var wid=nodes[0].wid;
			
			types="false";
			/*var nid=nodes[0].id;*/
			url='QuesTypeController/addBefore.htm?orgId='+wid+'&types='+types+'&indFIds='+opid;
			$.ajax({
				type:"post",
				url:url,
				success:function(html){
					$("#mainContent").html(html);
				}
			})
		}
		
	}
	
	
	
	
}

function fanhuishuoye(){
	$("#mainContent").load("QuesTypeController/getList.htm");
}

function queren(){
	
	var result = required("addDisRateForm");
	if(result){
		var types=$("#types").val();
		var orgId=$("#orgId").val();
		var indFIds=$("#indFIds").val();
		var name=$("#name").val();
		
		
		
		$.ajax({
			type:"post",
			url:"QuesTypeController/add.htm",
			data:{types:types,orgId:orgId,name:name,indFIds:indFIds},
			success:function(html){
				layer.msg("添加成功");
				$("#mainContent").html(html);
				
			}
			
		})
	}
	
	
}


//添加用
function pdsboom1(orgId){
	$("#pid").find("option").remove();
	$("#pid").append('<option>-请选择要添加分类的父级分类-</option>');
	$.ajax({
		url : "QuesTypeController/getquesType.htm?insId="+orgId,/* 这是父类的id */
		success : function(data) {/* 子类的数据 */
			/* console.log(data) */
			var data = eval("("+data+")");
			for(var i=0;i<data.length;i++){
			$("#pid").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>")
			}
			
		}
	});
	
}


function pdsboom2(orgId){
	
	$("#pid").find("option").remove();
	$("#pid").append('<option>--请选择--</option>');
	$.ajax({
		url : "QuesTypeController/getquesType.htm?insId="+orgId,/* 这是父类的id */
		success : function(data) {/* 子类的数据 */
			/* console.log(data) */
			var data = eval("("+data+")");
			for(var i=0;i<data.length;i++){
			$("#pid").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>")
			}
			
		}
	});
}


//删除
function delDisRate(){
	
	var page = $("#disRatePage").val();
    var checks = $(".table input:checked");
    if(checks.length != 1){
        layer.msg("请选择一条数据");
        return;
    }
    var ids = $(checks[0]).val();
    layer.confirm("确认删除吗?",function(index){
    	
    	$.ajax({
            type:'post',
            url:'QuesTypeController/delete.htm',
            data:{ids:ids,page:page},
            success:function (data) {
                data = eval('('+data+')');
                layer.msg(data.msg)
                if(data.result == 'fail'){
                	return;
                }
              
                $.ajax({
                	type:"post",
                	url:"QuesTypeController/getTypeLists.htm",
                	success:function(data){
                		
                		$("#quesTypeList").html(data);
                		/*$("#quesTypeList").html(html);*/
                        layer.close(index)
                	}
                	
                })
                
            }
        })
    });
}

function updateDisRate(){
	var result = required("editDisRateForm");
	if(result){
		var treeObj=$.fn.zTree.getZTreeObj("treeDemo");
		var nodes = treeObj.getSelectedNodes();
		
		var page = $("#disRatePage").val();
	    var checks = $(".table input:checked");
	    if(checks.length != 1 && nodes.length==0){
	        layer.msg("请选择一条数据");
	        return;
	    }
	    
	    if(checks.length==1){
	    	edit('QuesTypeController/updateBefore.htm?id=' + $(checks[0]).val(),
	    	        "editDisRateForm",
	    	        "QuesTypeController/update.htm?page="+page,
	    	        "修改题库分类",
	    	        "QuesTypeController/getList.htm?page="+page,
	    	        '题库分类列');
	    }
	    
	    if(nodes.length!=0){
	    	var treeObj2 = $.fn.zTree.getZTreeObj("treeDemo2");
	    	var nodes2 = treeObj2.getSelectedNodes();
	    	if(nodes2.length!=0 && checks.length==0){
	    		var nid2=nodes2[0].id;
	    		edit('QuesTypeController/updateBefore.htm?id='+nid2,
	        	        "editDisRateForm",
	        	        "QuesTypeController/update.htm?page="+page,
	        	        "修改题库分类",
	        	        "QuesTypeController/getList.htm?page="+page,
	        	        '题库分类列');
	    		
	    	}
	    	if(nodes2.length==0 && checks.length==0){
	    		alert("请选择分类")
	    	}
	    	
	    }
	}
	
}


//==================以下是树型结构
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
    $("#menuTable").load("menu/listByPid.htm?pid="+treeNode.id);
    pid = treeNode.id;//在添加菜单时，默认父id
}


function chakans(insId){
	
	$.ajax({
		type:"post",
		url:"QuesTypeController/getOrgToQuesType.htm?orgId="+insId,
		success:function(html){
			
			
			$("#quesTypeList").html(html);
		}
		
	})
	
	
	
}
