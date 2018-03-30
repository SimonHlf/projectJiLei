function addMoney(){
	var money = $("#money").val();
/*	var url = "/quick_fill/weChat/pay_.htm";
	var userId = $("#byuser").text();
	$.ajax({
		url:url,
		type:"post",
		data:{"money":money,"type":1},
		dataType:"json",
		success:function(result){
			alert(result.msg);
			var item = {
					"userId":userId
			}
			httpPost("/quick_fill/weChat/getByUserId.htm", item);
		}
	})*/
	window.location.href = "/quick_fill/weChat/pay_.htm?money="
		+ money+'&type=1';
}

function binding(){
	var number = $("#addCardInp").val();
	if(number==null || number.length<=0){
		toast("请输入电卡编号");
		return false;
	}
	$.ajax({
		url:"/quick_fill/weChat/getByUserAddCard.htm",
		type:"post",
		data:{"number":number},
		dataType:"JSON",
		success:function(data){
			toast(data.msg);
			var item = {
		
			}
			httpPost("/quick_fill/weChat/byUserCard.htm",item);
		}
	})
}

function userDelCard(id){
	$.ajax({
		url:"/quick_fill/weChat/getbyUserCardDel.htm",
		type:"post",
		data:{"cardId":id},
		dataType:"JSON",
		success:function(data){
			toast(data.msg);
			var item = {
					
			}
			httpPost("/quick_fill/weChat/byUserCard.htm",item);
		}
	})
}

function messageUpdate(){
	var realName = $("#realName").val();
	var nickName = $("#nickName").val();
	var phone = $("#phone").val();
	var address = $("#address").val();
	var param = $("#byuser").text();
	var zz = /^$/;
	if(!(/^1(3|4|5|7|8)\d{9}$/.test(phone))){ 
        toast("手机号码有误，请重填");  
        return false; 
    }
	$.ajax({
		url:"/quick_fill/weChat/updateUser.htm",
		type:"post",
		data:{"realName":realName,"nickName":nickName,"phone":phone,"address":address},
		dataType:"json",
		success:function(result){
			toast(result.msg);
			var item = {
					"userId":param
			}
			httpPost("/quick_fill/weChat/getByUserId.htm", item);
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
