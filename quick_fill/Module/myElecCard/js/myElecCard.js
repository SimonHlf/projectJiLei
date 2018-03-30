function binding(){
	var number = $("#addCardInp").val();
	if(number==null || number.length<=0){
		toast("请输入电卡编号");
		return false;
	}
	$.ajax({
		url:"addElectric.htm",
		type:"post",
		data:{"number":number},
		dataType:"JSON",
		success:function(data){
			toast(data.msg);
			if(data.msg != null &&data.msg != ""){
				 setTimeout(function(){
					 var item = {};
					 httpPost("userElectric.htm",item);
					 closeAlert($('.addCardDiv'));
			     },1500);
			}
		}
	})
}

function userDelCard(id){
	$.ajax({
		url:"userDelCard.htm",
		type:"post",
		data:{"cardId":id},
		dataType:"JSON",
		success:function(data){
			toast(data.msg);
			location.reload();
		}
	})
}
//发送POST请求跳转到指定页面
function httpPost(URL, PARAMS) {
    var temp = document.createElement("form");
    temp.action = URL;
    temp.method = "post";
    temp.style.display = "none";

    for (var x in PARAMS) {
        var opt = document.createElement("textarea");
        opt.name = x;
        opt.value = PARAMS[x];
        temp.appendChild(opt);
    }

    document.body.appendChild(temp);
    temp.submit();

    return temp;
}
