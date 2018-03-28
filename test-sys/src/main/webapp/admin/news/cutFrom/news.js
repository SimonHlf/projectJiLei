function addNews() {
    edit("news/cutFrom/add.jsp",
        "addNewsForm",
        "news/news/add.htm?attr0=1",
        "添加新闻",
        "news/news/list.htm?attr0=1",
        '新闻列表');
}

function editNews() {
    var checks = $(".table input:checked");
    if(checks.length>0){
        edit('news/news/edit.htm?id='+$(checks[0]).val(),
            "editNewsForm",
            "news/news/add.htm?attr0=1",
            "修改新闻",
            "news/news/list.htm?attr0=1",
            '新闻列表');
    }else{
        layer.msg("请选择数据")
    }
}

function delNews(){
    var ids = "-1";
    $(".table input:checked").each(function () {
       ids = ids + "," + $(this).val();
    });
    layer.confirm("确认删除吗?",function(index){
        $.ajax({
            method:'post',
            url:'news/news/del.htm',
            data:{ids:ids},
            success:function (data) {
                loadHtml(data);
                layer.close(index)
            }
        })
    });
}

//根据标题查询
function findByTitle(){
	  $.ajax({
	        method:'post',
	        url:'news/news/list.htm?attr0=1',
	        cache: false,
	        contentType: false,
	        processData: false,
	        data:new FormData($("#searchNewsForm")[0]),
	        success:function (data) {
	            loadHtml(data);
	        }
	    });
}

function details(cmd){
	$.ajax({
		method:'post',
		url:'news/news/details.htm?id=' + cmd ,
		data:{
			attr0:1
		},
		success:function(data){
			layer.msg("信息详情");
			loadHtml(data);
		}
	})
}

function show(cmd){

	$.ajax({
		method:'post',
		url:'news/news/show.htm?id=' + cmd,
		data:{
			attr3:'1'
		},
		success:function(data){
			loadHtml(data);
		}
	})
}
function noShow(cmd){
	$.ajax({
		method:'post',
		url:'news/news/show.htm?id=' + cmd,
		data:{
			attr3:'0'
		},
		success:function(data){
			loadHtml(data);
		}
	})
}