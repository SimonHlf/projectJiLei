<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="assets/js/jquery-2.0.3.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/beyond.min.js"></script>
<script src="assets/js/select2/select2.js"></script>
<script src="assets/layui/layui.js"></script>
<script src="assets/echarts/echarts.min.js" charset="utf-8"></script>
<script src="assets/zTree_v3/js/jquery.ztree.all.js"></script>
<script type="text/javascript" src="assets/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="assets/ueditor/ueditor.all.js"></script>
<script src="assets/fileinput/fileinput.js"></script>
<script src="assets/fileinput/fileinput.zh.js"></script>
<script src="assets/fileinput/popper.min.js"></script>
<script src="assets/js/bootstrap-fileupload.min.js"></script>
<script src="assets/js/datetime/jedate.js"></script>
<script>
    layui.config({
        base : '/assets/layui/lay/modules/'
    }).use([ 'layer', 'laydate', 'laypage', 'table' ,'laytpl']);

    //
    var isDialog = "${setting.addIsDialog}";
</script>
<script id="editTpl" type="text/html" charset="UTF-8">
    <div class="widget model_widget">
        <div class="widget-header bordered-bottom bordered-themeprimary">
            <i class="widget-icon fa fa-tasks themeprimary"></i>
            <span class="widget-caption themeprimary">{{d.title}}</span>
        </div>
        <div class="widget-body">
            {{d.body}}
            <div class="widget-buttons">
                <button type="button" class="btn btn-info btn-ok"> 确认</button>
                <button type="button" onclick="{{d.back}}" class="btn btn-default"> 返回</button>
            </div>
        </div>
    </div>
</script>
<script src="assets/windy/js/windy.js"></script>