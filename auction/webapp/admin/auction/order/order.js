var str='${param.str}';
function selectOrder(str) {

	var orderNum=$("#orderNum").val();
	var userName=$("#userName").val();
	var payType=$("#payType").val();
	var time1=$("#time1").val();
	var time2=$("#time2").val();
	var time3=$("#time3").val();
	var time4=$("#time4").val();

 	if(orderNum==undefined){
 		orderNum='';
 		userName='';
 		payType='';
 		time1='';
 		time2='';
 		time3='';
 		time4='';
 	}
	if(time1!=''){
		if(time2==''){
			layer.msg('下单截止日期不能为空！');
			return;
		}
	}
	if(time3!=''){
		if(time4==''){
			layer.msg('付款截止时间不能为空！');
			return;
		}
	}
	var data='';

	if (str == "all") {
		data={};
		str="all";	
	}	
	if (str == "daifukuan") {
		data={"payState" : 0,"status" : 2};	
		str="daifukuan";
	}
	if (str == "daifahuo") {
		data={"payState" : 1,"setState" : 2,"status" : 2};
		str="daifahuo";
	}
	if (str == "daishouhuo") {
		data={"payState" : 1,"setState" : 1,"status" : 2};
		str="all";
	}
	if (str == "daipingjia") {
		data={"payState" : 1,"setState" : 3,"isConment":0};
		str="daipingjia";
	}
	if (str == "yiwancheng") {
		data={"isConment":1};
		str="yiwancheng";
	}
	if (str == "applytui") {
		data={"remark":0};
		str="applytui";
	}
	if (str == "yituikuan") {
		data={"refund" : 2};
		str="yituikuan";
	}
	if (str == "yiguanbi") {
		data={"status" : 3};
		str="yiguanbi";
	}
	$.ajax({
		method : 'post',
		url : 'shop/orderController/selectAllOrder.htm?orderNum='+orderNum+'&userName='+userName+'&payType='+payType+'&time1='+time1+'&time2='+time2+'&time3='+time3+'&time4='+time4+"&str="+str,
		data : data,
		success : function(data) {
			loadHtml(data);
		}
	});
}

function detail(id){
	$.ajax({
	       method:'post',
	       url:'shop/orderController/selectOrderDetail.htm',
	       data:{"orderId":id},
	       success:function (html) {
	         $("#main_content").html(html);
	          
	       }
	   })
	
}
//删除订单
function delOrder(orderId){
	
	$.ajax({
       method:'post',
       url:'${pageContext.request.contextPath}/web/shop/orderController/delOrder.htm',
       data:{"state":1,"orderId":orderId},
       success:function (data) {
          var data=eval("("+data+")");
          if(data.result=="fail"){
          	
          }
          if(data.result=="ok"){
          	//我的订单列表
          	window.location.href="../orderController/selectAllOrder.htm";
          }
       }
   })
}

//取消订单
function quxiao(){
	$.ajax({
      method:'post',
      url:'${pageContext.request.contextPath}/web/shop/orderController/quxiaoOrder.htm',
      data:{"state":1,"orderId":order_id},
      success:function (data) {
         var data=eval("("+data+")");
         if(data.result=="fail"){
      		layer.msg(data.msg);
         }
         if(data.result=="ok"){
         	//我的订单列表
         		layer.msg(data.msg);
         		setTimeout('window.location.href = "../orderController/selectAllOrder.htm"',1500);
         }
      }
  })
} 
//添加物流信息
function addLogistics(orderNum) {
        openDialog('shop/orderController/toAddLogistics.htm?orderNum='+orderNum,function(index){
            var result = required("addLogisticsForm");
            if(result){//提交表单
                $.ajax({
                    method:'post',
                    url:'shop/orderController/addLogistics.htm',
                    async: false, 
                    cache: false,
                    contentType:false,
                    processData:false,
                    data:new FormData($("#addLogisticsForm")[0]),
                    success:function (data) {
                        layer.msg("添加完成");
                        loadHtml(data);
                        layer.close(index);
                    }
                })
            }
        });
}

//修改物流信息
function editLogistics(orderNum) {
        openDialog('shop/orderController/toEditLogistics.htm?orderNum='+orderNum,function(index){
            var result = required("editLogisticsForm");
            if(result){//提交表单
                $.ajax({
                    method:'post',
                    url:'shop/orderController/editLogistics.htm',
                    async: false, 
                    cache: false,
                    contentType:false,
                    processData:false,
                    data:new FormData($("#editLogisticsForm")[0]),
                    success:function (data) {
                        layer.msg("修改完成");
                        loadHtml(data);
                        layer.close(index);
                    }
                })
            }
        });
}
//查看物流信息expressnum=EMS&tracknum=1197081775996
function wuliu(productId,expressnum,tracknum){
    openDialog("shop/logisticsApi/queryLogistics.htm?productId="+productId+"&expressnum="+expressnum+"&tracknum="+tracknum,function(index){
	//openDialog('shop/logistics/queryLogistics.htm?productId='+productId+'&expressnum=ems&tracknum=1197081775996',function(index){
    });
}

//确认收货
function confirm_receipt(orderNum){
	$.ajax({
        method:'post',
        url:'shop/logistics/makesure.htm',
        data:{"orderNum":orderNum,"setState":3},
        success:function (data) {
           var data=eval("("+data+")");
           if(data.result=="fail"){
        		layer.msg("确认收货失败");
           }
           if(data.result=="ok"){
           	//我的订单
           	layer.msg("确认收货成功");
           	setTimeout(function(){ 
           		selectOrder(str);
           	},
           	1500);
           }
        }
    })
	
}
//发货
function sendout(orderNum){
	$.ajax({
        method:'post',
        url:'shop/logistics/makesure.htm',
        data:{"orderNum":orderNum,"setState":1},
        success:function (data) {
           var data=eval("("+data+")");
           if(data.result=="fail"){
        		layer.msg("发货失败");
           }
           if(data.result=="ok"){
           	//我的订单
           	layer.msg("发货成功");
           	setTimeout(function(){ 
           		selectOrder(str);
           	},
           	1500);
           }
        }
    })
	
	
}

function exitExcel(){
	window.location.href="shop/orderExcelController/orderExcel.htm";
	
}

function importExcel(){

	  openDialog('shop/order/add_excel.jsp',function(index){
          var result = required("importExcelForm");
          
          var file=$("#fileexcel").val();
          if(file==""){
        	  layer.msg("请上传Excell");
        	  return false;
          }
          if(file!=''){
    	    var fileext=file.substring(file.lastIndexOf("."),file.length)  
    	    fileext=fileext.toLowerCase()  
    	    if (fileext!='.xls'&& fileext!='.xlsx'){  
    	    	layer.msg("对不起，导入数据格式必须是xls或xlsx格式文件哦，请您调整格式后重新上传，谢谢 ！");  
    	        return false;  
    	    }  
    	    return true;  
          }
          
          if(result){//提交表单
              $.ajax({
                  method:'post',
                  url:'shop/orderExcelController/importExcel.htm',
                  async: false, 
                  cache: false,
                  contentType:false,
                  processData:false,
                  data:new FormData($("#importExcelForm")[0]),
                  success:function (data) {
                      layer.msg("导入完成");
                      loadHtml(data);
                      layer.close(index)
                      //去订单列表
                      
                  }
              })
          }
      });
}
