//审核
function shenhe(status,id){
var content=$("#content").val();
    $.ajax({
        method:'post',
        url:'shop/userIdentController/shenhe.htm',
        data:{status:status,id:id,content:content},
        success:function (data) {
            loadHtml(data);
        }
    })
	    
}
//查看详情
function queryDetail(id){
	 $.ajax({
	        method:'post',
	        url:'shop/userIdentController/queryDetail.htm',
	        data:{id:id},
	        success:function (data) {
	            loadHtml(data);
	        }
	    })
}
//详情页返回列表
function callback(page){
	$.ajax({
        method:'post',
        url:'shop/userIdentController/list.htm',
        data:{page:page},
        success:function (data) {
            loadHtml(data);
        }
    })
}

function searchIdent(){
	var userName=$("#userName").val();
	var telphone=$("#telphone").val();
	var status=$("#status").val();
	$.ajax({
        method:'post',
        url:'shop/userIdentController/list.htm',
        data:{userName:userName,telphone:telphone,status:status},
        success:function (data) {
            loadHtml(data);
        }
    })
}
