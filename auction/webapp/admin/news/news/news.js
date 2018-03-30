function addNews() {
		var result = required("addNewsForm");
		if (result) {// 提交表单
			$.ajax({
				method : 'post',
				url : 'news/news/add.htm',
				cache : false,
				contentType : false,
				processData : false,
				data : new FormData($("#addNewsForm")[0]),
				success : function(data) {
					layer.msg("添加完成!");
					loadHtml(data);
				}
			});
		}
	 
}

function editNews() {
	var checks=$(".table input:checked")
	if(checks.length==0){
		layer.msg("请选择一条数据");
		return false;
	}
    if(checks.length>1){
    	layer.msg("请选择一条数据");
    	return false;
    }
    
    var id=$(checks[0]).val();
	if (checks) {
		
		openDialog('news/news/edit.htm?id=' + id,'','修改设置', 800,function(index) {
			
			var result = required("editNewsForm");
			if (result) {
				$.ajax({
					method : 'post',
					url : 'news/news/add.htm',
					cache : false,
					contentType : false,
					processData : false,
					data : new FormData($("#editNewsForm")[0]),
					success : function(data) {
						layer.msg("修改完成");
						loadHtml(data);
						layer.close(index)
					}
				})
			}
		});
	}
}

function selectNews() {
	var checks = $(".table input:checked");
	/* alert($(checks[0]).val()); */
	$.ajax({
		method : 'post',
		url : 'news/news/ByIdNews.htm?id=' + $(checks[0]).val(),
		success : function(data) {
			layer.msg("查询完成");
			/* $("#findNewsFrom").html(data); */
			loadHtml(data);
		}
	})
}

function delNews() {
	var ids = "";
	$(".table input:checked").each(function() {
		ids += $(this).val()+",";
	});
	layer.confirm("确认删除吗?", function(index) {
		$.ajax({
			method : 'post',
			url : 'news/news/del.htm',
			data : {
				ids : ids
			},
			success : function(data) {
				loadHtml(data);
				layer.close(index)
			}
		})
	});
}

var rows = document.getElementsByTagName('tr');
for (var i = 0; i < rows.length; i++) {
	rows[i].onmouseover = function() {
		this.className += 'altrow';
	}
	rows[i].onmouseout = function() {
		this.className = this.className.replace('altrow', '');
	}
}

function tagscheck(a, id) {
	var lng = document.getElementsByTagName("tr").length;
	for (i = 0; i < lng; i++) {
		var temp = document.getElementsByTagName("tr")[i];
		if (a == temp) {
			// 选中的标签样式
			temp.style.background = "#c4e4ff";
			$.ajax({
				url : "news/newsreview/newsid.htm?id=" + id,
				success : function(data) {
					loadHtml(data);
				}
			})
		} else {
			// 恢复原状
			temp.style.background = "";
		}
	}
}

function AddReview() {
	var str = document.getElementById("content").value;
	if (str == "") {
		alert("输入评论");
	} else {
		$.ajax({
			method : 'post',
			url : 'news/newsreview/add.htm',
			cache : false,
			contentType : false,
			processData : false,
			data : new FormData($("#addReviewForm")[0]),
			success : function(data) {
				loadHtml(data);
			}
		})
	}
}

function zanon(id,cby){
	$.ajax({
		type:'post',
		url:'news/newsreview/zanadd.htm?id='+id+"&cby="+cby,
		success:function(data){
			alert("点赞成功");
			loadHtml(data);
		}
	})
}
