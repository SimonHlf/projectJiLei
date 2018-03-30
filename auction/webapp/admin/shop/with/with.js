function searchItem() {
    $.ajax({
        method:'post',
        url:'auction/withdraw/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchItemForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}

function details(id,auId){
	$.ajax({
        method:'post',
        url:'auction/auctionLog/list.htm',
        data:{setUpId:id,auctionId:auId},
        success:function (data) {
            loadHtml(data);
        }
    });
}

function adopt(id,flag,money,userId){
	if(flag==1){
		$.ajax({
	        method:'post',
	        url:'auction/withdraw/adopt.htm',
	        data:{fid:id,type:flag},
	        success:function (data) {
	            loadHtml(data);
	        }
	    });
	}else{
		openDialog('shop/with/refuse.jsp',function(index){
			var refuse = $("#refuse").val();
			$.ajax({
		        method:'post',
		        url:'auction/withdraw/adopt.htm',
		        data:{fid:id,type:flag,refuse:refuse,money:money,userId:userId},
		        success:function (data) {
		            loadHtml(data);
		            layer.close(index)
		        }
		    });
		})
	}
}