 <%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="shop/problem/problem.js"></script>
<script type="text/javascript" charset="utf-8"
	src="assets/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="assets/ueditor/ueditor.all.min.js">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="assets/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	var editor = UE.getEditor('answer');
</script>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addNewsForm">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">标题</label>
					<div class="col-sm-9">
						<input class="form-control" id="subject" name="subject"
							placeholder="标题" required>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">内容</label>
					<div class="col-sm-9">
						<!--   <input class="form-control" id="content" name="content" placeholder="内容" required> -->
						<textarea id="answer" name="answer">这里写你的初始化内容</textarea>
					</div>
				</div>
			</form>
			<button class="btn btn-info" onclick="addAuction()">确定</button>
		</div>
	</div>
</div>
