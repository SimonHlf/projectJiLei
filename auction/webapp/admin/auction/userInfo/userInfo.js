var flag=false;
function addFUserInfo() {	
    if(isDialog==1) {
    	openDialog("auction/userInfo/add.jsp", function () {
    		if(flag==false){
    			layer.msg("请按照规范填写信息");
    			return;
    		}
    		
    		var tel="/^0\d{2,3}-?\d{7,8}$/";
            var telphone=$("#telphone").val();
    		if(!tel.test(telphone)){
    			layer.msg("固话格式不正确");
    			return;
            }
    		var em= "/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/";
            var email=$("#email").val();
    		if(!em.test(email)){
    			layer.msg("邮箱格式不正确");
    			return;
            }
    		editSave("shop/userInfoController/add.htm","addUserInfoForm");
        }, "添加用户");
    	
    }else{
        var tpl = $("#editTpl").html();
        $.get("auction/userInfo/add.jsp",function(data){
            var data1 = {"title":"添加用户","body":$(data).find(".widget-body").html(),
                "back":"ajaxLoad('auction/rmbProductController/list.htm','用户列表')"};
            layui.laytpl(tpl).render(data1, function(html){
                loadHtml(html);
                
                $("#mainContent").find(".btn-ok").click(function () {
                	if(flag==false){
            			layer.msg("请按照规范填写信息");
            			return;
            		}
            		
            		var tel= /^0\d{2,3}-?\d{7,8}$/;
                    var telphone=$("#telphone").val();
            		if(!tel.test(telphone)){
            			layer.msg("固话格式不正确");
            			return;
                    }
            		var em= /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
                    var email=$("#email").val();
            		if(!em.test(email)){
            			layer.msg("邮箱格式不正确");
            			return;
                    }
                    editSave("shop/userInfoController/add.htm","addUserInfoForm");
                })
            });
        });
    }   
}
function checkAccount(account){
	 $.ajax({
	        method:'post',
	        url:'shop/userInfoController/checkAccount.htm',
	        data:{account:account},
	        success:function (data) {
	            // data=eval("("+data+")");
	            if(data.result=="ok"){
	            	flag=true;
	            }else{
	            	flag=false;
	            	layer.msg(data.msg);
	            }
	        }
	    });
}
function checkPhone(phone){
	 $.ajax({
	        method:'post',
	        url:'shop/userInfoController/checkPhone.htm',
	        data:{phone:phone},
	        success:function (data) {
	        	// data=eval("("+data+")");
	            if(data.result=="ok"){
	            	flag=true;
	            }else{
	            	flag=false;
	            	layer.msg(data.msg);
	            }
	        }
	    });
}
function editFUserInfo() {
var checks = $(".table input:checked");
    
    if(checks.length==1){
	    if(isDialog==1) {
	    	openDialog("shop/userInfoController/toEdit.htm?id="+$(checks[0]).val(), function () {
	    		if(flag==false){
	    			layer.msg("请按照规范填写信息");
	    			return;
	    		}
	    		
	    		var tel= /^0\d{2,3}-?\d{7,8}$/;
	            var telphone=$("#telphone").val();
	    		if(!tel.test(telphone)){
	    			layer.msg("固话格式不正确");
	    			return;
	            }
	    		var em= /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
	            var email=$("#email").val();
	    		if(!em.test(email)){
	    			layer.msg("邮箱格式不正确");
	    			return;
	            }
	    		editSave("shop/userInfoController/edit.htm","editUserInfoForm");
	        }, "修改用户");
	    	
	    }else{
	        var tpl = $("#editTpl").html();
	        $.get("shop/userInfoController/toEdit.htm?id="+$(checks[0]).val(),function(data){
	            var data1 = {"title":"修改用户","body":$(data).find(".widget-body").html(),
	                "back":"ajaxLoad('auction/rmbProductController/list.htm','用户列表')"};
	            layui.laytpl(tpl).render(data1, function(html){
	                loadHtml(html);
	                
	                $("#mainContent").find(".btn-ok").click(function () {
	                	if(flag==false){
	    	    			layer.msg("请按照规范填写信息");
	    	    			return;
	    	    		}
	    	    		
	    	    		var tel= /^0\d{2,3}-?\d{7,8}$/;
	    	            var telphone=$("#telphone").val();
	    	    		if(!tel.test(telphone)){
	    	    			layer.msg("固话格式不正确");
	    	    			return;
	    	            }
	    	    		var em= /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
	    	            var email=$("#email").val();
	    	    		if(!em.test(email)){
	    	    			layer.msg("邮箱格式不正确");
	    	    			return;
	    	            }
	                    editSave("shop/userInfoController/edit.htm","editUserInfoForm");
	                })
	            });
	        });
	    }
    }else{
    	layer.msg("请选择一条数据")
    }  
   
}

//查询
function searchFUserInfo() {
	
    $.ajax({
        method:'post',
        url:'shop/userInfoController/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchUserInfoForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}

//锁定
function lock(status){
	 var ids = "-1";
	    var checks = $(".table input:checked");
	    $(".table input:checked").each(function () {
	       ids = ids + "," + $(this).val();
	    });
	if(checks.length>0){
		$.ajax({
			method:'post',
			url:'shop/userInfoController/editStatus.htm',
			data:{
				status:status,
				ids:ids
			},
			success:function(data){
				loadHtml(data);
			}
		})
	}else{
		 layer.msg("请选择数据")
	}
}

function updatePassword(account){
	 $.ajax({
	        url:'shop/userInfoController/toEditPassword.htm?account='+account,
	        success:function(data){
	            layer.open({
	                type:1,
	                area:'500px',
	                title:'修改密码',
	                fixed:false,
	                maxmin:true,
	                scrollbar:false,
	                content: data,
	                btn:['确定','关闭'],
	                yes:function () {
	                    
	                    $.ajax({
	                        method : 'post',
	                        url : 'shop/userInfoController/editPassword.htm',
	                        cache: false,
	                        contentType: false,
	                        processData: false,
	                        data:new FormData($("#editPasswordForm")[0]),
	                        success : function() {
	                            layer.closeAll();
	                            layer.msg("修改完成");
	                        }
	                    })
	                }
	            });
	        }
	    })
}

//去绑定上级会员代理商
function toAddCodes(id){
	 $.ajax({
	        url:'shop/userInfoController/toAddCodes.htm?id='+id,
	        success:function(data){
	            layer.open({
	                type:1,
	                area:'700px',
	                title:'绑定上级会员代理商',
	                fixed:false,
	                maxmin:true,
	                scrollbar:false,
	                content: data,
	                btn:['确定','关闭'],
	                yes:function () {
	                    var codes=$("#codes").val();
	                    if(codes==""){
	                    	layer.msg("请输入上级会员代理商推广码");
	                    }else{
	                    	  $.ajax({
	  	                        method : 'post',
	  	                        url : 'shop/userInfoController/addCodes.htm',
	  	                        cache: false,
	  	                        contentType: false,
	  	                        processData: false,
	  	                        data:new FormData($("#addCodeForm")[0]),
	  	                        success : function(data) {
	  	                        	//data=eval("("+data+")");
	  	                        	if(data.result=="fail"){
	  	                				layer.msg(data.msg);	
	  	                			}
	  	                			if(data.result=="ok"){
	  	                				layer.closeAll();
	  	                				layer.msg(data.msg);
	  	                				
	  	                				
	  	                			}
	  	                        }
	  	                    })
	                    }
	                  
	                }
	            });
	        }
	    })
}
