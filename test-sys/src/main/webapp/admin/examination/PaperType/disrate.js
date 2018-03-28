function addDisRate(){
	/*$.ajax({
		type:"post",
		url:"QuesTypeController/addBefore.htm",
		success:function(html){
			alert(html); 
			$("#mainContent").html(html);
			 
		}
		
	})*/
	
   var page = $("#disRatePage").val();
    edit("QuesTypeController/addBefore.htm",
        "addDisRateForm",
        "QuesTypeController/add.htm",
        "添加题库分类",
        "QuesTypeController/getList.htm",
        '题库分类列表');
}


function deletype(){
	/*alert(1)*/
}


function delDisRate(){
	/*alert(11)*/
	
    
}

function updateDisRate(){
    var page = $("#disRatePage").val();
    var checks = $(".table input:checked");
    if(checks.length != 1){
        layer.msg("请选择一条数据");
        return;
    }
    edit('QuesTypeController/updateBefore.htm?id=' + $(checks[0]).val(),
        "editDisRateForm",
        "QuesTypeController/update.htm?page="+page,
        "修改题库分类",
        "QuesTypeController/getList.htm?page="+page,
        '题库分类列');
}
