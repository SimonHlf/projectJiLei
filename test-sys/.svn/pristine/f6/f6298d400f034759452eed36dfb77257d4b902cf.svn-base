<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editFrontUserForm">
                <input type="hidden" name="userId" value="${frontUser.userId}">
                <div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">考生手机号</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="cellPhone" maxlength="11" onblur="cell(this);" name="cellPhone" value="${frontUser.cellPhone}"
                                   placeholder="分考生手机号" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">考生姓名</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="nickName" name="nickName" value="${frontUser.nickName}"
                                   placeholder="考生姓名" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">考生工号</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="attr0" name="attr0" value="${frontUser.attr0}"
                                   placeholder="考生工号" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">性别</label>
                        <div class="col-sm-9">
                            <v:items type="sex" id="sex" name="sex" value="${frontUser.sex}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">出生日期</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="birthday" name="birthday"
                                   value="${frontUser.birthday}" placeholder="描述">
                        </div>
                    </div>
                    <%--<div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">图片</label>
                        <div class="col-md-10" style="    left: 0px;">
                            <!-- 上传图片 --> <input type="file" class="default" name="headImages" id="imgs"
                                                 placeholder="图片"/>
                            <span id="pictureSpan"></span>
                        </div>
                    </div>--%>
                   <%-- <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">所属机构</label>
                        <div class="col-sm-9">
                            <select name="orgId" id="orgId">
                                <option>--请选择机构--</option>
                                <c:forEach items="${windyOrgList}" var="windyOrg">
                                    <option value="${windyOrg.id}">${windyOrg.name}</option>
                                </c:forEach>
                            </select>

                        </div>
                    </div>--%>
                <%--    <div class="widget-buttons">
                        <button type="button" onclick="yesofUpdate()" class="btn btn-info btn-ok"> 确认</button>
                        <button type="button" onclick="fanhui()" class="btn btn-default"> 返回</button>
                    </div>--%>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
/*    $(function () {
        var select2 = document.querySelector('select#orgId');
        var option2 = select2.querySelectorAll('option');
        var len2 = option2.length;
        var i2;
        <%--var selectValue2 = '${frontUser.orgId}';--%>
        for (i = 0; i < len2; i++) {
            if (option2[i].value == selectValue2) {
                option2[i].selected = true;
                break;
            }
        }
    })*/
</script>