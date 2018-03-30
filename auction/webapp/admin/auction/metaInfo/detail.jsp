<%@page pageEncoding="utf-8" %>
<script type="text/javascript" src="assets/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="assets/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="assets/ueditor/lang/zh-cn/zh-cn.js"></script>
<div class="btn-group">
  <button type="button" onclick="callback(${page1})" class="btn btn-info">返回</button> 
</div>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editMetaInfoForm">
            <input type="hidden" name="id" value="${meta.id}">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">大师姓名</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="name" name="name" placeholder="大师姓名" value="${meta.name}" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">职称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="positio" name="positio" placeholder="职称" value="${meta.positio}" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">头像</label>
                        <div class="col-sm-9">
                            <img src="/${meta.photo}" width="200px" height="200px">
                        </div>
                    </div>
                    
                    <div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">个人简介</label>
						<div class="col-sm-8">
							<textarea class="content" name="brief" id="brief" disabled>${meta.brief}</textarea>
						</div>
					</div>
					 <div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">艺术家年表</label>
						<div class="col-sm-8">
							<textarea class="content" name="chronology" id="chronology" disabled>${meta.chronology}</textarea>
						</div>
					</div>
					 <div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">获奖情况</label>
						<div class="col-sm-8">
							<textarea class="content" name="award" id="award" disabled>${meta.award}</textarea>
						</div>
					</div>
					 <div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">代表作品</label>
						<div class="col-sm-8">
							<textarea class="content" name="representwork" id="representwork" disabled>${meta.representwork}</textarea>
						</div>
					</div>
                    
                    <script type="text/javascript">
						UE.getEditor('brief',{
					        initialFrameWidth : 650,
					        initialFrameHeight: 400
						});
						UE.getEditor('chronology',{
					        initialFrameWidth : 650,
					        initialFrameHeight: 400
						});
						UE.getEditor('award',{
					        initialFrameWidth : 650,
					        initialFrameHeight: 400
						});
						UE.getEditor('representwork',{
					        initialFrameWidth : 650,
					        initialFrameHeight: 400
						});
						
					</script>
                </div>
            </form>
        </div>
    </div>
</div>
