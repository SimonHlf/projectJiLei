//考试信息下的查询
function chaxun(){
	var paperName=$("#searchByname").val();
	$.ajax({
		type:'post',
		url:'PaperCreatFontCountroller/getPaperCreatNow.htm',
		data:{paperName:paperName},
		success:function(data){
			$("#personalContent").html(data);
		},
		error:function(){
			alert("网络错误，请稍后再试");
		}
	})      
}    
        
//开始考试


function startTest(orgId,paperCreatId,examId){
	
	/*var url="PaperCreatFontCountroller/toStartTest.htm?orgId="+orgId+"&paperCreatId="+paperCreatId+"&examId="+examId;*/
	//先校验 考试次数
	$.ajax({
		type:'post',
		url:'PaperCreatFontCountroller/checkExamSecond.htm',
		data:{
			examId:examId
		},
		success:function(data){
			var json = eval('('+data+')');
			if(json.result == "false"){
				alert("考试次数已完");
			} else {
                window.open("PaperCreatFontCountroller/toStartTest.htm?orgId="+orgId+"&paperCreatId="+paperCreatId+"&examId="+examId,'_blank','fullscreen=yes,menubar=no,scrollbars=yes,location=yes,status=no')
			}
		}
	})

	/*$.post(url,function(data){
		layer.open({
			type:1,
		 	 title:"选择类型",
		 	 skin:'layui-layer-rim',//加上边框
		 	 area:['260px','160px'],//宽高
		 	 maxmin: true,
		 	 btn:['确定','取消'],
		 	 yes:function(index){
		 		 addDisRate(userWho);
		 		 layer.close(index);
		 	 },
		 	 content:data,
		 	 zIndex:99999999
		});
	})*/
	
/*function startTest(orgId,paperCreatId,str){console.log(str)
	window.open("PaperCreatFontCountroller/toStartTest.htm?orgId="+orgId+"&paperCreatId="+paperCreatId+"&examId="+str,'_blank','fullscreen=yes,menubar=no,scrollbars=yes,location=yes,status=no')
*/


/*function startTest(orgId,paperCreatId,examId) {
    window.open("PaperCreatFontCountroller/toStartTest.htm?orgId=" + orgId + "&paperCreatId=" + paperCreatId + "&examId=" + examId, '_blank', 'fullscreen=yes,menubar=no,scrollbars=yes,location=yes,status=no')
}*/
// function startTest(orgId,paperCreatId,str) {
//     console.log(str)
//     window.open("PaperCreatFontCountroller/toStartTest.htm?orgId=" + orgId + "&paperCreatId=" + paperCreatId + "&examId=" + str, '_blank', 'fullscreen=yes,menubar=no,scrollbars=yes,location=yes,status=no')


	//window.location.href="PaperCreatFontCountroller/toStartTest.htm?orgId="+orgId+"&paperCreatId="+paperCreatId;
/*$.ajax({
		type:'post',
		url:'PaperCreatFontCountroller/toStartTest.htm',
		data:{orgId:orgId,paperCreatId:paperCreatId},
		success:function(data){
			$("#personalContent").html(data);
		},
		error:function(){
			alert("网络错误，请稍后再试");
		}
	})*/	
}

//记录中的条件查询
function chaxuns(){
	var paperCreatName=$("#paperCreatName").val();
	//二次编码
	paperCreatName=encodeURI(encodeURI(paperCreatName));
	$.ajax({
		type:"post",
		url:"PaperCreatFontCountroller/getRecord.htm?paperCreatName="+paperCreatName,
		success:function(data){
			$("#personalContent").html(data);
		},
		error:function(){
			alert("网络错误，请稍后再试");
		}
	})
}

//前台考试记录查看
function lookDetail(recordId,examinationId){
	window.open("PaperCreatFontCountroller/getRecordDetail.htm?recordId="+recordId+"&examinationId="+examinationId,'_blank','fullscreen=yes,menubar=no,scrollbars=yes,location=yes,status=no')
	/*window.location.href="PaperCreatFontCountroller/getRecordDetail.htm?recordId="+recordId+"&examinationId="+examinationId;*/
}

