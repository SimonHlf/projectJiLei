<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <br>
            <p align="center">系统信息</p>
            <br>
            <br>
            <form class="form-horizontal" method="post" id="editSettingForm">
                <input type="hidden" name="id" value="${setting.id}">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">系统名称:</label>
                    <p style="margin-left: 30%;margin-top:10px">${setting.name}</p>
                </div>
                <br>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">简名:</label>
                    <p style="margin-left: 30%;margin-top:10px">${setting.shortName}</p>
                </div>
                <br>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">前端登陆页面背景:</label>
                    <label class="col-sm-2 control-label no-padding-right">
                        <div id="layer-photos-demo" class="layer-photos-demo">
                            <img style="width: 50px;height: 50px;float:right;" src="/${setting.attr0}">
                        </div>
                        <%--<img src="/${setting.attr0}" style="width: 50px;height: 50px;float:right;" alt="">--%>
                    </label>
                </div>
                <br>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">前端输入框 logo:</label>
                    <label class="col-sm-2 control-label no-padding-right"><img src="/${setting.attr1}" onclick="open_(this)" style="width: 50px;height: 50px;float:right;" alt=""></label>
                </div>
                <br>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">前端公司名:</label>
                    <p style="margin-left: 30%;margin-top:10px">${setting.attr2}</p>
                </div>
                <br>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">前端系统名称:</label>
                    <p style="margin-left: 30%;margin-top:10px">${setting.attr3}</p>
                </div>
                <br>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">英文简称:</label>
                    <p style="margin-left: 30%;margin-top:10px">${setting.attr4}</p>
                </div>
                <br>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">前端短语:</label>
                    <p style="margin-left: 30%;margin-top:10px">${setting.attr5}</p>
                </div>
                <br>
                <%--<div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">域名</label>
                    <div class="col-sm-9">
                        <input class="form-control" readOnly id="domain" name="domain" value="${setting.domain}" placeholder="域名" required>
                    </div>
                </div>--%>
                 <%--<div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">记录编号</label>
                    <div class="col-sm-9">
                        <input class="form-control" readOnly id="recordNumber" name="recordNumber" value="${setting.recordNumber}" placeholder="记录编号" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">是否弹窗</label>
                    <div class="col-sm-9">
                        <v:item type="add_is_dialog" value="${setting.addIsDialog}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">是否有组织</label>
                    <div class="col-sm-9">
                        <v:item type="org_is_use" value="${setting.orgIsUse}"/>
                    </div>
                </div>--%>
            </form>
        </div>
         <a class="btn btn-info" onclick="ajaxLoad('setting/list.htm','系统设置')">返回</a>
    </div>
</div>
<script>
    //调用示例
    layer.ready(function(){ //为了layer.ext.js加载完毕再执行
        layer.photos({
            photos: '#layer-photos-demo'
            ,shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
        });
    });
</script>