function delCredit(){
    var ids = "-1";
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'shop/contact/del.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

function addCredit() {
	 openDialog('contactway/add.jsp',function(index){
        var result = required("addAdSlotForm");
        var contactNuma = $("#contactNuma").val();
        var reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
        var type = $("#type").val();
        if(type!=4 && type!=5){
        	if(contactNuma!=''){
            	if(!reg.test(contactNuma)){
                	layer.msg("不是正确的手机号，请注意检查一下");
                	$("#contactNuma").focus();
                	return;
                }
            }
        }
        
        if(result){//提交表单
            $.ajax({
                method:'post',
                url:'shop/contact/add.htm',  
                cache:false,
                contentType:false,
                processData:false,
                data:new FormData($("#addAdSlotForm")[0]),
                success:function (data) {
                	layer.msg("添加完成!");
                	loadHtml(data);
                	layer.close(index)
                }
            })
        }
	});
}

function editCredit() {
	var checks = $(".table input:checked");
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
        openDialog('shop/contact/edit.htm?id='+id,function(index){
            var result = required("editCreditForm");
            var contactNuma = $("#contactNuma").val();
            var reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
            if(contactNuma!=null){
            	if(!reg.test(contactNuma)){
                	layer.msg("不是正确的手机号，请注意检查一下");
                	$("#contactNuma").focus();
                	return;
                }
            }
            if(result){//提交表单
                $.ajax({
                    method:'post',
                    url:'shop/contact/update.htm',
                    cache:false,
                    contentType:false,
                    processData:false,
                    data:new FormData($("#editCreditForm")[0]),
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

function types(obj){
	if(obj==4){
		var str = "<label class='col-sm-2 control-label no-padding-right'>二维码</label>"+
				  "<div class='col-sm-9'>"+
				  "<div class='fileupload fileupload-new' data-provides='fileupload'>"+
				  "<div class='fileupload-new thumbnail' style='width: 200px; height: 150px;'>"+
				  "<img src='http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image' alt='' /></div>"+
				  "<div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 200px; max-height: 150px; line-height: 20px;'></div>"+
				  "<div><span class='btn btn-default btn-file'>"+
				  "<span class='fileupload-new'><i class='fa fa-paper-clip'></i>选择图片</span>"+
				  "<span class='fileupload-exists'><i class='fa fa-undo'></i> 替换</span> 上传图片"+
				  "<input type='file' class='default' name='headImage' id='imgs' /></span> "+
				  "<a href='#' class='btn btn-danger fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash'></i> 删除 </a>"+
				  "</div><span id='pictureSpan'></span></div></div>";
		$("#types").html(str);
	}else if(obj==0 || obj==1 || obj==2 || obj==3){
		var str = "<label class='col-sm-2 control-label no-padding-right'>联系号码</label>"+
				  "<div class='col-sm-9'>"+
				  "<input class='form-control' maxlength='11' id='contactNuma' name='contactNuma' placeholder='联系号码' required> </div>";
		$("#types").html(str);
	}else if(obj==5){
		var str = "<label class='col-sm-2 control-label no-padding-right'>二维码简介</label>"+
		  "<div class='col-sm-9'>"+
		  "<input class='form-control' id='contactNuma' name='contactNuma' placeholder='二维码简介' required> </div>";
			$("#types").html(str);
	}
}

function searchCredit() {
    $.ajax({
        method:'post',
        url:'shop/contact/list.htm',
        cache: false,
        contentType: false,
        processData: false,
        data:new FormData($("#searchCreditForm")[0]),
        success:function (data) {
            loadHtml(data);
        }
    });
}

function checkUsername(){
	var userId = $.trim($("#userId").val());
	var reg = /^[0-9]{1,11}$/;
	var falg = true;
	if(userId != null && userId != ""){
		if(!reg.test(userId)){
			layer.tips("您输入的用户ID格式错误", "#userId", {tips: [2, "#E34127"],time: 1000});
			falg = false;
		}
	}
	return falg;
}

function checkMoneyname(){
	var userId = $.trim($("#money").val());
	var reg = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/;
	var falg = true;
	if(userId != null && userId != ""){
		if(!reg.test(userId)){
			layer.tips("您输入的金额格式错误", "#money", {tips: [2, "#E34127"],time: 1000});
			falg = false;
		}
	}
	return falg;
}

function checkSerioname(){
	var userId = $.trim($("#lotId").val());
	var reg = /^[0-9]{1,11}$/;
	var falg = true;
	if(userId != null && userId != ""){
		if(!reg.test(userId)){
			layer.tips("您输入的期数格式错误", "#lotId", {tips: [2, "#E34127"],time: 1000});
			falg = false;
		}
	}
	return falg;
}