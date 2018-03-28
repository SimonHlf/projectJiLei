function ajaxLoad(url,name,obj){
    $("#mainContent").load(url);
    if(name)
        $("#breadcrumbName").html(name);
    if(obj)
        $(obj).parent().addClass("active");
}

function loadHtml(html) {
    $("#mainContent").html(html);

}

//打开窗口
function openDialog(url,callback,title,width){
    if(!width) width = 500;
    if(!title) title = "信息";
    $.ajax({
        url:url,
        success:function(data){
            layer.open({
                type:1,
                area:width+'px',
                title:title,
                fixed:false,
                maxmin:true,
                scrollbar:false,
                content: data,
                btn:['确定','关闭'],
                yes:callback
            });
        }
    })
}

function openHelp(url,title,width){
    if(!width) width = 500;
    if(!title) title = "帮助";
    $.ajax({
        url:url,
        success:function(data){
            layer.open({
                type:1,
                area:width+'px',
                title:title,
                fixed:false,
                maxmin:true,
                scrollbar:false,
                content: data
            });
        }
    })
}

//校验必选项
function required(formid){
    var result = true;
    $("#"+formid).find(":input[required]").each(function () {
        if(!$(this).val()){
            result = false;
            $(this).parent().parent().addClass("has-error");
            layer.msg($(this).attr("placeholder")+"不可以为空.")
            return false;
        }
    });
    return result;
}

function editSave(actionUrl,formid){
    var result = required(formid);
    if (result) {//提交表单
        $.ajax({
            method: 'post',
            url: actionUrl,
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData($("#"+formid)[0]),
            success: function (data) {
                loadHtml(data);
                layer.msg("操作已成功。");
                layer.closeAll();
            },error:function(){
            	alert('操作失败');
            }
        })
    }
}

//添加方法
function edit(jumpUrl,formid,actionUrl,title,listUrl,listTitle) {
    if(isDialog==1) {
        openDialog(jumpUrl, function () {
            editSave(actionUrl,formid);
        }, title);
    }else{
        var tpl = $("#editTpl").html();
        $.get(jumpUrl,function(data){
            var data1 = {"title":title,"body":$(data).find(".widget-body").html(),
                "back":"ajaxLoad('"+listUrl+"','"+listTitle+"')"};
            layui.laytpl(tpl).render(data1, function(html){
                loadHtml(html);
                $("#mainContent").find(".btn-ok").click(function () {
                    editSave(actionUrl,formid);
                })
            });
        });
    }
}

function executeHtml(html){
    var regDetectJs = /<script(.|\n)*?>(.|\n|\r\n)*?<\/script>/ig;
    var jsContained = html.match(regDetectJs);

    if(jsContained) {
        // 分段取出js正则
        var regGetJS = /<script(.|\n)*?>((.|\n|\r\n)*)?<\/script>/im;

        // 按顺序分段执行js
        var jsNums = jsContained.length;
        for (var i=0; i<jsNums; i++) {
            var jsSection = jsContained[i].match(regGetJS);

            if(jsSection[2]) {
                if(window.execScript) {
                    // 给IE的特殊待遇
                    window.execScript(jsSection[2]);
                } else {
                    // 给其他大部分浏览器用的
                    window.eval(jsSection[2]);
                }
            }
        }
    }
}

function open_(obj){
    layer.open({
        type: 1,
        shade: false,
        title: false,
        content: "<img src='"+$(obj).attr("src")+"' style='width:300px;height:300px;'/>"
    });
}


//显示查询窗口
function openSearch(searchid) {
    $("#"+searchid).slideToggle("slow");
}