<%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="news/news/news.js"></script>
<script type="text/javascript" charset="utf-8"
	src="assets/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="assets/ueditor/ueditor.all.min.js">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="assets/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	var editor = UE.getEditor('content');
</script>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addNewsForm">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">标题</label>
					<div class="col-sm-9">
						<input class="form-control" id="title" name="title"
							placeholder="标题" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">分类</label>
					<div class="col-sm-9">

						<%-- <select name="type" id="type">
							<c:forEach items="${newslist }" var="newstype">
								<option value="${newstype.id }">${newstype.name }
							</c:forEach>
						</select> --%>

						<!-- <input class="form-control" id="type" name="type" placeholder="分类" required> -->
						  <v:items type="type" id="type" name="type"/> 
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">标识</label>
					<div class="col-sm-9">
						<input class="form-control" id="label" name="label"
							placeholder="标识">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">状态</label>
					<div class="col-sm-9">
						<!--   <input class="form-control" id="status" name="status" placeholder="状态">  -->
						<v:items type="status" id="status" name="statusNews" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">是否置顶</label>
					<div class="col-sm-9">
						<!--  <input class="form-control" id="is_top" name="is_top" placeholder="是否置顶">  -->
						<v:items type="is_top" id="is_top" name="is_top" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">内容</label>
					<div class="col-sm-9">
						<!--   <input class="form-control" id="content" name="content" placeholder="内容" required> -->
						<textarea name="content" id="content" name="content">这里写你的初始化内容</textarea>
					</div>
				</div>
			</form>
			<button class="btn btn-info" onclick="addNews()">确定</button>
		</div>
	</div>
</div>
